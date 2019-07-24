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
        $p["active"] = "dashboard";
        $this->load->view('prospective/index', $p);
    }
}
