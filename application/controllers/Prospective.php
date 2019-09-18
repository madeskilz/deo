<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Prospective extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->session->userdata("logged_in") || $this->session->userdata('level') !== '4') {
            redirect(base_url("login"));
        }
    }
    public function index()
    {
        $p["active"] = "home";
        $p["title"] = "Clearance Home";
        $uid = $this->session->userdata("user_id");
        $this->db->where("user_id", $uid);
        $p['profile'] = $this->db->get("prospective_students", 1)->row();
        $this->load->view('prospective/index', $p);
    }
    public function documents()
    {
        $p["active"] = "documents";
        $p["title"] = "Print Documents";
        $uid = $this->session->userdata("user_id");
        $this->db->where("user_id", $uid);
        $p['profile'] = $this->db->get("prospective_students", 1)->row();
        $this->load->view('prospective/documents', $p);
    }
    public function matric()
    {
        $p["active"] = "matric";
        $p["title"] = "Get Matric Number";
        $uid = $this->session->userdata("user_id");
        $this->db->where("user_id", $uid);
        $p['profile'] = $this->db->get("prospective_students", 1)->row();
        $this->load->view('prospective/matric', $p);
    }
    public function payment()
    {
        $p["active"] = "payment";
        $p["title"] = "Make Payments";
        $uid = $this->session->userdata("user_id");
        $this->db->where("user_id", $uid);
        $p['profile'] = $this->db->get("prospective_students", 1)->row();
        $this->db->where("user_id", $uid);
        $this->db->where("type", 3);
        $this->db->or_where("type", 2);
        $p['payments'] = $this->db->get("payments")->result();
        $this->db->where("code", 1002);
        $this->db->or_where("code", 1003);
        $p['payment_type'] = $this->db->get("payment_type")->result();
        $this->load->view('prospective/payment', $p);
    }
    public function password(){
        if (strtolower($_SERVER['REQUEST_METHOD']) == 'post') {
            $this->change_password();
        }
        $p["active"] = "password";
        $p["title"] = "Change Password";
        $uid = $this->session->userdata("user_id");
        $this->db->where("user_id", $uid);
        $p['profile'] = $this->db->get("prospective_students", 1)->row();
        $this->load->view('prospective/password', $p);
    }
    public function profile(){
        $p["active"] = "profile";
        $p["title"] = "My Profile";
        $uid = $this->session->userdata("user_id");
        $this->db->where("user_id", $uid);
        $p['profile'] = $this->db->get("prospective_students", 1)->row();
        $this->db->where("id", $p['profile']->department);
        $p['program'] = $this->db->get("departments", 1)->row()->program;
        $this->db->where("id", $p['profile']->department);
        $p['school'] = $this->db->get("departments", 1)->row()->school_id;
        $this->load->view('prospective/profile', $p);
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
			redirect("prospective");
        }else{
            $this->session->set_flashdata('error_msg', $result);
			redirect("prospective/password");
        }
    }
}