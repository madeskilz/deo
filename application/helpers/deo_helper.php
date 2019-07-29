<?php
if (!function_exists('get_state')) {
    function get_state($id)
    {
        $ci =& get_instance();
        $ci->db->where("id", $id);
        $state = $ci->db->get("states", 1)->row();
        return $state;
    }
}
if (!function_exists('get_lga')) {
    function get_lga($id)
    {
        $ci =& get_instance();
        $ci->db->where("local_id", $id);
        $lga = $ci->db->get("locals", 1)->row();
        return $lga;
    }
}
if (!function_exists('get_exam_result')) {
    function get_exam_result($id)
    {
        $ci =& get_instance();
        $ci->db->where("exam_id", $id);
        $res = $ci->db->get("exam_results")->result();
        return $res;
    }
}
if (!function_exists('get_exam_type')) {
    function get_exam_type($id)
    {
        $ci =& get_instance();
        $ci->db->where("id", $id);
        $res = $ci->db->get("exam_type",1)->row();
        return $res->name;
    }
}
if (!function_exists('get_subject')) {
    function get_subject($id)
    {
        $ci =& get_instance();
        $ci->db->where("id", $id);
        $res = $ci->db->get("subjects",1)->row();
        return $res->name;
    }
}
