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
    public function prospective_clearance()
    {
        if (strtolower($_SERVER['REQUEST_METHOD']) == 'post') {
            $this->single_clearance();
        }
        $p["active"] = "prospective";
        $p["title"] = "Student Clearance";
        $p['prospectives'] =  $this->db->get("prospective_students")->result();
        $this->load->view('admin/prospective-clearance', $p);
    }
    public function applicant_exam($batch = "")
    {
        if ($batch == "batch") {
            if (strtolower($_SERVER['REQUEST_METHOD']) == 'post') {
                $this->batch_application_update();
            }
            $p["active"] = "applicant";
            $p["title"] = "Batch Update Applicant Exam";
            $p['applicants'] =  $this->db->get("applicants")->result();
            $this->load->view('admin/applicant-exam-batch', $p);
        } else {
            if (strtolower($_SERVER['REQUEST_METHOD']) == 'post') {
                $this->single_application_update();
            }
            $p["active"] = "applicant";
            $p["title"] = "Applicant Exam";
            $p['applicants'] =  $this->db->get("applicants")->result();
            $this->load->view('admin/applicant-exam', $p);
        }
    }
    private function batch_application_update()
    {
        $exam_scores = $this->input->post('exam_score');
        $user_ids = $this->input->post('user_id');
        $admission_status = $this->input->post('admission_status');
        for ($i = 0; $i < count($user_ids); $i++) {
            $this->db->where("user_id", $user_ids[$i]);
            $score = $this->db->get("application_exam", 1)->row();
            if ($score == null) {
                $data = array(
                    "user_id" => $user_ids[$i],
                    "score" => $exam_scores[$i]
                );
                $this->db->insert("application_exam", $data);
                $this->db->where("user_id", $user_ids[$i]);
                $this->db->set(array("done_exam" => 1, "admission_status" => $admission_status[$i]));
                $this->db->update("applicants");
            } else {
                $this->db->where("user_id", $user_ids[$i]);
                $this->db->set("score", $exam_scores[$i]);
                $this->db->update("application_exam");
                $this->db->where("user_id", $user_ids[$i]);
                $this->db->set(array("done_exam" => 1, "admission_status" => $admission_status[$i]));
                $this->db->update("applicants");
            }
        }
        $this->session->set_flashdata('success_msg', "Batch update successfully completed");
        redirect("admin/applicant_exam");
    }
    private function single_application_update()
    {
        $exam_score = cleanit($this->input->post('exam_score'));
        $admin_stat = cleanit($this->input->post('admission_status'));
        $user_id = $this->input->post('user_id');
        $this->db->where("user_id", $user_id);
        $score = $this->db->get("application_exam", 1)->row();
        if ($score == null) {
            $data = array(
                "user_id" => $user_id,
                "score" => $exam_score
            );
            $this->db->insert("application_exam", $data);
            $this->db->where("user_id", $user_id);
            $this->db->set(array("done_exam" => 1, "admission_status" => $admin_stat));
            $this->db->update("applicants");
        } else {
            $this->db->where("user_id", $user_id);
            $this->db->set("score", $exam_score);
            $this->db->update("application_exam");
            $this->db->where("user_id", $user_id);
            $this->db->set(array("done_exam" => 1, "admission_status" => $admin_stat));
            $this->db->update("applicants");
        }
        $this->session->set_flashdata('success_msg', "Applicant score and status successfully updated");
        redirect("admin/applicant_exam");
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
        $p['details'] = $this->db->get("applicants", 1)->row();
        $this->load->view('admin/password', $p);
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
            redirect("admin");
        } else {
            $this->session->set_flashdata('error_msg', $result);
            redirect("admin/password");
        }
    }
}
