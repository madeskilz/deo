<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Printer extends CI_Controller
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
    public function printReceipt($reference = "")
    {
        $p = array();
        $p['title'] = "Print Receipt $reference";
        $uid = $this->session->userdata("user_id");
        $this->db->where("reference", $reference);
        $this->db->where("user_id", $uid);
        $this->db->where("status", "approved");
        $payment_details = $this->db->get("payments", 1)->result();
        if (count($payment_details) > 0) {
            $p['payment'] = $payment_details[0];
            $this->db->where("user_id", $uid);
            $p['details'] = $this->db->get("applicants", 1)->row();
            if (!$payment_details[0]->qr_code) {
                $datat = "Payment Reference: " . $payment_details[0]->payment_reference . "\n";
                $datat .= "Amount: " . $payment_details[0]->amount_paid . "\n";
                $datat .= "Full Name: "
                    . $p['details']->lastname . " "
                    . $p['details']->firstname . "\n";
                $datat .= "ID: " . $p["details"]->admission_no . "\n";
                $params['data'] = $datat;
                $qr_image = rand() . '.png';
                $params['level'] = 'H';
                $params['size'] = 8;
                $params['savename'] = FCPATH . "sitefiles/qrcodes/" . $qr_image;
                $this->load->library('ciqrcode');
                if ($this->ciqrcode->generate($params)) {
                    $p["qr_image"] = $qr_image;
                    $this->db->where("reference", $reference);
                    $this->db->where("user_id", $uid);
                    $this->db->where("status", "approved");
                    $this->db->update("payments", array("qr_code" => $qr_image));
                }
            }else{
                $p["qr_image"] = $payment_details[0]->qr_code;
            }
        } else {
            $this->session->set_flashdata('error_msg', "Payment details not found");
            redirect($_SERVER["HTTP_REFERER"]);
        }
        $this->load->view('printer/print-receipt', $p);
    }
    public function applicationForm($ad = ""){
        $user_id = simple_crypt($ad, "d");
        $uid = $this->session->userdata("user_id");
        if(!$user_id == $uid){
            $this->session->set_flashdata('error_msg', "User not found");
            return redirect($_SERVER['HTTP_REFERER']);
        }
        $p['title'] = "Application Form $ad";
        $this->db->where("user_id", $uid);
        $p['details'] = $this->db->get("applicants", 1)->row();
        $this->load->view('printer/application-form', $p);
    }
}
