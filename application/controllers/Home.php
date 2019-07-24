<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Home extends CI_Controller
{

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function __construct()
	{
		parent::__construct();
		$this->load->helper('url');
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
		$p["active"] = "contact";
		$this->load->view('home/contact', $p);
	}
	public function rector()
	{
		$p["title"] = "Rectors Desk";
		$p["active"] = "rector";
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
		$p["active"] = "admission";
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
        if (strtolower($_SERVER['REQUEST_METHOD']) == 'post') {
            $this->apply();
        }
		$p["active"] = "application";
		$p["title"] = "Application Form";
		$p["programs"] = $this->db->get('programs')->result();
		$p["schools"] = $this->db->get('schools')->result();
		$this->load->view('home/application', $p);
	}
	function apply(){
		$data = array();
		$login_data = array();
		$data['firstname'] = cleanit($this->input->post('firstname'));
		$data['lastname'] = cleanit($this->input->post('lastname'));
		$data['middlename'] = cleanit($this->input->post('middlename'));
		$data['department'] = cleanit($this->input->post('department'));

		//upload image passport check for size
		$login_data['email'] = cleanit($this->input->post('email'));
		$login_data['password'] = md5(cleanit($this->input->post('password')));
		//first createlogin


		$data['title'] = cleanit($this->input->post('title'));
		$data['dateofbirth'] = cleanit($this->input->post('dateofbirth'));
		$data['phone'] = cleanit($this->input->post('phone'));
		//after create login return user_id
		$data['user_id'] = ""; //returned user_id
		$data['image'] = ""; //created image name
		$data['alt_contact_rel'] = cleanit($this->input->post('alt_contact_rel'));
		$data['alt_contact_phone'] = cleanit($this->input->post('alt_contact_phone'));
		$data['alt_contact_name'] = cleanit($this->input->post('alt_contact_name'));
		$data['gender'] = cleanit($this->input->post('gender'));
		$data['marital_status'] = cleanit($this->input->post('marital_status'));
		$data['country'] = cleanit($this->input->post('country'));
		$data['state'] = cleanit($this->input->post('state'));
		$data['lga'] = cleanit($this->input->post('lga'));
		$data['admission_no'] = ""; //generate admission number
		$data['admission_status'] = cleanit($this->input->post('processing'));
		var_dump($data);
		exit;
	}
}
