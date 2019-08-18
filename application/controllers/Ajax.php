<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Ajax extends CI_Controller
{

    public $product_name_rules = '.+';

    public function __construct()
    {
        parent::__construct();
        if (!$this->input->is_ajax_request()) {
            redirect(base_url());
        }
    }

    public function index()
    {
        redirect(base_url());
    }


    // Fetch dept by school and programme
    public function get_dept()
    {
        $pid = cleanit($this->input->post('pid'));
        $sid = cleanit($this->input->post('sid'));
        $this->db->where("program", $pid);
        $this->db->where("school_id", $sid);
        $dept = $this->db->get("departments")->result_array();
        header('Content-type: text/json');
        header('Content-type: application/json');
        echo json_encode($dept);
        exit;
    }
    // Fetch lga by state
    public function get_lga()
    {
        $sid = cleanit($this->input->post('sid'));
        $this->db->where("state_id", $sid);
        $dept = $this->db->get("locals")->result_array();
        header('Content-type: text/json');
        header('Content-type: application/json');
        echo json_encode($dept);
        exit;
    }
    public function pay_application_fee()
    {
        $response = array();
        $response['status'] = 'error';
        $charge = 2000;
        $data = array();
        $data["reference"] = generate_code('payments', 'reference');
        $data["user_id"] = $this->session->userdata('user_id');
        $data["type"] = 1;
        $data["status"] = "pending";
        $data["method"] = "online";
        $data["payment_status"] = "pending";
        $data["amount"] = 5000;
        $data["amount_paid"] = 0;
        $data["charge"] = $charge;
        if ($this->db->insert("payments", $data)) {
            $response['status'] = 'success';
            $response['message'] = $data["reference"];
            $response['key'] = PUBLIC_KEY;
            $response['amount'] = 700000; //paystack uses kobo
            return_response($response);
        } else {
            $response['message'] = 'There was an error registering transaction';
            return_response($response);
        }
    }

    function interswitchWebpay()
    {
        if ($this->input->is_ajax_request()) {
            if (!empty($item_left) && !empty($total)) {

                //do the normal datainit, and insert to payments table 
                if ($this->product->insert_batch('orders', $data)) {
                    // Remove the product quantity Item
                    $this->product->set_field('product_variation', 'quantity', "quantity-{$product['qty']}", array('id' => $product['options']['variation_id']));
                    unset($data); // Fore data leaching...
                    // check the payment method, if Interswitch (2) compile the array session
                    $token = simple_crypt($txn_ref, 'e');
                    $amt = $total * 100;
                    if ((int) $payment_method == 2) {
                        $redirect_url =  base_url('interswitch/response/?t=' . $token);
                        $hash = hash('SHA512', $txn_ref . INTERSWITCH_PRODUCT_ID . INTERSWITCH_PAY_ITEM_ID . $amt . $redirect_url . INTERSWITCH_MAC_KEY);
                        $profile = $this->product->get_row('users', 'first_name, last_name', array('id' => $buyer_id));
                        $name = $profile->first_name . ' ' . $profile->last_name;
                        $interswitch_session = array(
                            'product_id'    =>  INTERSWITCH_PRODUCT_ID,
                            'pay_item_id'   =>  INTERSWITCH_PAY_ITEM_ID,
                            'amount'        =>  $amt,
                            'currency'      =>  566,
                            'site_redirect_url' => $redirect_url,
                            'txn_ref'       =>  $txn_ref,
                            'cust_id'       => $buyer_id,
                            'cust_name'     => $name,
                            'hash'          => $hash
                        );
                        $this->session->set_userdata(array('inter' => $interswitch_session));
                    }
                    // Send mail to admin
                    $this->session->set_userdata(array('order_code' => $order_code, 'txn_ref' => $txn_ref, 'amount' => $amt));
                    $return['status'] = 'success';
                    echo json_encode($return);
                    exit;
                } else {
                    $return['message'] = 'There was an error processing your order.';
                    echo json_encode($return);
                    exit;
                }
            }
        } else {
            redirect(base_url());
        }
    }
    public function verifyPaystack()
    {
        $response = array('status' => 'error');
        $paystackreference = $this->input->post('reference', true);
        $ref = $this->input->post('ref', true);
        // Get row of the transaction
        $this->db->where("reference", $ref); //ZvKXOmg9XIUJcY54
        $this->db->set(array("payment_reference" => $paystackreference));
        $this->db->update("payments");
        $this->db->where("reference", $ref);
        $row = $this->db->get("payments", 1)->row();
        if (!$row) {
            $response['message'] = "Transaction not found";
            return_response($response);
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
                                return_response($response);
                            } else {
                                $this->db->trans_commit();
                                $response['status'] = 'success';
                                $response['message'] = "Transaction successful.";
                                return_response($response);
                            }
                        } else {
                            $response['message'] = "Transaction was unsuccessful, please contact us if debited.";
                            return_response($response);
                        }
                    } else {
                        $response['message'] = $result['message'];
                        return_response($response);
                    }
                } else {
                    $response['message'] = "Technical Error. Please contact us if persist.";
                    return_response($response);
                }
            } else {
                $response['message'] = "Error";
                return_response($response);
            }
        }
    }
    public function login()
    {
        $result = array("status" => "error");
        $email    = cleanit($this->input->post('email'));
        $password = md5(cleanit($this->input->post('password')));
        $validate = $this->login_model->validate($email, $password);
        if ($validate->num_rows() > 0) {
            $data  = $validate->row_array();
            $user_id  = $data['user_id'];
            $email = $data['user_email'];
            $level = $data['user_level'];
            $active  = $data['active'];
            $sesdata = array(
                'user_id'  => $user_id,
                'email'     => $email,
                'level'     => $level,
                'active'     => $active,
                'logged_in' => TRUE
            );
            if ($active == 1) {
                $this->session->set_userdata($sesdata);
                $result['status'] = "success";
                return_response($result);
            } else {
                $result["message"] = 'Account Suspended';
                return_response($result);
            }
        } else {
            $result['message'] = 'Username or Password is Wrong';
            return_response($result);
        }
    }
    public function myresult()
    {
        $uid = $this->session->userdata("user_id");
        $result = array("status" => "error");
        $this->db->where("user_id", $uid);
        $r = $this->db->get("application_exam", 1)->row();
        $this->db->where("user_id", $uid);
        $p = $this->db->get("applicants", 1)->row();
        if (!$r) {
            $result['message'] = "Your exam score is 0";
            return_response($result);
        }
        $result["status"] = "success";
        if ((int) $r->score < 40) {
            $result['status'] = "error";
        }
        $result['message'] = "Your exam score is $r->score";
        $result['admission_status'] = $p->admission_status;
        return_response($result);
    }
}
