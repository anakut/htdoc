<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Deposit extends MY_Controller
{

    function __construct()
    {
        parent::__construct();

        if (!$this->loggedIn) {
            $this->session->set_userdata('requested_page', $this->uri->uri_string());
            $this->sma->md('login');
        }
        if ($this->Supplier) {
            $this->session->set_flashdata('warning', lang('access_denied'));
            redirect($_SERVER["HTTP_REFERER"]);
        }
        $this->lang->admin_load('sales', $this->Settings->user_language);
        $this->load->library('form_validation');
        $this->load->admin_model('sales_model');
        $this->load->admin_model('pos_model');
        $this->digital_upload_path = 'files/';
        $this->upload_path = 'assets/uploads/';
        $this->thumbs_path = 'assets/uploads/thumbs/';
        $this->image_types = 'gif|jpg|jpeg|png|tif';
        $this->digital_file_types = 'zip|psd|ai|rar|pdf|doc|docx|xls|xlsx|ppt|pptx|gif|jpg|jpeg|png|tif|txt';
        $this->allowed_file_size = '1024';
        $this->data['logo'] = true;
        $this->load->admin_model('Deposit_model');
        $this->load->admin_model('companies_model');
    }
    public function index($action = null){
        $this->sma->checkPermissions();
        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['action'] = $action;
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('Deposit')));
        $meta = array('page_title' => lang('Deposit'), 'bc' => $bc);
        $this->page_construct('deposit/index', $meta, $this->data);
    }
    public function getDeposit(){
        $this->sma->checkPermissions('index');
        $this->load->library('datatables');
        $this->datatables
            ->select("companies.id as id,company, name, email, phone,deposit_amount")
            ->from("companies")
            ->where('group_name', 'customer')
            ->where('deposit_amount >',0)
            ->add_column("Actions", "<div class=\"text-center\"><a class=\"tip\" title='" . lang("list_deposits") . "' href='" . admin_url('Deposit/view/$1') . "' data-toggle='modal' data-target='#myModal'><i class=\"fa fa-money\"></i></a>  <a class='hide' href='#' class='tip po' title='<b>" . lang("delete_deposit") . "</b>' data-content=\"<p>" . lang('r_u_sure') . "</p><a class='btn btn-danger po-delete' href='" . admin_url('deposit/delete/$1') . "'>" . lang('i_m_sure') . "</a> <button class='btn po-close'>" . lang('no') . "</button>\"  rel='popover'><i class=\"fa fa-trash-o\"></i></a></div>", "id");
        echo $this->datatables->generate();
    }
    public function add(){
        $this->sma->checkPermissions();
        $this->form_validation->set_rules('date', $this->lang->line("date"), 'trim|required');
        $this->form_validation->set_rules('customer', $this->lang->line("customer"), 'trim|required');
        $this->form_validation->set_rules('t_price', $this->lang->line("amount"), 'trim|required');
        if ($this->form_validation->run('deposit/add') == true) {
            if ($this->Owner || $this->Admin) {
                $date = $this->sma->fld(trim($this->input->post('date')));
            } else {
                $date = date('Y-m-d H:i:s');
            }
            $ref      = $this->input->post('reference_no');
            $pby      = $this->input->post('pby');
            $amount   = $this->input->post('t_price');
            $customer = $this->input->post('customer');
            $note     = $this->input->post('note');
            $c_by     = $this->session->userdata('user_id');
            $data     = array(
                'date'       =>$date,
                'company_id' =>$customer,
                'amount'     =>$amount,
                'paid_by'    =>$pby,
                'note'       =>$note,
                'created_by' =>$c_by,
            );
            // var_dump($data);die();
        $company = $this->companies_model->getCompanyByID($customer);
        $cdata = array(
                'deposit_amount' => ($company->deposit_amount+$amount)
            );

        } elseif ($this->input->post('add_deposit')) {
            $this->session->set_flashdata('error', validation_errors());
            admin_redirect('deposit/add');
        }

        if ($this->form_validation->run() == true && $this->Deposit_model->addDeposit($data,$cdata)) {
            $this->session->set_flashdata('message', lang("deposit_added"));
            $ref = isset($_SERVER["HTTP_REFERER"]) ? explode('?', $_SERVER["HTTP_REFERER"]) : NULL;
            admin_redirect('Deposit');
        } else {
        $this->data['billers']    = $this->site->getAllCompanies('biller');
        $this->data['warehouses'] = $this->site->getAllWarehouses();
        $this->data['custom_er']  = $this->Deposit_model->getAllCustomer();
        $this->data['error']      = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['action']     = $action;
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('Deposit')));
        $meta = array('page_title' => lang('Deposit'), 'bc' => $bc);
        $this->page_construct('deposit/add', $meta, $this->data);
        }
    }
    function view($id)
    {
        $company_id = $id;
        $this->data['error']    = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
        $this->data['modal_js'] = $this->site->modal_js();
        $this->data['company']  = $this->companies_model->getCompanyByID($company_id);
        $this->load->view($this->theme . 'deposit/view', $this->data);

    }
    function get_deposits($company_id = NULL)
    {
        $this->sma->checkPermissions('deposits');
        $this->load->library('datatables');
        $this->datatables
            ->select("deposits.id as id, date, amount, paid_by, CONCAT({$this->db->dbprefix('users')}.first_name, ' ', {$this->db->dbprefix('users')}.last_name) as created_by", false)
            ->from("deposits")
            ->join('users', 'users.id=deposits.created_by', 'left')
            ->where($this->db->dbprefix('deposits').'.company_id', $company_id)
            ->add_column("Actions", "<div class=\"text-center\"><a class=\"tip\" title='" . lang("deposit_note") . "' href='" . admin_url('customers/deposit_note/$1') . "' data-toggle='modal' data-target='#myModal2'><i class=\"fa fa-file-text-o\"></i></a> <a class=\"tip\" title='" . lang("edit_deposit") . "' href='" . admin_url('customers/edit_deposit/$1') . "' data-toggle='modal' data-target='#myModal2'><i class=\"fa fa-edit\"></i></a> <a href='#' class='tip po' title='<b>" . lang("delete_deposit") . "</b>' data-content=\"<p>" . lang('r_u_sure') . "</p><a class='btn btn-danger po-delete' href='" . admin_url('customers/delete_deposit/$1') . "'>" . lang('i_m_sure') . "</a> <button class='btn po-close'>" . lang('no') . "</button>\"  rel='popover'><i class=\"fa fa-trash-o\"></i></a></div>", "id")
        ->unset_column('id');
        echo $this->datatables->generate();
    }

    
}