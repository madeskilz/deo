<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Applicant extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        if (!$this->session->userdata("logged_in") || $this->session->userdata('level') !== '5') {
            redirect(base_url("login"));
        }
    }
    public function index()
    {
        $p["active"] = "dashboard";
        $p["title"] = "Application Form";
        $uid = $this->session->userdata("user_id");
        $this->db->where("user_id", $uid);
        $p['details'] = $this->db->get("applicants", 1)->row();
        $p['exams'] =  $this->db->get("exam")->result();
        $this->load->view('applicant/index', $p);
    }
    public function result()
    {
        if (strtolower($_SERVER['REQUEST_METHOD']) == 'post') {
            $this->upload_result();
        }
        $p["active"] = "result";
        $p["title"] = "O'Level Results";
        $uid = $this->session->userdata("user_id");
        $this->db->where("user_id", $uid);
        $this->db->set(array("confirm_details" => 1));
        $this->db->update("applicants");
        $p['details'] = $this->db->get("applicants", 1)->row();
        if($p['details']->uploaded_result){
            redirect(base_url("applicant"));
        }
        $p['subjects'] = $this->db->get("subjects")->result();
        $p['exam_types'] = $this->db->get("exam_type")->result();
        $this->load->view('applicant/result', $p);
    }
    private function upload_result()
    {
        $uid = $this->session->userdata("user_id");
        $exam_data = array();
        $exam_sitting = cleanit($this->input->post('exam_sitting'));
        //for exam table
        $exam_data["user_id"] = $uid;
        $exam_data["exam_type"] = cleanit($this->input->post('exam_type'));
        $exam_data["exam_no"] = cleanit($this->input->post('exam_no'));
        $exam_data["exam_year"] = cleanit($this->input->post('exam_year'));
        var_dump($exam_data["exam_year"]);exit;
        //subjects
        $subject = $this->input->post('subject');
        $grade = $this->input->post('grade');

        $result = $this->login_model->create_exam($exam_data);
        if ($result > 0) {
            for ($i = 0; $i < count($subject); $i++) {
                $result_data = array();
                $result_data['exam_id'] = $result;
                $result_data['subject'] = $subject[$i];
                $result_data['grade'] = $grade[$i];
                $this->login_model->create_result($result_data);
            }
        } else {
            redirect("applicant/result");
        }
        if ($exam_sitting == 2) {
            //for exam table
            $exam_data["user_id"] = $uid;
            $exam_data["exam_type"] = cleanit($this->input->post('exam_type2'));
            $exam_data["exam_no"] = cleanit($this->input->post('exam_no2'));
            $exam_data["exam_year"] = cleanit($this->input->post('exam_year2'));
            //subjects
            $subject = $this->input->post('subject2');
            $grade = $this->input->post('grade2');

            $result = $this->login_model->create_exam($exam_data);
            if ($result > 0) {
                for ($i = 0; $i < count($subject); $i++) {
                    $result_data = array();
                    $result_data['exam_id'] = $result;
                    $result_data['subject'] = $subject[$i];
                    $result_data['grade'] = $grade[$i];
                    $this->login_model->create_result($result_data);
                }
            }
        }
        $this->db->where("user_id", $uid);
        $this->db->set(array("uploaded_result" => 1, "exam_sitting"=>$exam_sitting));
        $this->db->update("applicants");
        redirect(base_url("applicant"));
    }
}
