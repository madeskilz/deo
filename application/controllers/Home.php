<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Home extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
	}
	public function index()
	{
		$p["active"] = "home";
		$this->load->view('home/index', $p);
	}
	public function about($type = "")
	{
		$p["active"] = "about";
		switch ($type) {
			case "core-values":
				$p["title"] = "Core Values";
				$this->load->view('home/core-values', $p);
				break;
			case "prospects":
				$p["title"] = "Prospects";
				$this->load->view('home/prospects', $p);
				break;
			case "structure":
				$p["title"] = "Structure";
				$this->load->view('home/structure', $p);
				break;
			case "committee":
				$p["title"] = "Committee";
				$this->load->view('home/committee', $p);
				break;
			case "facilities":
				$p["title"] = "Facilities";
				$this->load->view('home/facilities', $p);
				break;
			case "gallery":
				$p["title"] = "Gallery";
				$this->load->view('home/gallery', $p);
				break;
			default:
				$p["title"] = "About Us";
				$this->load->view('home/about', $p);
				break;
		}
	}
	public function contact()
	{
		$p["title"] = "Contact Us";
		$p["active"] = "support";
		$this->load->view('home/contact', $p);
	}
	public function rector()
	{
		$p["title"] = "Rectors Desk";
		$p["active"] = "media";
		$this->load->view('home/rector', $p);
	}
	public function campus()
	{
		$p["title"] = "Campus Life";
		$p["active"] = "campus";
		$this->load->view('home/campus', $p);
	}
	public function requirements()
	{
		$p["title"] = "Admission Requirements";
		$p["active"] = "admission";
		$this->load->view('home/requirements', $p);
	}
	public function procedure()
	{
		$p["title"] = "Application Procedure";
		$p["active"] = "application";
		$this->load->view('home/procedure', $p);
	}
	public function nd()
	{
		$p["title"] = "National Diploma";
		$p["active"] = "admission";
		$this->load->view('home/admission-nd', $p);
	}
	public function hnd()
	{
		$p["title"] = "Higher National Diploma";
		$p["active"] = "admission";
		$this->load->view('home/admission-hnd', $p);
	}
	public function application()
	{
		//redirect(base_url());exit;
		$this->isLoggedIn();
		if (strtolower($_SERVER['REQUEST_METHOD']) == 'post') {
			$this->apply();
		}
		$p["active"] = "application";
		$p["title"] = "Application Form";
		$p["programs"] = $this->db->get('programs')->result();
		$p["schools"] = $this->db->get('schools')->result();
		$p["states"] = $this->db->get('states')->result();
		$this->load->view('home/application', $p);
	}
	private function isLoggedIn()
	{
		if ($this->session->userdata("logged_in")) {
			$active = $this->session->userdata("active");
			$level = $this->session->userdata("level");
			if ($active == 1) {
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
				} elseif ($level === '4') {
					redirect('prospective');
				} else {
					redirect('applicant');
				}
			}
		}
	}
	private function apply()
	{
		$data = array();
		$login_data = array();
		$data['firstname'] = cleanit($this->input->post('firstname'));
		$data['lastname'] = cleanit($this->input->post('lastname'));
		$data['middlename'] = cleanit($this->input->post('middlename'));
		$data['jamb_reg_no'] = cleanit($this->input->post('jamb_reg_no'));
		$data['jamb_score'] = cleanit($this->input->post('jamb_score'));
		$data['address'] = cleanit($this->input->post('address'));
		$data['department'] = cleanit($this->input->post('department'));
		$program = cleanit($this->input->post('program'));
		$school = cleanit($this->input->post('school'));
		$upload_data = array();
		if (isset($_FILES) && $_FILES['image']['name'] != '') :
			$imagename = rand(1, 1999) . $data['lastname'];
			$path = realpath(FCPATH . 'sitefiles/applicants/images/');
			$config['upload_path'] = $path;
			$config['allowed_types'] = 'gif|jpg|png|webp|jpeg';
			$config['file_name'] = $imagename;
			// if (!is_dir($path)) {
			// 	mkdir($path, 0777);
			// }
			$this->load->library('upload', $config);
			if (!$this->upload->do_upload('image')) {
				$this->session->set_flashdata('error_msg', $this->upload->display_errors());
				redirect("application-form");
			} else {
				$upload_data = $this->upload->data();
			}
		endif;
		if (count($upload_data) > 0) :
			$data["image"] = ($upload_data['file_name']);
		endif;
		$login_data['user_email'] = cleanit($this->input->post('email'));
		$login_data['user_password'] = md5(cleanit($this->input->post('password')));
		$result = $this->login_model->create_account($login_data);
		if ($result > 0) {
			$data['user_id'] = $result;
		} else {
            $this->session->set_flashdata('error_msg', $result);
			redirect("application-form");
		}
		$data['title'] = cleanit($this->input->post('title'));
		$data['dateofbirth'] = cleanit($this->input->post('dateofbirth'));
		$data['phone'] = cleanit($this->input->post('phone'));
		$data['alt_contact_rel'] = cleanit($this->input->post('alt_contact_rel'));
		$data['alt_contact_phone'] = cleanit($this->input->post('alt_contact_phone'));
		$data['alt_contact_name'] = cleanit($this->input->post('alt_contact_name'));
		$data['gender'] = cleanit($this->input->post('gender'));
		$data['marital_status'] = cleanit($this->input->post('marital_status'));
		$data['country'] = cleanit($this->input->post('country'));
		$data['state'] = cleanit($this->input->post('state'));
		$data['lga'] = cleanit($this->input->post('lga'));
		$data['admission_no'] = "AP/" . date("Y") . "/"
			. sprintf("%04d", $data['user_id']);
		$data['admission_status'] = 'processing';
		$add_student = $this->login_model->applicant($data);
		if ($add_student > 0) {
			$this->db->where("user_id", $data["user_id"]);
			$user_data = $this->db->get('users', 1)->row();
			$user_id  = $user_data->user_id;
			$email = $user_data->user_email;
			$level = $user_data->user_level;
			$active  = $user_data->active;
			$sesdata = array(
				'user_id'  => $user_id,
				'email'     => $email,
				'level'     => $level,
				'active'     => $active,
				'logged_in' => TRUE
			);
			$this->session->set_userdata($sesdata);
			redirect('applicant');
		} else {
			redirect("application-form");
		}
	}
}
