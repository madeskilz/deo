<?php
class Login_model extends CI_Model
{

    function validate($email, $password)
    {
        $this->db->where('user_email', $email);
        $this->db->where('user_password', $password);
        $result = $this->db->get('users', 1);
        return $result;
    }
    function create_account($data = array()){
        $data['user_level'] = 5;
        $data['active'] = 1;
        try {
            $this->db->insert("users", $data);
            $result = $this->db->insert_id();
        } catch (Exception $e) {
            $result = $e->getMessage();
        }
        return $result;
    }
    function create_exam($data = array()){
        try {
            $this->db->insert("exam", $data);
            $result = $this->db->insert_id();
        } catch (Exception $e) {
            $result = $e->getMessage();
        }
        return $result;
    }
    function create_result($data = array()){
        try {
            $this->db->insert("exam_results", $data);
            $result = $this->db->insert_id();
        } catch (Exception $e) {
            $result = $e->getMessage();
        }
        return $result;
    }
    function applicant($data = array()){
        try {
            $this->db->insert("applicants", $data);
            $result = $this->db->insert_id();
        } catch (Exception $e) {
            $result = $e->getMessage();
        }
        return $result;
    }
}
