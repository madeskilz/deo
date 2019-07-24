<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Auth extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->helper('url');
        $this->load->model('login_model');
    }
    public function index()
    {
        redirect("auth/login");
    }
    public function login()
    {
        if ($this->session->userdata("logged_in")){
            $active = $this->session->userdata("active");
            $level = $this->session->userdata("level");
            if ($active == 1) {
                die($level);
                //1 = admin
                //2 = lecturer/staff
                //3 = returning-student
                //4 = prospective-students
                if ($level === '1') {
                    redirect('admin');
                } elseif ($level === '2') {
                    redirect('staff');
                } elseif ($level === '3') {
                    redirect('returning');
                }else {
                    redirect('prospective');
                }
            }
        }
        if (strtolower($_SERVER['REQUEST_METHOD']) == 'post') {
            $this->auth();
        }
        $p["title"] = "Login";
        $p["active"] = "login";
        $this->load->view('home/login', $p);
    }
    function auth()
    {
        $email    = $this->input->post('email', TRUE);
        $password = md5($this->input->post('password', TRUE));
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
                //1 = admin
                //2 = lecturer/staff
                //3 = returning-student
                //4 = prospective-students
                $this->session->set_userdata($sesdata);
                if ($level === '1') {
                    redirect('admin');
                } elseif ($level === '2') {
                    redirect('staff');
                } elseif ($level === '3') {
                    redirect('returning');
                } else{
                    redirect('prospective');
                }
            }else {
                echo $this->session->set_flashdata('msg', 'Account Suspended');
                redirect('login');
            }
        } else {
            echo $this->session->set_flashdata('msg', 'Username or Password is Wrong');
            redirect('login');
        }
    }
    function logout()
    {
        $this->session->sess_destroy();
        redirect('login');
    }
}
