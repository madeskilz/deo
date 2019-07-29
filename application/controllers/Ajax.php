<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Ajax extends CI_Controller
{

    public $product_name_rules = '.+';

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        redirect(base_url());
    }


    // Fetch dept by school and programme
    function get_dept()
    {
        if ($this->input->is_ajax_request()) {
            $pid = cleanit($this->input->post('pid'));
            $sid = cleanit($this->input->post('sid'));
            $this->db->where("program", $pid);
            $this->db->where("school_id", $sid);
            $dept = $this->db->get("departments")->result_array();
            header('Content-type: text/json');
            header('Content-type: application/json');
            echo json_encode($dept);
            exit;
        } else {
            redirect(base_url());
        }
    }
    // Fetch lga by state
    function get_lga()
    {
        if ($this->input->is_ajax_request()) {
            $sid = cleanit($this->input->post('sid'));
            $this->db->where("state_id", $sid);
            $dept = $this->db->get("locals")->result_array();
            header('Content-type: text/json');
            header('Content-type: application/json');
            echo json_encode($dept);
            exit;
        } else {
            redirect(base_url());
        }
    }
}
