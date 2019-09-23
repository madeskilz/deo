<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Student extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->session->userdata("logged_in") || $this->session->userdata('level') !== '3') {
            redirect(base_url("login"));
        }
    }
    public function index()
    {
        $p["active"] = "dashboard";
        $p["title"] = "Student Dashboard";
        $uid = $this->session->userdata("user_id");
        $this->db->where("user_id", $uid);
        $p['profile'] = $this->db->get("students", 1)->row();
        $this->load->view('student/index', $p);
    }
    public function course()
    {
        $p["active"] = "course";
        $p["title"] = "My Courses";
        $uid = $this->session->userdata("user_id");
        $this->db->where("user_id", $uid);
        $p['profile'] = $this->db->get("students", 1)->row();
        $this->db->where("id", $p['profile']->department);
        $p['program'] = get_program($this->db->get("departments", 1)->row()->program);
        $this->db->where("user_id", $p['profile']->user_id);
        $p['level'] = $this->db->get("student_level", 1)->row();
        $this->db->where("id", $p['profile']->department);
        $p['school'] = get_school($this->db->get("departments", 1)->row()->school_id);
        $this->load->view('student/course', $p);
    }
    public function password()
    {
        if (strtolower($_SERVER['REQUEST_METHOD']) == 'post') {
            $this->change_password();
        }
        $p["active"] = "password";
        $p["title"] = "Change Password";
        $uid = $this->session->userdata("user_id");
        $this->db->where("user_id", $uid);
        $p['profile'] = $this->db->get("students", 1)->row();
        $this->load->view('student/password', $p);
    }
    public function profile()
    {
        $p["active"] = "profile";
        $p["title"] = "My Profile";
        $uid = $this->session->userdata("user_id");
        $this->db->where("user_id", $uid);
        $p['profile'] = $this->db->get("students", 1)->row();
        $this->db->where("id", $p['profile']->department);
        $p['program'] = $this->db->get("departments", 1)->row()->program;
        $this->db->where("user_id", $p['profile']->user_id);
        $p['level'] = $this->db->get("student_level", 1)->row();
        $this->db->where("id", $p['profile']->department);
        $p['school'] = $this->db->get("departments", 1)->row()->school_id;
        $this->load->view('student/profile', $p);
    }
    private function change_password()
    {
        $uid = $this->session->userdata("user_id");
        $email = $this->session->userdata("email");
        $data = array();
        $data["old_password"] = cleanit($this->input->post('old_password'));
        $data["new_password"] = cleanit($this->input->post('new_password'));
        $data["user_id"] = $uid;
        $data["email"] = $email;
        $result = $this->login_model->change_password($data);
        if ($result > 0) {
            $this->session->set_flashdata('success_msg', "Password successfully changed");
            redirect("student");
        } else {
            $this->session->set_flashdata('error_msg', $result);
            redirect("student/password");
        }
    }
}
