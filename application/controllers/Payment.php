<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Payment extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->session->userdata("logged_in")) {
            redirect(base_url("login"));
        }
    }
    public function index()
    {
        redirect(base_url());
    }
    public function verifyOnlinePayment($id = 0)
    {
        // var_dump($id);exit;
        $response = array('status' => 'error');
        // Get row of the transaction
        $this->db->where("id", $id);
        $uid = $this->session->userdata("user_id");
        $this->db->where("user_id", $uid);
        $row = $this->db->get("payments", 1)->row();
        $paystackreference = $row->payment_reference;
        $ref = $row->reference;
        if (!$row) {
            $this->session->set_flashdata('error_msg', "Transaction not found");
            redirect("applicant/payment");
        } else {
            $amount = (float) $row->amount + (float) $row->charge;
            $url = 'https://api.paystack.co/transaction/verify/' . $paystackreference;
            try {
                $resource = curl_init();
                // Check if initialization had gone wrong*    
                if ($resource === false) {
                    throw new Exception('failed to initialize');
                }
                curl_setopt($resource, CURLOPT_URL, $url);
                curl_setopt($resource, CURLOPT_RETURNTRANSFER, true);
                curl_setopt(
                    $resource,
                    CURLOPT_HTTPHEADER,
                    ['Authorization: Bearer ' . SECRET_KEY]
                );
                curl_setopt($resource, CURLOPT_CUSTOMREQUEST, 'GET');
                $request = curl_exec($resource);
                // Check the return value of curl_exec(), too
                if ($request === false) {
                    throw new Exception(curl_error($resource), curl_errno($resource));
                }
                // Close curl handle
                curl_close($resource);
            } catch (Exception $e) {
                trigger_error(
                    sprintf(
                        'Curl failed with error #%d: %s',
                        $e->getCode(),
                        $e->getMessage()
                    ),
                    E_USER_ERROR
                );
            }
            if ($request) {
                $result = json_decode($request, true);
                if ($result) {
                    if ($result['data']) {
                        if ($result['data']['status'] == 'success') {
                            $this->db->trans_start();
                            $paystack_amount = $result['data']['amount'] / 100;
                            $amount_paid = $paystack_amount;
                            $set_data = array(
                                'status' => 'approved',
                                'payment_status' => $result['message'],
                                'amount_paid' => $amount_paid
                            );
                            $this->db->where("reference", $ref);
                            $this->db->set($set_data);
                            $this->db->update("payments");
                            $this->db->where("user_id", $row->user_id);
                            $this->db->set(array("paid_application_fee" => 1));
                            $this->db->update("applicants");
                            $this->db->trans_complete();
                            if ($this->db->trans_status() === FALSE) {
                                $this->db->trans_rollback();
                                $response['message'] = "There was an error updating your payment. Please contact us if debited.";
                                $this->session->set_flashdata('error_msg', $response['message']);
                                redirect("applicant/payment");
                            } else {
                                $this->db->trans_commit();
                                $response['status'] = 'success';
                                $response['message'] = "Transaction successful.";
                                $this->session->set_flashdata('success_msg', $response['message']);
                                redirect("applicant/payment");
                            }
                        } else {
                            $response['message'] = "Transaction was unsuccessful, please contact us if debited.";
                            $this->session->set_flashdata('error_msg', $response['message']);
                            redirect("applicant/payment");
                        }
                    } else {
                        $response['message'] = $result['message'];
                        $this->session->set_flashdata('error_msg', $response['message']);
                        redirect("applicant/payment");
                    }
                } else {
                    $response['message'] = "Technical Error. Please contact us if persist.";
                    $this->session->set_flashdata('error_msg', $response['message']);
                    redirect("applicant/payment");
                }
            } else {
                $response['message'] = "Error";
                $this->session->set_flashdata('error_msg', $response['message']);
                redirect("applicant/payment");
            }
        }
    }
    public function interswitch()
    {
        // Check the txn_ref session and validate the token
        $token = $this->input->get('t', true);
        $txn_ref = $this->session->userdata('txn_ref');
        $is_token = simple_crypt($token, 'd');
        if ($txn_ref && ($txn_ref == $is_token)) {
            $amount = $this->session->userdata('amount');
            $product_id = $this->session->userdata('payment_id');
            $curl_info_data  = array('txn_ref'   => $txn_ref, 'amount'    => $amount, 'product_id' =>  $product_id);
            $response = $this->sitelib->interswitch_curl($curl_info_data); // return a JSON
            switch ($response['ResponseCode']) {
                case '00':
                    // Confirm. Payment made successfully. :)
                    $this->update_payment_status($response);
                    break;
                case 'Z0':
                    // Transaction not completed status - Requery
                    $response = $this->sitelib->interswitch_curl($curl_info_data);
                    if ($response['ResponseCode'] == 'Z0') {
                        $this->update_payment_status($response, false);
                    } else {
                        $this->update_payment_status($response);
                    }
                    break;
                default:
                    $this->update_payment_status($response, false);
                    break;
            }
        } else {
            $this->session->set_flashdata('error_msg', 'There was an error valdating your transansaction.');
            redirect(base_url("applicant/payment"));
        }
    }
    private function update_payment_status($response, $status = true)
    {
        $uid = $this->session->userdata('user_id');
        $this->db->where('user_id', $uid);
        $profile = $this->db->get('applicants',1)->row();
        if ($status) {
            // Success
            $PaymentReference = (isset($response['PaymentReference'])) ? $response['PaymentReference'] : null;
            $RetrievalReferenceNumber = (isset($response['RetrievalReferenceNumber'])) ? $response['RetrievalReferenceNumber'] : null;
            $row = $this->product->get_row('orders', 'status', array('order_code' => $order_code));
            $json_array = json_decode($row->status, true);
            $array = array("success" => array('msg' => "Order payment was successful: {$response['ResponseDescription']}", 'datetime' => get_now()));
            $status_array = array_merge($json_array, $array);
            $status_array = json_encode($status_array);
            $update_data = array(
                'active_status' => 'certified',
                'payment_made' => 'success',
                'status'  => $status_array,
                'paymentDesc'   => $response['ResponseDescription'],
                'payRef'        => $PaymentReference,
                'retRef'        => $RetrievalReferenceNumber,
                'apprAmt'       => $response['Amount'] / 100,
                'responseCode'  => $response['ResponseCode']
            );
            // Insert the record to payment table

            // show order complete page
            try {
                $this->product->update_items($order_code, $update_data);
                $this->session->set_flashdata('success_msg', 'Thank you for shopping with us, your order has been received.');
                redirect('order_completed');
            } catch (Exception $e) { }
        } else {
            $PaymentReference = (isset($response['PaymentReference'])) ? $response['PaymentReference'] : null;
            $RetrievalReferenceNumber = (isset($response['RetrievalReferenceNumber'])) ? $response['RetrievalReferenceNumber'] : null;
            $row = $this->product->get_row('orders', 'status', array('order_code' => $order_code));
            $json_array = json_decode($row->status, true);
            $array = array("cancelled" => array('msg' => "Order was marked as cancelled : {$response['ResponseDescription']}", 'datetime' => get_now()));
            $status_array = array_merge($json_array, $array);
            $status_array = json_encode($status_array);
            $update_data = array(
                'active_status' => 'cancelled',
                'status'  => $status_array,
                'payment_made' => 'fail',
                'paymentDesc'   => $response['ResponseDescription'],
                'payRef'        => $PaymentReference,
                'retRef'        => $RetrievalReferenceNumber,
                'apprAmt'       => $response['Amount'] / 100,
                'responseCode'  => $response['ResponseCode']
            );
            try {
                $this->product->update_items($order_code, $update_data);
                $buyer['name'] = $profile->first_name . ' ' . $profile->last_name;
                $buyer['email'] = $profile->email;

                $this->myemail->paymentUncompleted($order_code, $buyer);

                // Release the order quantity
                $orders = $this->product->get_result('orders', 'qty,product_variation_id', "(order_code = '{$order_code}')");
                foreach ($orders as $order) {
                    $this->product->set_field('product_variation', 'quantity', "quantity+{$order->qty}", array('id' => $order->product_variation_id));
                }
                // Lets also send a message
                if (SMS_FOR_ORDERS) {
                    $buyer_message = "Dear " . ucfirst($profile->first_name) . ", your order {$order_code} payment was not successful: {$response['ResponseDescription']}. check your email for complete details. Thank you!";
                    $sms_array = array($profile->phone => $buyer_message);
                    $this->load->library('AfricaSMS', $sms_array);
                    $this->africasms->sendsms();
                }
            } catch (Exception $e) { }
            $txn_ref = $this->session->userdata('txn_ref');
            $this->session->set_flashdata('error_msg', "We couldn't validate the payment, please try again. Reason: {$response['ResponseDescription']}, Transaction Reference: {$txn_ref}. If error persist please contact us.");
            $this->session->unset_userdata(array('inter', 'order_code', 'txn_ref', 'amount'));
            redirect(base_url());
        }
    }
}
