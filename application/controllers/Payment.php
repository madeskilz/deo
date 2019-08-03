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
}
