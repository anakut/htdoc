<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Gasolin extends MY_Controller
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
        $this->load->admin_model('gasolin_model');
    }

    function index($action = NULL)
    {
        $this->sma->checkPermissions();

        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['action'] = $action;
        $bc = array(array('link' => base_url(), 'page' => lang('home')), array('link' => '#', 'page' => lang('Gasolin')));
        $meta = array('page_title' => lang('Gasolin'), 'bc' => $bc);
        $this->page_construct('machine/index', $meta, $this->data);
    }

    function sale($action=null)
    {
        $this->sma->checkPermissions();

        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['action'] = $action;
        $bc = array(array('link' => base_url(), 'page' => lang('home')),array('link' => site_url('Gasolin'), 'page' => lang('Gasolin')),  array('link' => '#', 'page' => lang('Daily Sale')));
        $meta = array('page_title' => lang('Daily Sale'), 'bc' => $bc);
        $this->page_construct('machine/sale_list', $meta, $this->data);
    }
     function due($action=null)
    {
        $this->sma->checkPermissions();
        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['action'] = $action;
        $bc = array(array('link' => base_url(), 'page' => lang('home')),array('link' => site_url('Gasolin'), 'page' => lang('Gasolin')),  array('link' => '#', 'page' => lang('Invoice')));
        $meta = array('page_title' => lang('Invoice'), 'bc' => $bc);
        $this->page_construct('machine/due_record', $meta, $this->data);
    }
     function addsale($action=null)
    {
        $this->sma->checkPermissions();

        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['action'] = $action;
         $this->data['billers'] = $this->site->getAllCompanies('biller');
        $this->data['machine'] = $this->db->get('gasolin_machine')->result();
        $bc = array(array('link' => base_url(), 'page' => lang('home')),array('link' => site_url('Gasolin'), 'page' => lang('Gasolin')),  array('link' => '#', 'page' => lang('Machine Due')));
        $meta = array('page_title' => lang('Machine Due'), 'bc' => $bc);
        $this->page_construct('machine/addsale', $meta, $this->data);
    }

     function add_due($action=null)
    {
        $this->sma->checkPermissions();

        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $this->data['action'] = $action;
         $this->data['billers'] = $this->site->getAllCompanies('biller');
         $this->data['unit_sale'] = $this->getSaleUnitByProductID(6);
         // var_dump($this->data['unit_sale']);die();
        $this->data['machine'] = $this->db->get('gasolin_machine')->result();
        $bc = array(array('link' => base_url(), 'page' => lang('home')),array('link' => site_url('Gasolin'), 'page' => lang('Gasolin')),  array('link' => '#', 'page' => lang('Gasolin')));
        $meta = array('page_title' => lang('Gasolin'), 'bc' => $bc);
        $this->data['customer']=$this->db->where('group_name','customer')->get('companies')->result();
        $this->page_construct('machine/add_due', $meta, $this->data);
    }
    function getSaleUnitByProductID($param){
        $this->db->select('*');
        $this->db->from('units');
        $this->db->where('id',$param);
        $this->db->or_where('base_unit',$param);
        $sql = $this->db->get()->result();
        return $sql;
    }
    
    function getmachine()
    {
        $this->load->library('datatables');
        $this->datatables
            ->select("machine_id, code, name,gas_gold_number,gas_premium_num,default_num,note")
            ->from("gasolin_machine")
            ->add_column("Actions", "<center>
                <a class=\"tip\" title='" . $this->lang->line("edit_machine") . "' href='" . admin_url('gasolin/edit/$1') . "' data-toggle='modal' data-target='#myModal'><i class=\"fa fa-edit\"></i></a>
                <a href='#' class='tip po' title='<b>" . $this->lang->line("delete_machine") . "</b>' data-content=\"<p>" . lang('r_u_sure') . "</p><a class='btn btn-danger po-delete' href='" . admin_url('gasolin/delete/$1') . "'>" . lang('i_m_sure') . "</a> <button class='btn po-close'>" . lang('no') . "</button>\"  rel='popover'><i class=\"fa fa-trash-o\"></i></a></center>", "machine_id");
        echo $this->datatables->generate();
    }
     function getsale()
    {
        $this->load->library('datatables');
        $this->datatables
            ->select("sma_sales.id,
                    sma_sales.date,
                    sma_gasolin_machine.code, 
                    sma_gasolin_machine.name,
                    (sma_sales.g_new - sma_sales.g_old)+(sma_sales.g_new_2 - sma_sales.g_old_2),
                    (sma_sales.p_new - sma_sales.p_old)+(sma_sales.p_new_2- sma_sales.p_old_2),
                    (sma_sales.d_new - sma_sales.d_old)+(sma_sales.d_new_2 - sma_sales.d_old_2),
                    sold_by,
                    sma_sales.shift,
                    sma_sales.total,
                    sma_sales.payment_status,
                    sma_sales.note")
            ->from("sma_sales")
            ->join("sma_gasolin_machine","sma_sales.gas_sale=sma_gasolin_machine.machine_id",'inner')->where('due_record',0);
           $detail_link = anchor('sales/view/$1', '<i class="fa fa-file-text-o"></i> ' . lang('sale_details'));
            $payments_link = anchor('sales/payments/$1', '<i class="fa fa-money"></i> ' . lang('view_payments'), 'data-toggle="modal" data-target="#myModal"');
            $add_payment_link = anchor('sales/add_payment/$1', '<i class="fa fa-money"></i> ' . lang('add_payment'), 'data-toggle="modal" data-target="#myModal"');
            $add_delivery_link = anchor('sales/add_delivery/$1', '<i class="fa fa-truck"></i> ' . lang('add_delivery'), 'data-toggle="modal" data-target="#myModal"');
            $email_link = anchor('sales/email/$1', '<i class="fa fa-envelope"></i> ' . lang('email_sale'), 'data-toggle="modal" data-target="#myModal"');
            $edit_link = anchor('sales/edit/$1', '<i class="fa fa-edit"></i> ' . lang('edit_sale'), 'class="sledit"');
            $pdf_link = anchor('sales/pdf/$1', '<i class="fa fa-file-pdf-o"></i> ' . lang('download_pdf'));
            $print_link = anchor('admin/gasolin/enddays/$1', '<i class="fa fa-file-text-o"></i>' . lang('Print'));
            $return_link = anchor('sales/return_sale/$1', '<i class="fa fa-angle-double-left"></i> ' . lang('return_sale'));
            $delete_link = "<a href='#' class='po' title='<b>" . lang("delete_sale") . "</b>' data-content=\"<p>"
                . lang('r_u_sure') . "</p><a class='btn btn-danger po-delete' href='" . site_url('admin/sales/delete/$1') . "'>"
                . lang('i_m_sure') . "</a> <button class='btn po-close'>" . lang('no') . "</button>\"  rel='popover'><i class=\"fa fa-trash-o\"></i> "
                . lang('delete_sale') . "</a>";
            $action = '<div class="text-center"><div class="btn-group text-left">'
                . '<button type="button" class="btn btn-default btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">'
                . lang('actions') . ' <span class="caret"></span></button>
            <ul class="dropdown-menu pull-right" role="menu">
                <!--<li>' . $detail_link . '</li>-->
                <li>' . $print_link . '</li>
                <!--<li>' . $payments_link . '</li>-->
                <!--<li>' . $add_payment_link . '</li>-->
                <li>' . $delete_link . '</li>
            </ul>
        </div></div>';
         $this->datatables->add_column("Actions", $action, "sma_sales.id");
        echo $this->datatables->generate();
    }
    function enddays($id = NULL, $view = TRUE, $save_bufffer = NULL)
    {
        $this->sma->checkPermissions();

        if ($this->input->get('id')) {
            $id = $this->input->get('id');
        }
        $this->data['error'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('error');
        $inv = $this->sales_model->getInvoiceByID($id);
        $this->sma->view_rights($inv->created_by);
        $this->data['barcode'] = "<img src='" . site_url('products/gen_barcode/' . $inv->reference_no) . "' alt='" . $inv->reference_no . "' class='pull-left' />";
        $this->data['customer'] = $this->site->getCompanyByID($inv->customer_id);
        $this->data['payments'] = $this->sales_model->getPaymentsForSale($id);
        $this->data['biller'] = $this->site->getCompanyByID($inv->biller_id);
        $this->data['user'] = $this->site->getUser($inv->created_by);
        $this->data['warehouse'] = $this->site->getWarehouseByID($inv->warehouse_id);
        $this->data['inv'] = $inv;
        $return = $this->sales_model->getReturnBySID($id);
        $this->data['return_sale'] = $return;
        $this->data['rows'] = $this->sales_model->getAllInvoiceItems($id);
        $this->data['due'] = $this->db->query("SELECT sum(grand_total) as total FROM sma_sales WHERE due_record=1 AND gas_sale=$inv->gas_sale AND date_format(date,'%Y-%m-%d')='".date('Y-m-d',strtotime($inv->date))."' AND payment_status<>'paid' and shift='$inv->shift'")->row()->total;
        $this->data['return_items'] = $return ? $this->sales_model->getAllReturnItems($return->id) : NULL;
        $this->data['engine']=$this->db->where('machine_id',$inv->gas_sale)->get('gasolin_machine')->row();
        $name = lang("sale") . "_" . str_replace('/', '_', $inv->reference_no) . ".pdf";
        $html = $this->load->view($this->theme . 'sales/print', $this->data, TRUE);
        if ($view) {
            $this->load->view($this->theme . 'sales/end_of_day', $this->data);
        }
    }
    function getdue_amount(){
        // $machine_id=$this->input->
        $machine_id=$_GET['m'];
        $date=$_GET['d'];
        $shift=$_GET['s'];
        $date = $this->sma->fld(trim($date));

        $due=$this->db->query("SELECT sum(grand_total) as total FROM sma_sales WHERE due_record=1 AND gas_sale='$machine_id' AND date_format(date,'%Y-%m-%d')='".date('Y-m-d',strtotime($date))."' AND payment_status<>'paid' and shift='$shift'")->row()->total;
        $due=isset($due)?$due:0;
        echo json_encode($due);
    }
      function getdue()
    
    {
      
        $detail_link = anchor('admin/sales/view/$1', '<i class="fa fa-file-text-o"></i> ' . lang('sale_details'));
        $payments_link = anchor('admin/sales/payments/$1', '<i class="fa fa-money"></i> ' . lang('view_payments'), 'data-toggle="modal" data-target="#myModal"');
        $add_payment_link = anchor('admin/sales/add_payment/$1', '<i class="fa fa-money"></i> ' . lang('add_payment'), 'data-toggle="modal" data-target="#myModal"');
        $add_delivery_link = anchor('admin/sales/add_delivery/$1', '<i class="fa fa-truck"></i> ' . lang('add_delivery'), 'data-toggle="modal" data-target="#myModal"');
        $email_link = anchor('admin/sales/email/$1', '<i class="fa fa-envelope"></i> ' . lang('email_sale'), 'data-toggle="modal" data-target="#myModal"');
        $edit_link = anchor('admin/sales/edit/$1', '<i class="fa fa-edit"></i> ' . lang('edit_sale'), 'class="sledit"');
        $pdf_link = anchor('admin/sales/pdf/$1', '<i class="fa fa-file-pdf-o"></i> ' . lang('download_pdf'));


         $print_link = anchor('admin/sales/prints/$1', '<i class="fa fa-file-text-o"></i>' . lang('print_sale'));
        $return_link = anchor('admin/sales/return_sale/$1', '<i class="fa fa-angle-double-left"></i> ' . lang('return_sale'));
        $deletes_link = anchor('admin/sales/deletedue/$1', '<i class="fa fa-angle-double-left"></i> ' . lang('delete'));
        $delete_link = "<a href='#' classp='o' title='<b>" . lang("delete_sale") . "</b>' data-content=\"<p>"
            . lang('r_u_sure') . "</p><a class='btn btn-danger po-delete' href='" . admin_url('sales/delete/$1') . "'>"
            . lang('i_m_sure') . "</a> <button class='btn po-close'>" . lang('no') . "</button>\"  rel='popover'><i class=\"fa fa-trash-o\"></i> "
            . lang('delete_sale') . "</a>";
        $action = '<div class="text-center"><div class="btn-group text-left">'
            . '<button type="button" class="btn btn-default btn-xs btn-primary dropdown-toggle" data-toggle="dropdown">'
            . lang('actions') . ' <span class="caret"></span></button>
        <ul class="dropdown-menu pull-right" role="menu">
            <li>' . $print_link . '</li>
            <li>' . $deletes_link . '</li>
        </ul>
    </div></div>';
        //$action = '<div class="text-center">' . $detail_link . ' ' . $edit_link . ' ' . $email_link . ' ' . $delete_link . '</div>';

        $this->load->library('datatables');
        
        $this->datatables
            ->select("id, date, reference_no, biller, customer, sale_status, (grand_total*rate), (paid*rate), (grand_total-paid)*rate as balance, payment_status")
            ->from('sales')->where('due_record',1);
        $this->datatables->where('pos !=', 1);
        // if (!$this->Customer && !$this->Supplier && !$this->Owner && !$this->Admin) {
        //     $this->datatables->where('created_by', $this->session->userdata('user_id'));
        // } elseif ($this->Customer) {
        //     $this->datatables->where('customer_id', $this->session->userdata('user_id'));
        // }
        $this->datatables->add_column("Actions", $action, "id");
        echo $this->datatables->generate();
    }

    function add()
    {
        $this->sma->checkPermissions(false, true);

        $this->form_validation->set_rules('code','Code', 'is_unique[gasolin_machine.code]');

        if ($this->form_validation->run('machine/add') == true) {

            $data = array('name' => $this->input->post('name'),
                'code' => $this->input->post('code'),
                'default_num' => $this->input->post('default_num'),
                'gas_premium_num' => $this->input->post('gas_premium_number'),
                'gas_gold_number' => $this->input->post('gas_gold_number'),

                'default_num_2' => $this->input->post('default_num_2'),
                'gas_premium_num_2' => $this->input->post('gas_premium_number_2'),
                'gas_gold_number_2' => $this->input->post('gas_gold_number_2'),

                'product_id' => $this->input->post('product'),
                'gold_product' => $this->input->post('gold'),
                'premuim_product' => $this->input->post('premium'),

                'deleted' =>0
            );
        } elseif ($this->input->post('add_supplier')) {
            $this->session->set_flashdata('error', validation_errors());
            admin_redirect('gasolin/');
        }
        if ($this->form_validation->run() == true && $sid = $this->gasolin_model->addmachine($data)) {
            $this->session->set_flashdata('message', 'Machine has added .');
            // $ref = isset($_SERVER["HTTP_REFERER"]) ? explode('?', $_SERVER["HTTP_REFERER"]) : NULL;
            admin_redirect('gasolin');
        } else {
            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['product'] = $this->db->get('products')->result();
            $this->data['modal_js'] = $this->site->modal_js();
            $this->load->view($this->theme . 'machine/add', $this->data);
        }
    }

    function edit($id = NULL)
    {
        $this->sma->checkPermissions(false, true);
        $this->form_validation->set_rules('name', 'Name', 'required');
        if ($this->form_validation->run('gasolin/add') == true) {

            $data = array('name' => $this->input->post('name'),
                'code' => $this->input->post('code'),
                'default_num' => $this->input->post('default_num'),
                'gas_premium_num' => $this->input->post('gas_premium_number'),
                'gas_gold_number' => $this->input->post('gas_gold_number'),

                'default_num_2' => $this->input->post('default_num_2'),
                'gas_premium_num_2' => $this->input->post('gas_premium_number_2'),
                'gas_gold_number_2' => $this->input->post('gas_gold_number_2'),

                'product_id' => $this->input->post('product'),
                'gold_product' => $this->input->post('gold'),
                'premuim_product' => $this->input->post('premium'),
                'deleted' =>0
            );
        } elseif ($this->input->post('add_supplier')) {
            $this->session->set_flashdata('error', validation_errors());
            admin_redirect('gasolin/');
        }

        if ($this->form_validation->run('gasolin/add') == true && $this->gasolin_model->updatemachine($id,$data)) {
            $this->session->set_flashdata('message', 'Machine has edit .');
            admin_redirect('gasolin/');
        } else {
            $this->data['error'] = (validation_errors() ? validation_errors() : $this->session->flashdata('error'));
            $this->data['modal_js'] = $this->site->modal_js();
            $this->data['product'] = $this->db->get('products')->result();

            $this->data['mc'] = $this->db->where('machine_id',$id)->get('gasolin_machine')->row();
            $this->load->view($this->theme . 'machine/edit', $this->data);
        }
    }

    function delete($id = NULL)
    {
        // $this->sma->checkPermissions(NULL, TRUE);
        if ($this->input->get('id')) {
            $id = $this->input->get('id');
        }
        if ($this->gasolin_model->delete($id)) {
             if ($this->input->is_ajax_request()) {
                $this->sma->send_json(array('error' => 0, 'msg' => lang("macine_deleted")));
            }
            $this->session->set_flashdata('message', lang('macine_deleted'));
            admin_redirect('gasolin/due');
        } 
    }
    function savesale(){
        $machine=$this->input->post('machine');
        $date=$this->input->post('date');
        $biller=$this->input->post('biller');
        $note=$this->input->post('note');

        $reference = $this->input->post('reference_no') ? $this->input->post('reference_no') : $this->site->getReference('so');
        $row=$this->db->where('machine_id',$machine)->get('gasolin_machine')->row();
        $d=$this->db->where('id',$row->product_id)->get('products')->row();
        $g=$this->db->where('id',$row->gold_product)->get('products')->row();
        $p=$this->db->where('id',$row->premuim_product)->get('products')->row();
        $d_new_number=$this->input->post('d_new_number');
        $p_new_number=$this->input->post('p_new_number');
        $g_new_number=$this->input->post('g_new_number');

        $d_new_number_2=$this->input->post('d_new_number_2');
        $p_new_number_2=$this->input->post('p_new_number_2');
        $g_new_number_2=$this->input->post('g_new_number_2');
        // var_dump($row);die();
        if(isset($row->machine_id)){
            $d_qty=$d_new_number - $row->default_num;
            $items[] = array(
                'product_id' => $d->id,
                'product_code' => $d->code,
                'product_name' => $d->name,
                'product_type' => $d->type,
                // 'option_id' => '0',
                'net_unit_price' => $d->price,
                'unit_price' => $d->price,
                'quantity' => $d_qty,
                'unit_quantity' => $d_qty,
                'warehouse_id' => 1,
                // 'item_tax' => 0,
                // 'tax_rate_id' => 0,
                'product_unit_id' =>  6,
                'product_unit_code' =>  'លីត្រ',
                // 'tax' => 0,
                'discount' => 0,
                'item_discount' => 0,
                'subtotal' => $this->sma->formatDecimal($d_qty*$d->price),
                // 'serial_no' => 0,
                'engine_front' => 1,
                'gas_type' => 'D',
                'real_unit_price' => 0
            );

            $p_qty=$p_new_number - $row->gas_premium_num;
            $items[] = array(
                'product_id' => $p->id,
                'product_code' => $p->code,
                'product_name' => $p->name,
                'product_type' => $p->type,
                // 'option_id' => '0',
                'net_unit_price' => $p->price,
                'unit_price' => $p->price,
                'quantity' => $p_qty,
                'unit_quantity' => $p_qty,
                'product_unit_id' =>  6,
                'product_unit_code' =>  'លីត្រ',
                'warehouse_id' => 1,
                // 'item_tax' => 0,
                // 'tax_rate_id' => 0,
                'gas_type' => 'P',
                // 'tax' => 0,
                'discount' => 0,
                'item_discount' => 0,
                'subtotal' => $this->sma->formatDecimal($p_qty*$p->price),
                'engine_front' => 1,
                // 'serial_no' => 0,
                'real_unit_price' => 0
            );

            $g_qty=$g_new_number - $row->gas_gold_number;
            $items[] = array(
                'product_id' => $g->id,
                'product_code' => $g->code,
                'product_name' => $g->name,
                'product_type' => $g->type,
                // 'option_id' => '0',
                'net_unit_price' => $g->price,
                'unit_price' => $g->price,
                'quantity' => $g_qty,
                'unit_quantity' => $g_qty,
                'product_unit_id' =>  6,
                'product_unit_code' =>  'លីត្រ',
                'warehouse_id' => 1,
                // 'item_tax' => 0,
                // 'tax_rate_id' => 0,
                // 'tax' => 0,
                'discount' => 0,
                'engine_front' => 1,
                'gas_type' => 'G',
                // 'item_discount' => 0,
                'subtotal' => $this->sma->formatDecimal($g_qty*$g->price),
                // 'serial_no' => 0,
                'real_unit_price' => 0
            );
            // __________________________________________engine 2___________________________
            $d_qty_2=$d_new_number_2 - $row->default_num_2;
             $items[] = array(
                'product_id' => $d->id,
                'product_code' => $d->code,
                'product_name' => $d->name,
                'product_type' => $d->type,
                // 'option_id' => '0',
                'net_unit_price' => $d->price,
                'unit_price' => $d->price,
                'quantity' => $d_qty_2,
                'unit_quantity' => $d_qty_2,
                'product_unit_id' =>  6,
                'product_unit_code' =>  'លីត្រ',
                'gas_type' => 'D',
                'warehouse_id' => 1,
                // 'item_tax' => 0,
                // 'tax_rate_id' => 0,
                // 'tax' => 0,
                'discount' => 0,
                'item_discount' => 0,
                'subtotal' => $this->sma->formatDecimal($d_qty_2*$d->price),
                // 'serial_no' => 0,
                'real_unit_price' => 0
            );

            $p_qty_2=$p_new_number_2 - $row->gas_premium_num_2;
            $items[] = array(
                'product_id' => $p->id,
                'product_code' => $p->code,
                'product_name' => $p->name,
                'product_type' => $p->type,
                // 'option_id' => '0',
                'net_unit_price' => $p->price,
                'unit_price' => $p->price,
                'quantity' => $p_qty_2,
                'unit_quantity' => $p_qty_2,
                'product_unit_id' =>  6,
                'product_unit_code' =>  'លីត្រ',
                'warehouse_id' => 1,
                'gas_type' => 'P',
                // 'item_tax' => 0,
                // 'tax_rate_id' => 0,
                // 'tax' => 0,
                'discount' => 0,
                'item_discount' => 0,
                'subtotal' => $this->sma->formatDecimal($p_qty_2*$p->price),
                // 'serial_no' => 0,
                'real_unit_price' => 0
            );

            $g_qty_2=$g_new_number_2 - $row->gas_gold_number_2;
            $items[] = array(
                'product_id' => $g->id,
                'product_code' => $g->code,
                'product_name' => $g->name,
                'product_type' => $g->type,
                // 'option_id' => '0',
                'net_unit_price' => $g->price,
                'unit_price' => $g->price,
                'gas_type' => 'G',
                'quantity' => $g_qty_2,
                'unit_quantity' => $g_qty_2,
                'product_unit_id' =>  6,
                'product_unit_code' =>  'លីត្រ',
                'warehouse_id' => 1,
                // 'item_tax' => 0,
                // 'tax_rate_id' => 0,
                // 'tax' => 0,
                'discount' => 0,
                'item_discount' => 0,
                'subtotal' => $this->sma->formatDecimal($g_qty_2*$g->price),
                // 'serial_no' => 0,
                'real_unit_price' => 0
            );
            // $products[] = array(
            //             'product_id' => $item_id,
            //             'product_code' => $item_code,
            //             'product_name' => $item_name,
            //             'product_type' => $item_type,
            //             'option_id' => $item_option,
            //             'net_unit_price' => $item_net_price,
            //             'unit_price' => $this->sma->formatDecimal($item_net_price + $item_tax),
            //             'quantity' => $item_quantity,
            //             'product_unit_id' => $unit ? $unit->id : 6,
            //             'product_unit_code' => $unit ? $unit->code : NULL,
            //             'unit_quantity' => $item_unit_quantity,
            //             'warehouse_id' => $warehouse_id,
            //             'item_tax' => $pr_item_tax,
            //             'tax_rate_id' => $item_tax_rate,
            //             'tax' => $tax,
            //             'discount' => $item_discount,
            //             'item_discount' => $pr_item_discount,
            //             'subtotal' => $this->sma->formatDecimal($subtotal),
            //             'serial_no' => $item_serial,
            //             'real_unit_price' => $real_unit_price,
            //         );
            $total=($d_qty*$d->price)+($p_qty*$p->price)+($g_qty*$g->price) + ($d_qty_2*$d->price)+($p_qty_2*$p->price)+($g_qty_2*$g->price);

            $cost = $this->site->costing($items);
            // var_dump($cost);die();
            $data_sale = array('date' => $this->sma->fld(trim($this->input->post('date'))),
                'reference_no' => $reference,
                'customer_id' => 1,
                'customer' => 'Walk-in Customer',
                'biller_id' => 4,
                'biller' => '855SOLUTION',
                'warehouse_id' => 1,
                'note' => $note,
                'staff_note' => 0,
                'total' => $this->sma->formatDecimal($total),
                'product_discount' => 0,
                'order_discount_id' => 0,
                'order_discount' => 0,
                'total_discount' => 0,
                'product_tax' => 0,
                'order_tax_id' => 0,
                'order_tax' => 0,
                'total_tax' => 0,
                'shipping' => 0,
                'grand_total' => $total,
                'total_items' => $d_qty+$p_qty+$g_qty+$d_qty_2+$p_qty_2+$g_qty_2,
                'sale_status' => 'completed',
                'payment_status' => 'paid',
                'payment_term' => 'null',
                'due_date' => date('Y-m-d H:i:s'),
                'gas_sale' => $machine,
                'shift' => $this->input->post('shift'),

                'actual_amount' => $this->input->post('actual_amount'),
                'difference' => $this->input->post('difference'),
                'clearance' => $this->input->post('clearance'),
                'due_amount' => $this->input->post('due_total'),

                'g_old' => $row->gas_gold_number,
                'd_old' => $row->default_num,
                'p_old' => $row->gas_premium_num,
                'g_new' => $g_new_number,
                'd_new' => $d_new_number,
                'p_new' => $p_new_number,

                'g_old_2' => $row->gas_gold_number_2,
                'd_old_2' => $row->default_num_2,
                'p_old_2' => $row->gas_premium_num_2,
                'g_new_2' => $g_new_number_2,
                'd_new_2' => $d_new_number_2,
                'p_new_2' => $p_new_number_2,
                'sold_by' => $this->input->post('by'),
                'paid' => 0
            );

            $this->db->insert('sma_sales', $data_sale);
            $sale_id=$this->db->insert_id();
                $this->site->updateReference('so');
            foreach ($items as $row) {
                $row['sale_id']=$sale_id;
                $this->db->insert('sma_sale_items', $row);
                $sale_item_id = $this->db->insert_id();
                $item_costs = $this->site->item_costing($row);
                foreach ($item_costs as $item_cost) {
                    $item_cost['sale_item_id'] = $sale_item_id;
                    $item_cost['sale_id'] = $sale_id;
                    if(! isset($item_cost['pi_overselling'])) {
                        $this->db->insert('costing', $item_cost);
                    }
                }
            }
                // var_dump($sale_item_id);die();


            $this->site->syncPurchaseItems($cost);
            $this->site->syncQuantity($sale_id);
            $arrama=array( 'default_num' => $d_new_number,
                'gas_premium_num' =>$p_new_number,
                'gas_gold_number' =>$g_new_number,

               'default_num_2' => $d_new_number_2,
                'gas_premium_num_2' => $p_new_number_2,
                'gas_gold_number_2' => $g_new_number_2);
            $this->db->where('machine_id',$machine)->update('gasolin_machine',$arrama);
            admin_redirect('gasolin/enddays/'.$sale_id);

        }else{
            admin_redirect('gasolin/addsale');
        }
    }
      function savedue(){
        $rate = $this->site->getrielcurrency();
        $exchange=$rate->rate;
        $machine=$this->input->post('machine');
        $date=$this->input->post('date');
        $biller=$this->input->post('biller');
        $customer=$this->input->post('customer');
        $note=$this->input->post('note');
        $unit_id = $this->input->post('sale_type');
        if ($unit_id != '') {
            $unit_code = $this->db->where('id',$unit_id)->get('units')->row()->code;
        }else{
            $unit_code = 'លីត្រ';
        }
        // $due_part=$this->input->post('part');
        // $due_part_2=$this->input->post('part_2');
        $due_part = 1;
        $due_part_2=0;
        $reference = $this->site->getReference('so');
        $row=$this->db->where('machine_id',$machine)->get('gasolin_machine')->row();
        $d=$this->db->where('id',$row->product_id)->get('products')->row();
        $g=$this->db->where('id',$row->gold_product)->get('products')->row();
        $p=$this->db->where('id',$row->premuim_product)->get('products')->row();

        $dnum=$this->input->post('d_new_number');
        $pnum=$this->input->post('p_new_number');
        $gnum=$this->input->post('g_new_number');

        $ds=$this->input->post('d_new_numbers');
        $ps=$this->input->post('p_new_numbers');
        $gs=$this->input->post('g_new_numbers');


        // ================================machine2=============================
        $dnum_2=$this->input->post('d_new_number_2');
        $pnum_2=$this->input->post('p_new_number_2');
        $gnum_2=$this->input->post('g_new_number_2');

        $ds_2=$this->input->post('d_new_numbers_2');
        $ps_2=$this->input->post('p_new_numbers_2');
        $gs_2=$this->input->post('g_new_numbers_2');

        $sale_type = $this->input->post('sale_type');
        $u_balance = $this->db->query("SELECT * FROM sma_units WHERE id ='".$sale_type."'")->row();
        if ($u_balance->operation_value != '') {
           $opt_val = $u_balance->operation_value;
            $d_new_number=$dnum*$opt_val;
            $p_new_number=$pnum*$opt_val;
            $g_new_number=$gnum*$opt_val;

            // ===============================2=====================
            $d_new_number_2=$dnum_2*$opt_val;
            $p_new_number_2=$pnum_2*$opt_val;
            $g_new_number_2=$gnum_2*$opt_val;
        }else{
            $d_new_number=$dnum;
            $p_new_number=$pnum;
            $g_new_number=$gnum;

            // ===============================2=====================
            $d_new_number_2=$dnum_2;
            $p_new_number_2=$pnum_2;
            $g_new_number_2=$gnum_2;
        }



        if(isset($row->machine_id)){
            $d_qty=$d_new_number;
            $items[] = array(
                'product_id' => $d->id,
                'product_code' => $d->code,
                'product_name' => $d->name,
                'product_type' => $d->type,
                'option_id' => '0',
                'net_unit_price' => $ds/$exchange,
                'unit_price' => $ds/$exchange,
                'quantity' => $d_qty,
                'warehouse_id' => 2,
                'item_tax' => 0,
                'tax_rate_id' => 0,
                'tax' => 0,
                'discount' => 0,
                'item_discount' => 0,
                'subtotal' => $this->sma->formatDecimal(($dnum*$ds)/$exchange),
                'serial_no' => 0,
                'unit_quantity'=>$dnum,
                'engine_front' => $due_part,
                'gas_type' => 'D',
                'real_unit_price' => 0,
                'product_unit_id' =>$unit_id,
                'product_unit_code' =>$unit_code,
                'rate' =>$exchange,
            );
            $p_qty=$p_new_number;
            $items[] = array(
                'product_id' => $p->id,
                'product_code' => $p->code,
                'product_name' => $p->name,
                'product_type' => $p->type,
                'option_id' => '0',
                'net_unit_price' => $ps/$exchange,
                'unit_price' => $ps/$exchange,
                'quantity' => $p_qty,
                'warehouse_id' => 2,
                'item_tax' => 0,
                'tax_rate_id' => 0,
                'gas_type' => 'P',
                'tax' => 0,
                'discount' => 0,
                'item_discount' => 0,
                'subtotal' => $this->sma->formatDecimal(($pnum*$ps))/$exchange,
                'engine_front' => $due_part,
                'serial_no' => 0,
                'unit_quantity'=>$pnum,
                'real_unit_price' => 0,
                'product_unit_id' =>$unit_id,
                'product_unit_code' =>$unit_code,
                'rate' =>$exchange,
            );
            $g_qty=$g_new_number;
            $items[] = array(
                'product_id' => $g->id,
                'product_code' => $g->code,
                'product_name' => $g->name,
                'product_type' => $g->type,
                'option_id' => '0',
                'net_unit_price' => $gs/$exchange,
                'unit_price' => $gs/$exchange,
                'quantity' => $g_new_number,
                'warehouse_id' => 2,
                'item_tax' => 0,
                'tax_rate_id' => 0,
                'tax' => 0,
                'discount' => 0,
                'engine_front' => $due_part,
                'gas_type' => 'G',
                'item_discount' => 0,
                'subtotal' => $this->sma->formatDecimal(($gnum*$gs)/$exchange),
                'serial_no' => 0,
                'unit_quantity'=>$gnum,
                'real_unit_price' => 0,
                'product_unit_id' =>$unit_id,
                'product_unit_code' =>$unit_code,
                'rate' =>$exchange,
            );
            // -------------------------------------------machine2----------------------------------------------
            $d_qty_2=$d_new_number_2;
            $items[] = array(
                'product_id' => $d->id,
                'product_code' => $d->code,
                'product_name' => $d->name,
                'product_type' => $d->type,
                'option_id' => '0',
                'net_unit_price' => $ds_2/$exchange,
                'unit_price' => $ds_2/$exchange,
                'quantity' => $d_qty_2,
                'warehouse_id' => 2,
                'item_tax' => 0,
                'tax_rate_id' => 0,
                'tax' => 0,
                'discount' => 0,
                'item_discount' => 0,
                'subtotal' => $this->sma->formatDecimal(($dnum_2*$ds_2)/$exchange),
                'serial_no' => 0,
                'unit_quantity'=>$dnum_2,
                'engine_front' => $due_part_2,
                'gas_type' => 'D',
                'real_unit_price' => 0,
                'product_unit_id' =>$unit_id,
                'product_unit_code' =>$unit_code,
                'rate' =>$exchange,
            );
            $p_qty_2=$p_new_number_2;
            $items[] = array(
                'product_id' => $p->id,
                'product_code' => $p->code,
                'product_name' => $p->name,
                'product_type' => $p->type,
                'option_id' => '0',
                'net_unit_price' => $ps_2/$exchange,
                'unit_price' => $ps_2/$exchange,
                'quantity' => $p_qty_2,
                'warehouse_id' => 2,
                'item_tax' => 0,
                'tax_rate_id' => 0,
                'gas_type' => 'P',
                'tax' => 0,
                'discount' => 0,
                'item_discount' => 0,
                'subtotal' => $this->sma->formatDecimal(($pnum_2*$ps_2))/$exchange,
                'engine_front' => $due_part_2,
                'serial_no' => 0,
                'unit_quantity'=>$pnum_2,
                'real_unit_price' => 0,
                'product_unit_id' =>$unit_id,
                'product_unit_code' =>$unit_code,
                'rate' =>$exchange,
            );
            $g_qty_2=$g_new_number_2;
            $items[] = array(
                'product_id' => $g->id,
                'product_code' => $g->code,
                'product_name' => $g->name,
                'product_type' => $g->type,
                'option_id' => '0',
                'net_unit_price' => $gs_2/$exchange,
                'unit_price' => $gs_2/$exchange,
                'quantity' => $g_new_number_2,
                'warehouse_id' => 2,
                'item_tax' => 0,
                'tax_rate_id' => 0,
                'tax' => 0,
                'discount' => 0,
                'engine_front' => $due_part_2,
                'gas_type' => 'G',
                'item_discount' => 0,
                'subtotal' => $this->sma->formatDecimal(($gnum_2*$gs_2)/$exchange),
                'serial_no' => 0,
                'unit_quantity'=>$gnum_2,
                'real_unit_price' => 0,
                'product_unit_id' =>$unit_id,
                'product_unit_code' =>$unit_code,
                'rate' =>$exchange,
            );
            // var_dump($items);die();

            // $total=($d_qty*$d->price)+($p_qty*$p->price)+($g_qty*$g->price);
            $total=($dnum*$ds)+($pnum*$ps)+($gnum*$gs)+($dnum_2*$ds_2)+($pnum_2*$ps_2)+($gnum_2*$gs_2);
            // $cost = $this->site->costing($items);
            $cus_row=$this->db->where('id',$customer)->get('companies')->row();
            if(!isset($cus_row->id)){
                $this->session->set_flashdata('error','Save failed please select customer.');
                admin_redirect('gasolin/due');
            }
            $data_sale = array('date' =>$this->sma->fld(trim($this->input->post('date'))),
                'reference_no' => $reference,
                'customer_id' => $cus_row->id,
                'customer' =>$cus_row->company,
                'biller_id' => 4,
                'biller' => '855SOLUTION',
                'warehouse_id' => 2,
                'note' => $note,
                'staff_note' => 0,
                'total' => $this->sma->formatDecimal($total/$exchange),
                'product_discount' => 0,
                'order_discount_id' => 0,
                'order_discount' => 0,
                'total_discount' => 0,
                'product_tax' => 0,
                'order_tax_id' => 0,
                'order_tax' => 0,
                'total_tax' => 0,
                'shipping' => 0,
                'grand_total' => $total/$exchange,
                'total_items' => $d_qty+$p_qty+$g_qty,
                'sale_status' => 'pending',
                'gas_sale' =>$machine,
                'payment_status' => 'due',
                'payment_term' => 'null',
                'due_date' => date('Y-m-d H:i:s'),
                'rate' =>$exchange,
                'shift' => $this->input->post('shift'),
                'due_record'=>1,
                'sold_by' => $this->input->post('by'),
                'paid' => 0
            );
            $this->db->insert('sma_sales', $data_sale);
            $sale_id=$this->db->insert_id();
            $this->site->updateReference('so');

            // ================================update price in gasolin_machine==========================
            // if ($sale_id) {
            //    $this->db->where()
            // }
            foreach ($items as $row) {
                $row['sale_id']=$sale_id;
                $this->db->insert('sma_sale_items', $row);
                $sale_item_id = $this->db->insert_id();
                // $item_costs = $this->site->item_costing($row);
                foreach ($item_costs as $item_cost) {
                    $item_cost['sale_item_id'] = $sale_item_id;
                    $item_cost['sale_id'] = $sale_id;
                    if(! isset($item_cost['pi_overselling'])) {
                        $this->db->insert('costing', $item_cost);
                    }
                }
            }
            $this->site->syncQuantity($sale_id);
            admin_redirect('sales/prints/'.$sale_id);

        }else{
            admin_redirect('gasolin/addsale');
        }
    }
    function getmachinedetail($id){
        $row=$this->db->where('machine_id',$id)->get('gasolin_machine')->row();
        $d=$this->db->where('id',$row->product_id)->get('products')->row();
        $g=$this->db->where('id',$row->gold_product)->get('products')->row();
        $p=$this->db->where('id',$row->premuim_product)->get('products')->row();
        $data['row']=$row;
        $data['d']=$d;
        $data['g']=$g;
        $data['p']=$p;
        echo json_encode($data);
    }
    function marchine_du(){
        $category=$_GET['cateogry'];
        $this->data['category']=$category;
        $this->data['m_name']=$this->db->query("SELECT * FROM sma_gasolin_machine")->result();
        $this->data['customer'] = $this->gasolin_model->get_machine_name($category);
        $bc = array(array('link' => base_url(), 'page' => lang('home')),array('link' => site_url('Gasolin'), 'page' => lang('Gasolin')),  array('link' => '#', 'page' => lang('Machine Due')));
        $meta = array('page_title' => lang('Machine Due'), 'bc' => $bc);
        $this->page_construct('machine/machine', $meta, $this->data);
    }

    function getPriceByUnitID($uid,$mid){
        $sale_type = $this->db->where('id',$uid)->get('units')->row();
        $rows=$this->db->where('machine_id',$mid)->get('gasolin_machine')->row();
        if ($sale_type->base_unit != '') {
            $d=$this->db->where('product_id',$rows->product_id)->get('saleunitprice')->row();
            $g=$this->db->where('product_id',$rows->gold_product)->get('saleunitprice')->row();
            $p=$this->db->where('product_id',$rows->premuim_product)->get('saleunitprice')->row();
        }else{
            $d=$this->db->where('id',$rows->product_id)->get('products')->row();
            $g=$this->db->where('id',$rows->gold_product)->get('products')->row();
            $p=$this->db->where('id',$rows->premuim_product)->get('products')->row();
        }
        $result['rows']=$rows;
        $result['d']=$d;
        $result['g']=$g;
        $result['p']=$p;
        echo json_encode($result);
        // $data = $this->gasolin_model->getPriceSaleUnit($uid);

    }


}
