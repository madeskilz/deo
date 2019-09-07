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
        $this->load->library("deolib");
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
    public function verifyPayment($ref = "")
    {
        $uid = $this->session->userdata("user_id");
        $q = "SELECT * FROM payments WHERE reference = '$ref'";
        $q .= ($this->session->userdata("level") == "1") ? "" : " AND user_id = '$uid'";
        // var_dump($q);exit;
        $row = $this->db->query($q, 1)->row();
        $table['type'] = "";
        $table['txn_ref'] = $ref;
        if (!$row) {
            $this->session->set_flashdata('error_msg', "Transaction not found");
            redirect($_SERVER["HTTP_REFERER"]);
        } else {
            if ($row->type == "1") {
                $table['type'] = "applicants";
            } elseif ($row->type == "2") {
                $table['type'] = "prospective_students";
            } elseif ($row->type == "3") {
                $table['type'] = "prospective_students";
            }
            $this->db->where("id", $row->type);
            $pay_item = $this->db->get("payment_type", 1)->row();
            //todo
            $product_id = 6207; //$pay_item->code;
            $amount = $pay_item->total;
            $curl_info_data  = array('txn_ref'   => $ref, 'amount'    => $amount, 'product_id' =>  $product_id);
            $response = $this->deolib->interswitch_curl($curl_info_data); // return a JSON
            // var_dump($response);
            // exit;
            switch ($response['ResponseCode']) {
                case '00':
                    // Confirm. Payment made successfully. :)
                    $this->update_payment_status($table, $response);
                    break;
                case 'Z0':
                    // Transaction not completed status - Requery
                    $response = $this->deolib->interswitch_curl($curl_info_data);
                    if ($response['ResponseCode'] == 'Z0' || $response['ResponseCode'] == '10001') {
                        $this->update_payment_status($table, $response, false);
                    } else {
                        $this->update_payment_status($table, $response);
                    }
                    break;
                case '10001':
                    // Transaction not completed status - Requery
                    $response = $this->deolib->interswitch_curl($curl_info_data);
                    if ($response['ResponseCode'] == '10001' || $response['ResponseCode'] == 'Z0') {
                        $this->update_payment_status($table, $response, false);
                    } else {
                        $this->update_payment_status($table, $response);
                    }
                    break;
                default:
                    $this->update_payment_status($table, $response, false);
                    break;
            }
        }
    }
    public function interswitch()
    {
        // Check the txn_ref session and validate the token
        $token = $this->input->get('t', true);
        $student_type['txn_ref'] = $txn_ref = $this->session->userdata('txn_ref');
        $student_type['type'] = $this->session->userdata('table_type');
        // var_dump($student_type['type']);exit;
        $is_token = simple_crypt($token, 'd');
        if ($txn_ref && ($txn_ref == $is_token)) {
            $amount = $this->session->userdata('amount');
            $product_id = $this->session->userdata('payment_id');
            $curl_info_data  = array('txn_ref'   => $txn_ref, 'amount'    => $amount, 'product_id' =>  $product_id);
            $response = $this->deolib->interswitch_curl($curl_info_data); // return a JSON
            // var_dump($_POST);
            // var_dump($_GET);
            // var_dump($response);
            // exit;
            switch ($response['ResponseCode']) {
                case '00':
                    // Confirm. Payment made successfully. :)
                    $this->update_payment_status($student_type, $response);
                    break;
                case 'Z0':
                    // Transaction not completed status - Requery
                    $response = $this->deolib->interswitch_curl($curl_info_data);
                    if ($response['ResponseCode'] == 'Z0' || $response['ResponseCode'] == '10001') {
                        $this->update_payment_status($student_type, $response, false);
                    } else {
                        $this->update_payment_status($student_type, $response);
                    }
                    break;
                case '10001':
                    // Transaction not completed status - Requery
                    $response = $this->deolib->interswitch_curl($curl_info_data);
                    if ($response['ResponseCode'] == '10001' || $response['ResponseCode'] == 'Z0') {
                        $this->update_payment_status($student_type, $response, false);
                    } else {
                        $this->update_payment_status($student_type, $response);
                    }
                    break;
                default:
                    $this->update_payment_status($student_type, $response, false);
                    break;
            }
        } else {
            $this->session->set_flashdata('error_msg', 'There was an error valdating your transansaction.');
            redirect(base_url("applicant/payment"));
        }
    }
    private function testmail()
    {
        $mail_data = array(
            'from' => 'payment@deogratiaspoly.edu.ng',
            'reply_to' => 'info@deogratiaspoly.edu.ng',
            'subject' => "Payment 1020 Successful",
        );
        $msg = "";
        $mail_data['mail_to'] = array("michaeladekoniye@gmail.com");
        $msg .= "Dear Lukas Grayham, \r\n"
            . "Your payment of Panadol \r\n"
            . "with the total amount of $12 \r\n"
            . "via Quickteller was successful. \r\n"
            . "your payment reference number is 1020\r\n"
            . "contact info@deogratiaspoly.edu.ng for any enquiries. \r\n"
            . "\r\n\r\n Thanks, \r\n Deogratias Polytecnic";
        $mail_data['message'] = $msg;
        var_dump($this->deolib->send_email($mail_data));
        exit;
    }
    private function update_payment_status($data, $response, $status = true)
    {
        $ret = array('status' => 'error');
        $uid = $this->session->userdata('user_id');
        $ref = $data["txn_ref"];
        $controller = "";
        $this->db->where("reference", $ref);
        $payment = $this->db->get("payments", 1)->row();
        $payment_paid = ($payment->type == "3") ? "paid_school_fee" : "paid_acceptance_fee";
        if ($data['type'] == "applicants") {
            $controller = "applicant";
        } elseif ($data['type'] == "prospective_students") {
            $controller = "prospective";
        }
        if ($status) {
            // Success
            $PaymentReference = (isset($response['PaymentReference'])) ? $response['PaymentReference'] : null;
            $RetrievalReferenceNumber = (isset($response['RetrievalReferenceNumber'])) ? $response['RetrievalReferenceNumber'] : null;
            $update_data = array(
                'status' => 'approved',
                'payment_status' => $response['ResponseDescription'],
                'payment_reference' => $PaymentReference,
                'response_description' => $RetrievalReferenceNumber,
                'amount_paid' => $response['Amount'] / 100,
                'response_code' => $response['ResponseCode']
            );
            // var_dump("wale",$data['type']);exit;
            // update the record to payment table
            $table = "";
            $cell = "";
            if ($data['type'] == "applicants") {
                $table = "applicants";
                $cell = "paid_application_fee";
            } else if ($data['type'] == "prospective_students") {
                $table = "prospective_students";
                $cell = $payment_paid;
            }
            $this->db->where("user_id", $uid);
            $pers = $this->db->get($table, 1)->row();
            $this->db->where("id", $payment->type);
            $p_item = $this->db->get("payment_type", 1)->row();
            $mail_data = array(
                'from' => 'payment@deogratiaspoly.edu.ng',
                'reply_to' => 'info@deogratiaspoly.edu.ng',
                'subject' => "Payment $ref Successful",
            );
            $msg = "";
            $mail_data['mail_to'] = array($this->session->userdata("email"));
            $msg .= "Dear $pers->lastname $pers->firstname, \r\n"
                . "Your payment of $p_item->name \r\n"
                . "with the total amount of $p_item->total \r\n"
                . "via Quickteller was successful. \r\n"
                . "your payment reference number is $ref \r\n"
                . "contact info@deogratiaspoly.edu.ng for any enquiries. \r\n"
                . "\r\n\r\n Thanks, \r\n Deogratias Polytecnic";
            $mail_data['message'] = $msg;
            $this->db->trans_start();
            $this->db->where("reference", $ref);
            $this->db->set($update_data);
            $this->db->update("payments");
            /////
            $this->db->where("user_id", $uid);
            $this->db->set(array($cell => 1));
            $this->db->update($table);
            $this->db->trans_complete();
            if ($this->db->trans_status() === FALSE) {
                $this->db->trans_rollback();
                $ret['message'] = "There was an error updating your payment. Please contact us if debited.";
                $this->session->set_flashdata('error_msg', $ret['message']);
                if ($this->session->userdata("level") == "1") {
                    redirect("admin/payments");
                } else {
                    redirect("$controller/payment");
                }
            } else {
                $this->db->trans_commit();
                $this->deolib->send_email($mail_data);
                $ret['status'] = 'success';
                $ret['message'] = "Payment successfull "
                    . "<br>Status: " . $response['ResponseDescription']
                    . "<br>Please proceed to print your payment receipt."
                    . "<br>Your transaction Reference is : " . $_POST['txnref'];
                $this->session->set_flashdata('msg', $ret['message']);
                if ($this->session->userdata("level") == "1") {
                    redirect("admin/payments");
                } else {
                    redirect("$controller/payment");
                }
            }
        } else {
            // Failure
            $PaymentReference = (isset($response['PaymentReference'])) ? $response['PaymentReference'] : null;
            $RetrievalReferenceNumber = (isset($response['RetrievalReferenceNumber'])) ? $response['RetrievalReferenceNumber'] : null;
            $update_data = array(
                'status' => 'failed',
                'payment_status' => $response['ResponseDescription'],
                'payment_reference' => $PaymentReference,
                'response_description' => $RetrievalReferenceNumber,
                'amount_paid' => $response['Amount'] / 100,
                'response_code' => $response['ResponseCode']
            );
            $this->db->where("reference", $ref);
            $this->db->set($update_data);
            $this->db->update("payments");
            $ret['message'] = /*"Server responded with code "
                . $response['ResponseCode']
                . */ "Error: " . $response['ResponseDescription']
                . "<br>Transaction failed Due to " . (!isset($_POST['desc']) ? $response['ResponseDescription'] : $_POST['desc'])
                . "<br>Please try again or contact us if persist."
                . "<br>Transaction Reference is : " . $ref;
            $this->session->set_flashdata('error_msg', $ret['message']);
            if ($this->session->userdata("level") == "1") {
                redirect("admin/payments");
            } else {
                redirect("$controller/payment");
            }
        }
    }
}
