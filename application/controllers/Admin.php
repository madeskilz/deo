<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Admin extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->session->userdata("logged_in") || $this->session->userdata('level') !== '1') {
            redirect(base_url("login"));
        }
    }
    public function index()
    {
        $p["active"] = "dashboard";
        $p["title"] = "Dashboard";
        $uid = $this->session->userdata("user_id");
        $this->db->where("user_id", $uid);
        $p['details'] = $this->db->get("applicants", 1)->row();
        $this->db->where("user_id", $uid);
        $p['exams'] =  $this->db->get("exam")->result();
        $this->load->view('admin/index', $p);
    }
    public function payments()
    {
        $p["active"] = "payment";
        $p["title"] = "All Payments";
        $p['payments'] =  $this->db->get("payments")->result();
        $this->load->view('admin/payments', $p);
    }
    public function password(){
        if (strtolower($_SERVER['REQUEST_METHOD']) == 'post') {
            $this->change_password();
        }
        $p["active"] = "password";
        $p["title"] = "Change Password";
        $uid = $this->session->userdata("user_id");
        $this->db->where("user_id", $uid);
        $p['details'] = $this->db->get("applicants", 1)->row();
        $this->load->view('admin/password', $p);
    }
    private function change_password(){
        $uid = $this->session->userdata("user_id");
        $email = $this->session->userdata("email");
        $data = array();
        $data["old_password"] = cleanit($this->input->post('old_password'));
        $data["new_password"] = cleanit($this->input->post('new_password'));
        $data["user_id"] = $uid;
        $data["email"] = $email;
        $result = $this->login_model->change_password($data);
        if($result > 0){
            $this->session->set_flashdata('success_msg', "Password successfully changed");
			redirect("admin");
        }else{
            $this->session->set_flashdata('error_msg', $result);
			redirect("admin/password");
        }
    }
}
