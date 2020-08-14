<?php defined('BASEPATH') OR exit('No direct script access allowed');
class Staff extends MY_Controller
{

    function __construct()
    {
        parent::__construct();

        if (!$this->loggedIn) {
            $this->session->set_userdata('requested_page', $this->uri->uri_string());
            $this->sma->md('login');
        }
        if ($this->Customer || $this->Supplier) {
            $this->session->set_flashdata('warning', lang('access_denied'));
            redirect($_SERVER["HTTP_REFERER"]);
        }
        $this->lang->admin_load('customers', $this->Settings->user_language);
        $this->load->library('form_validation');
        $this->load->admin_model('companies_model');
        $this->load->admin_model('site');
    }
    public function index(){
    	// $this->sma->checkPermissions();
        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['action'] = $action;
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('staff')));
        $meta = array('page_title' => lang('staff'), 'bc' => $bc);
        $this->page_construct('staff/index', $meta, $this->data);
    }
    public function getStaff(){
    	// $this->sma->checkPermissions('index');
        $this->load->library('datatables');
        $this->datatables
            ->select("{$this->db->dbprefix('companies')}.id as id,{$this->db->dbprefix('warehouses')}.name as wname,company,{$this->db->dbprefix('companies')}.name as name,{$this->db->dbprefix('companies')}.email as email,{$this->db->dbprefix('companies')}.phone as phone, pob,identity,")
            ->from("companies")
            ->join('warehouses','warehouses.id = companies.swarehouse_id','left')
            ->where('group_name', 'staff')
            // ->where('table',null)
            ->add_column("Actions", "<div class=\"text-center\"><a class=\"tip\" title='" . lang("list_deposits") . "' href='" . admin_url('customers/deposits/$1') . "' data-toggle='modal' data-target='#myModal'><i class=\"fa fa-money\"></i></a> <a class=\"tip\" title='" . lang("add_deposit") . "' href='" . admin_url('customers/add_deposit/$1') . "' data-toggle='modal' data-target='#myModal'><i class=\"fa fa-plus\"></i></a> <a class=\"tip\" title='" . lang("list_addresses") . "' href='" . admin_url('customers/addresses/$1') . "' data-toggle='modal' data-target='#myModal'><i class=\"fa fa-location-arrow\"></i></a> <a class=\"tip\" title='" . lang("list_users") . "' href='" . admin_url('customers/users/$1') . "' data-toggle='modal' data-target='#myModal'><i class=\"fa fa-users\"></i></a> <a class=\"tip\" title='" . lang("add_user") . "' href='" . admin_url('customers/add_user/$1') . "' data-toggle='modal' data-target='#myModal'><i class=\"fa fa-user-plus\"></i></a> <a class=\"tip\" title='" . lang("edit_customer") . "' href='" . admin_url('customers/edit/$1') . "' data-toggle='modal' data-target='#myModal'><i class=\"fa fa-edit\"></i></a> <a href='#' class='tip po' title='<b>" . lang("delete_customer") . "</b>' data-content=\"<p>" . lang('r_u_sure') . "</p><a class='btn btn-danger po-delete' href='" . admin_url('customers/delete/$1') . "'>" . lang('i_m_sure') . "</a> <button class='btn po-close'>" . lang('no') . "</button>\"  rel='popover'><i class=\"fa fa-trash-o\"></i></a></div>", "id");
        // ->unset_column('id');
            // var_dump($this->datatables);die();
        echo $this->datatables->generate();
    }
    public function add(){
    	// $this->sma->checkPermissions(false, true);

        $this->form_validation->set_rules('email', lang("email_address"), 'is_unique[companies.email]');

        if ($this->form_validation->run('companies/add') == true) {
        	$tamount = $this->input->post('salary');
            if ($this->Settings->tax2) {
                $order_tax_id = $this->input->post('order_taxs');
                if ($order_tax_details = $this->site->getTaxRateByID($order_tax_id)) {
                    if ($order_tax_details->type == 2) {
                        $order_tax = $this->sma->formatDecimal($order_tax_details->rate);
                    } elseif ($order_tax_details->type == 1) {
                        $order_tax = $this->sma->formatDecimal(((($tamount) * $order_tax_details->rate) / 100), 4);
                    }
                }
            } else {
                $order_tax_id = null;
            }

            $data = array('name' => $this->input->post('name'),
                'email' => $this->input->post('email'),
                'group_id' => '5',
                'group_name' => 'staff',
                'company' => $this->input->post('company'),
                'address' => $this->input->post('address'),
                'city' => $this->input->post('city'),
                'state' => $this->input->post('state'),
                'postal_code' => $this->input->post('postal_code'),
                'country' => $this->input->post('country'),
                'phone' => $this->input->post('phone'),
                'identity' => $this->input->post('identity'),
                'swarehouse_id' => $this->input->post('swarehouse'),
                'salary'=>$this->input->post('salary'),
                'nation' => $this->input->post('nation'),
                'position_id' => $this->input->post('position'),
                'childrens' => $this->input->post('child'),
                'order_tax_id' => $order_tax_id,
                'order_tax' => $order_tax,
                'total_tax'=>$order_tax,
                'pob' => $this->input->post('pob'),
                'cf2' => $this->input->post('cf2'),
                'cf3' => $this->input->post('cf3'),
                'cf4' => $this->input->post('cf4'),
                'cf5' => $this->input->post('cf5'),
                'cf6' => $this->input->post('cf6'),
            );
            // var_dump($data);die();
        } elseif ($this->input->post('add_staff')) {
            $this->session->set_flashdata('error', validation_errors());
            admin_redirect('staff');
        }

        if ($this->form_validation->run() == true && $cid = $this->companies_model->addCompany($data)) {
            $this->session->set_flashdata('message', lang("staff_add"));
            $ref = isset($_SERVER["HTTP_REFERER"]) ? explode('?', $_SERVER["HTTP_REFERER"]) : NULL;
            admin_redirect($ref[0] . '?staff=' . $cid);
        } else {
            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['modal_js'] = $this->site->modal_js();
            $this->data['swarehouse'] = $this->site->getAllWarehouses();
            $this->data['position'] = $this->get_Allposition();
            $this->data['tax_rates'] = $this->site->getAllTaxRates();
            // $this->data['orderTax'] = $this->getOrdertax();
            // var_dump($this->data['orderTax']);die();
            $this->load->view($this->theme . 'staff/add', $this->data);
        }
    }
    // function getOrdertax(){
    // 	$re = $this->db->query("SELECT * FROM sma_tax_rates")->result();
    // 	return $re;
    // }
    function get_Allposition(){
    	$sql = $this->db->query("SELECT * FROM sma_position")->result();
    	return $sql;
    }
    public function getWarehouseStaff($wid = null){
    	if ($srow = $this->companies_model->getStaffbywarehouse($wid)) {
    		$data = json_encode($srow);
    	}else{
    		$data = false;
    	}
    	echo $data;
    }
    public function getStaffSalary($st_id = null){
    	if ($ssalary = $this->companies_model->getSalary($st_id)) {
    		$ssa = json_encode($ssalary);
    	}else{
    		$ssa = false;
    	}
    	echo $ssa;
    }
}