<?php
// function product_name($name)
// {
//     return character_limiter($name, (isset($pos_settings->char_per_line) ? ($pos_settings->char_per_line-8) : 35));
// }

if ($modal) {
    echo '<div class="modal-dialog no-modal-header"><div class="modal-content"><div class="modal-body"><button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-2x">&times;</i></button>';
} else { ?>
    <!doctype html>
    <html>
    <head>
        <meta charset="utf-8">
        <title><?= $page_title . " " . lang("no") . " " . $inv->id; ?></title>
        <base href="<?= base_url() ?>"/>
        <meta http-equiv="cache-control" content="max-age=0"/>
        <meta http-equiv="cache-control" content="no-cache"/>
        <meta http-equiv="expires" content="0"/>
        <meta http-equiv="pragma" content="no-cache"/>
        <link rel="shortcut icon" href="<?= $assets ?>images/icon.png"/>
        <link rel="stylesheet" href="<?= $assets ?>styles/theme.css" type="text/css"/>
        <style type="text/css" media="all">
            body {
                color: #000;
            }

            #wrapper {
                max-width: 480px;
                margin: 0 auto;
                padding-top: 20px;
            }

            .btn {
                border-radius: 0;
                margin-bottom: 5px;
            }

            h3 {
                margin: 5px 0;
                font-size: 14px;
            }

            @media print {
                .no-print {
                    display: none;
                }
               
            }
            p.adr, p.pho{
                font-size: 11px;
            }
            p.pho{
                margin-top: -9px;
            }
            .nopadding{
                padding: 0px !important;
                font-size: 12px;
            }
            table tr td, th{
                font-size: 9px;
            }
        </style>

    </head>

    <body>

<?php } ?>
<div id="wrapper">
    <div id="">
    <div class="no-print">
        <?php if ($message) { ?>
            <div class="alert alert-success">
                <button data-dismiss="alert" class="close" type="button">×</button>
                <?= is_array($message) ? print_r($message, true) : $message; ?>
            </div>
        <?php } ?>
    </div>
    <div id="receiptData">
    <style type="text/css">
        @media print{
          body{ background-color:#FFFFFF; background-image:none; color:#000000 }
          #ad{ display:none;}
          #leftbar{ display:none;}
          #contentarea{ width:100%;}
        }
        </style>
        <div class="text-center">
            <?=!empty($biller->logo) ? '<img  style="width:70%;margin-right:-20px !important;" src="'.base_url('assets/uploads/logos/'.$biller->logo).'" alt="">' : ''; ?>

            <h3 class="hide" style="text-transform:uppercase;font-family:'khmer os muol light';">
                <?= $biller->company != '-' ? $biller->company : $biller->name; ?></h3>
            <p class="adr" style="text-aling:center;font-family:'khmer os content'"></p><!-- <?php echo $biller->address?> -->
            <!-- <p class="pho" style="text-align:center"><?php echo $biller->phone?></p> -->
            <!-- <p class="pull-right">Customer name:</p> -->
            <?php
            
            if ($Settings->invoice_view == 1) { ?>
                <div class="col-sm-12 text-center">
                    <h4 style="font-weight:bold;"><?= lang('tax_invoice'); ?></h4>
                </div>
            <?php }
            // echo "<div style='float: left; font-size:11px; text-align:left !important;'>";
            //     echo lang("វិក្ក័យបត្រ")."<br>";
            //     echo lang("កាលបរិច្ឆេទ")."<br>";
            //     echo lang("អ្នកគិតលុយ");
            // echo "</div>";
            // echo "<div style='float: left; margin-left:5px; font-size:11px;text-align:left !important;''>";
            //     echo ": ".$inv->reference_no . "<br>";
            //     echo ": ".$this->sma->hrld($inv->date) . "<br>";
            //     echo ": ".$this->session->userdata('username');
            // echo "</div>";
             echo "<div style='float: left; font-size:9px; text-align:left !important;'>";
                echo lang("<i class='fa fa-facebook-square'></i>").' '.$biller->name."<br>";
                echo lang("<i class='fa fa-phone-square'></i>").' '.$biller->phone."<br>";
            echo lang("<div></div>".'<img  style="width:12px;height:12px;margin-left:-2px;margin-top:-2px;" src="'.base_url('assets/images/google-maps.png').'" alt="">')."<span style=''>".$biller->address."</span>";
            echo "</div>";
            // echo "<div style='float: left; margin-left:5px; font-size:11px;text-align:left !important;''>";
            //     // echo ": ".$inv->reference_no . "<br>";
            //     echo ": ".$this->sma->hrld($inv->date) . "<br>";
            //     // echo ": ".$inv->company;
            //     echo ": ".$this->session->userdata('username');
            // echo "</div>";



            // echo "<div class='pull-right' style='float:right !important;front-size:9px !important;'>";
            //     echo "<span style='font-size:9px !important;'>អតិថិជន</span>";
            //     echo "<span style='font-size:9px !important;'>&nbsp; : &nbsp;".$customer->name."<span>"."<br>";
            //     echo "<span> អត្រាប្ដូរប្រាក់</span>";
            //     echo "<span style='font-size:10px !important;'>&nbsp; : &nbsp;".number_format($rate->rate,0)." ៛</span>";
            // echo "</div>";

            echo "<div class='pull-right' style='front-size:9px !important;text-align:left;'>";
                echo "<span style='font-size:9px !important;'>Invoices No</span>";
                echo "<span style='font-size:9px !important;'>&nbsp; : &nbsp;".$inv->reference_no."<span>"."<br>";
                echo "<span style='font-size:9px !important;'>អតិថិជន</span>";
                echo "<span style='font-size:9px !important;'>&nbsp; : &nbsp;&nbsp;".$customer->name."<span>"."<br>";
                echo "<span>លេខទូរស័ព្វ</span>";
                echo "<span style='font-size:10px !important;'>&nbsp; : &nbsp;".$customer->phone."</span>";
            echo "</div>";
            ?>
            <style type="text/css">
                #tbl-con thead tr td{
                    /*background-color:#0000 !important;*/
                    font-weight: bold !important;
                    font-size:11px !important;
                }
            </style>
            <div style="clear:both;"></div>
            <table class="table table-striped table-condensed" id="tbl-con" style="margin-top: 10px;">
                <thead style="border-top: 2px;">
                    <tr style="border-top: 1px solid black !important;">
                        <td colspan="6" style="border-bottom: 1px solid black !important;text-align: left;font-size: 8px !important;white-space: nowrap;">ទំនិញ / Description</td>
                        <!-- <td style="background-color: black !important;">ចុះថ្លៃ</td> -->
                        <td style="width: 100px !important;border-bottom: 1px solid black !important;font-size: 8px !important;text-align: 
                        right;">ចំនួន / Quantity</td>
                        <td style="width: 100px !important;border-bottom: 1px solid black !important;font-size: 8px !important;text-align: right;">តម្លៃ / Price</td>
                        <!-- <td style="background-color: black !important;">សរុប</td> -->

                    </tr>
                </thead>
                <tbody>
                <?php
                $r = 1;
                $tax_summary = array();
                $qty=0;
                foreach ($rows as $row) {
                    // var_dump($row);die();
                    $qty+=$row->quantity;
                    if (isset($tax_summary[$row->tax_code])) {
                        $tax_summary[$row->tax_code]['items'] += $row->quantity;
                        $tax_summary[$row->tax_code]['tax'] += $row->item_tax;
                        $tax_summary[$row->tax_code]['amt'] += ($row->quantity * $row->net_unit_price) - $row->item_discount;
                    } else {
                        $tax_summary[$row->tax_code]['items'] = $row->quantity;
                        $tax_summary[$row->tax_code]['tax'] = $row->item_tax;
                        $tax_summary[$row->tax_code]['amt'] = ($row->quantity * $row->net_unit_price) - $row->item_discount;
                        $tax_summary[$row->tax_code]['name'] = $row->tax_name;
                        $tax_summary[$row->tax_code]['code'] = $row->tax_code;
                        $tax_summary[$row->tax_code]['rate'] = $row->tax_rate;
                    }
                    echo '<tr>';
                        if ($row->comment !="") {
                           echo '<td colspan="6" style=""float:left;><span style="float:left; font-size:9px;">  '. product_name($row->product_name) .'&nbsp;'.'('.$row->comment.')'.'</span>' . ($row->variant ? ' (' . $row->variant . ')' : '').'</td>';
                        }else{
                            echo '<td colspan="6" style=""float:left;><span style="float:left; font-size:9px;white-space:nowrap;">  '. product_name($row->product_name).($row->variant ? ' (' . $row->variant .')' : '').'</td>';
                        }
                            // if ($row->discount != 2) { 
                            //      echo '<td>' . $row->discount. '</td> ';
                            // }else{
                            //     echo '<td>0%</td>';
                            // }
                            echo '<td class="text-center" style="white-space:nowrap; font-size:9px; ">'.
                            number_format($row->quantity,0).'</td>';
                            echo '<td style="white-space:nowrap !important; text-align: right;"> $  '.number_format($row->real_unit_price + ($row->item_tax / $row->quantity),2).'</td>';
                            // var_dump($row->subtotal);die();

                            // echo '<td align="right" style="white-space:nowrap; font-size:12px;">'.'$ '.number_format($row->subtotal,2).'</td>';
                    echo '</tr>';

                    // echo '<tr><td>' . $this->sma->formatNumber($row->quantity). ' x ';
                    // if ($row->item_discount != 0) { echo '<del>' . $this->sma->formatMoney($row->net_unit_price + ($row->item_discount / $row->quantity) + ($row->item_tax / $row->quantity)) . '</del> '; }
                    // echo $this->sma->formatMoney($row->net_unit_price + ($row->item_tax / $row->quantity)) . '</td>
                    // <td class="text-right">$ ' . $this->sma->formatMoney($row->subtotal) . '</td> </tr>';

                    $r++;
                }
                ?>
                </tbody>
                <?php $paidTotal = ($inv->total+$inv->product_tax) - $inv->order_discount; ?>
                <tfoot>
                <tr style="padding-top: 20px !important;">
                    <!-- <th colspan="4" style="font-size: 11px;"><?= lang("Totalqty"); ?> : </th> -->
                    <!-- <th style="text-align: center;"><?php echo $qty?></th> -->
                    <th colspan="5"></th>
                    <th></th>
                    <th class="text-right" colspan="" style="white-space: nowrap !important; font-size: 9px;margin-top: 20px;"><?= lang("សរុប / Balance");?>
                    </th>
                    <th colspan="3" class="text-right" style="white-space: nowrap !important; font-size: 9px;">$ <?= number_format(($inv->total + $inv->product_tax),2); ?>
                    </th>
                </tr>
                <tr style="padding-bottom: 20px !important;">
                    <!-- <th colspan="4"style="font-size: 11px;">Exch rate : </th>
                    <th><?php echo $this->sma->formatMoney($rate->rate);?></th> -->
                    <th colspan="3" rowspan="" headers="" scope=""></th>
                    <th  colspan="4" class="text-right"style="white-space: nowrap !important;font-size: 9px;"><?= lang("សរុបរៀល"); ?></th>
                    <th class="text-right" style="white-space: nowrap !important;font-size: 9px;">R <?= number_format((($inv->total+ $rounding)*$rate->rate),0); ?></th>
                    <!-- $inv->exchange_rate -->
                </tr>
                <?php
                
                if ($inv->is_pub_tax != 0) {
                    echo '<tr><th>Public Tax</th><th class="text-right">' . $this->sma->formatMoney($inv->total*0.03) . '</th></tr>';
                }
                if ($inv->order_tax != 0) {
                    echo '<tr><th>' . lang("tax") . '</th><th class="text-right">' . $this->sma->formatMoney($inv->order_tax) . '</th></tr>';
                }
                if ($inv->order_discount != 0) {
                    echo '<tr style="border-bottom:dotted 1px black !important; "><th style="font-size:11px !important;text-align:right;" colspan="6" ;>' . lang("បញ្ចុះតំលៃ / Discount") . '</th><th class="text-right" style="font-size:12px !important;">$  '.number_format(($inv->order_discount),2) . '</th></tr>';

                    // echo '<tr style="border-bottom:dotted 1px black !important; "><th style="font-size:11px !important;text-align:right;" colspan="6" ;>' . lang("អ្នកដឹក / Delivery") . '</th><th class="text-right" style="font-size:11px !important;">-------------</th></tr>';
                    
                }
                if ($pos_settings->rounding) { 
                    $round_total = $this->sma->roundNumber($inv->grand_total, $pos_settings->rounding);
                    $rounding = $this->sma->formatMoney($round_total - $inv->grand_total);
                ?>
                    <tr  style="border-bottom:dotted 3px black;">
                        <th colspan="3"style="font-size: 9px;"><?= lang("rounding"); ?></th>
                        <th class="text-right"style="font-size: 9px;"><?= $rounding; ?></th>
                    </tr>
                    <tr>
                        <th colspan="3"style="font-size: 9px;"><?= lang("grand_total"); ?></th>
                        <th colspan="" class="text-right"style="font-size: 9px;">R <?= $this->sma->formatMoney($inv->grand_total + $rounding); ?></th>
                    </tr>
                    <tr>

                        <th colspan="3"style="font-size: 9px;"><?= lang("grand_total_reils"); ?></th>
                        <th  class="text-right"style="font-size: 9px;"><?= number_format((($inv->grand_total+ $rounding)/$rate->rate),0); ?></th> 
                    </tr>

                <?php } else { ?>
                   
                     <tr  style="border-top: 2px black; border-right:  2px black; border-left:  2px;background-color: #dddd !important;">
                        <th colspan="7" style="text-align: right;"><?= lang("សរុបចុងក្រោយ / Total"); ?></th>
                        <th class="text-right" style="font-size:9px">$ <?= $this->sma->formatMoney($inv->grand_total); ?></th>
               
                        <!-- <th class="text-right" style="font-size:12px">៛ <?= round($inv->grand_total*$rate->rate,0); ?></th> -->
                    </tr>
                    <!-- <tr  style="border-bottom:  2px black;border-right:  2px black; border-left:  2px black;">
                        
                        <th colspan=""><?= lang("ប្រាក់ទទួល"); ?></th>
                        <th colspan="4"><?= lang("paid_amount"); ?></th>
                        <th class="text-right"style="font-size:12px"> <?= $paid_amount=$this->sma->formatMoney($payments[0]->pos_paid == 0 ? $payments[0]->amount : $payments[0]->pos_paid) . ($payments[0]->return_id ? ' (' . lang('returned') . ')' : '') ; ?> $</th>
                        

                        <th class="text-right"style="font-size:12px">៛ <?= round($paid_amount*$rate->rate,-2); ?></th>

                    </tr>
                    <?php 
                            $khmer_type="";
                            $englist_type="";
                            if ($inv->bank_paid!='') {
                                $khmer_type="បង់តាមធនាគា";
                                $englist_type="paid by bank";

                            }
                             else{
                                $khmer_type="បង់ជាលុយសុទ្ធ";
                                $englist_type="paid by cash";
                             }
                         ?>
                         <tr  style="border-bottom:  2px black;border-right:  2px black; border-left:  2px black;">
                           
                                <th colspan=""><?= lang("$khmer_type"); ?></th>
                                <th colspan="4"><?= lang("$englist_type"); ?></th>
                                <th class="text-right"style="font-size:12px"><?=$paid_amount-$inv->credit_amount?>$</th>
                                <th class="text-right"style="font-size:12px">៛ <?= round(($paid_amount-$inv->credit_amount)*$rate->rate,-2);?></th>
                            
                        </tr> -->
                   <!--  <tr  style="border-bottom:  2px black;border-right:  2px black; border-left:  2px black;">
                        
                        <th colspan=""><?= lang("បង់ជាលុយសុទ្ធ"); ?></th>
                        <th colspan="4"><?= lang("paid by cash"); ?></th>
                        <th class="text-right"style="font-size:12px"><?=$inv->credit_amount?>$</th>
                        <th class="text-right"style="font-size:12px">៛ <?= round($inv->credit_amount*$rate->rate,-2); ?></th>
                    </tr> -->
                    

                    <!-- <tr style="border-bottom:dotted 2px black !important;">
                        
                        <th colspan=""><?= lang("ប្រាក់អាប់"); ?></th>
                         <th colspan="4"><?= lang("paid_change"); ?></th>
                        <th class="text-right"style="font-size:12px"> <?= $p_balance_r=($payments[0]->pos_balance > 0 ? $this->sma->formatMoney($payments[0]->pos_balance) : 0) ; ?> $</th>
                        <th class="text-right"style="font-size:12px">៛ <?= round($p_balance_r*$rate->rate,0) ; ?></th> 
                    </tr> -->
                <?php }
                if ($inv->paid < $inv->grand_total) { ?>
                    <tr>
                        <th  style="font-size: 9px;"><?= lang("paid_amount"); ?></th>
                        <th class="text-center" style="font-size: 9px;"><?= $this->sma->formatMoney($inv->paid); ?></th>
                        <th  style="font-size: 9px;"><?= lang("due_amount"); ?></th>
                        <th class="text-right" style="font-size: 9px;"><?= number_format(($inv->grand_total - $inv->paid),0); ?></th>
                    </tr>
                <?php  } ?>
                </tfoot>
            </table>
            <?php
            if ($payments) {
                echo '<table style="display:none" class=" table table-striped table-condensed"><tbody>';
                foreach ($payments as $payment) {
                    echo '<tr>';
                    if ($payment->paid_by == 'cash' && $payment->pos_paid) {
                        echo '<td>' . lang("paid_by") . ': ' . lang($payment->paid_by) . '</td>';
                        echo '<td>' . lang("amount") . ': ' . $this->sma->formatMoney($payment->pos_paid == 0 ? $payment->amount : $payment->pos_paid) . ($payment->return_id ? ' (' . lang('returned') . ')' : '') . '</td>';
                        echo '<td>' . lang("change") . ': ' . ($payment->pos_balance > 0 ? $this->sma->formatMoney($payment->pos_balance) : 0) . '</td>';
                    }
                    if (($payment->paid_by == 'CC' || $payment->paid_by == 'ppp' || $payment->paid_by == 'stripe') && $payment->cc_no) {
                        echo '<td>' . lang("paid_by") . ': ' . lang($payment->paid_by) . '</td>';
                        echo '<td>' . lang("amount") . ': ' . $this->sma->formatMoney($payment->pos_paid) . ($payment->return_id ? ' (' . lang('returned') . ')' : '') . '</td>';
                        echo '<td>' . lang("no") . ': ' . 'xxxx xxxx xxxx ' . substr($payment->cc_no, -4) . '</td>';
                        echo '<td>' . lang("name") . ': ' . $payment->cc_holder . '</td>';
                    }
                    if ($payment->paid_by == 'Cheque' && $payment->cheque_no) {
                        echo '<td>' . lang("paid_by") . ': ' . lang($payment->paid_by) . '</td>';
                        echo '<td>' . lang("amount") . ': ' . $this->sma->formatMoney($payment->pos_paid) . ($payment->return_id ? ' (' . lang('returned') . ')' : '') . '</td>';
                        echo '<td>' . lang("cheque_no") . ': ' . $payment->cheque_no . '</td>';
                    }
                    if ($payment->paid_by == 'gift_card' && $payment->pos_paid) {
                        echo '<td>' . lang("paid_by") . ': ' . lang($payment->paid_by) . '</td>';
                        echo '<td>' . lang("no") . ': ' . $payment->cc_no . '</td>';
                        echo '<td>' . lang("amount") . ': ' . $this->sma->formatMoney($payment->pos_paid) . ($payment->return_id ? ' (' . lang('returned') . ')' : '') . '</td>';
                        echo '<td>' . lang("balance") . ': ' . ($payment->pos_balance > 0 ? $this->sma->formatMoney($payment->pos_balance) : 0) . '</td>';
                    }
                    if ($payment->paid_by == 'other' && $payment->amount) {
                        echo '<td>' . lang("paid_by") . ': ' . lang($payment->paid_by) . '</td>';
                        echo '<td>' . lang("amount") . ': ' . $this->sma->formatMoney($payment->pos_paid == 0 ? $payment->amount : $payment->pos_paid) . ($payment->return_id ? ' (' . lang('returned') . ')' : '') . '</td>';
                        echo $payment->note ? '</tr><td colspan="2">' . lang("payment_note") . ': ' . $payment->note . '</td>' : '';
                    }
                    echo '</tr>';
                }
                echo '</tbody></table>';
            }

            if ($Settings->invoice_view == 1) {
                if (!empty($tax_summary)) {
                    echo '<h4 style="font-weight:bold;">' . lang('tax_summary') . '</h4>';
                    echo '<table class="table table-condensed"><thead><tr><th>' . lang('name') . '</th><th>' . lang('code') . '</th><th>' . lang('qty') . '</th><th>' . lang('tax_excl') . '</th><th>' . lang('tax_amt') . '</th></tr></td><tbody>';
                    foreach ($tax_summary as $summary) {
                        echo '<tr><td>' . $summary['name'] . '</td><td class="text-center">' . $summary['code'] . '</td><td class="text-center">' . $this->sma->formatNumber($summary['items']) . '</td><td class="text-right">' . $this->sma->formatMoney($summary['amt']) . '</td><td class="text-right">' . $this->sma->formatMoney($summary['tax']) . '</td></tr>';
                    }
                    echo '</tbody></tfoot>';
                    echo '<tr><th colspan="4" class="text-right">' . lang('total_tax_amount') . '</th><th class="text-right">' . $this->sma->formatMoney($inv->product_tax) . '</th></tr>';
                    echo '</tfoot></table>';
                }
            }
            ?>

            <?php //echo $inv->note ? '<p class="text-center">' . $this->sma->decode_html($inv->note) . '</p>' : ''; ?>
            <?= $inv->staff_note ? '<p class="no-print"><strong>' . lang('staff_note') . ':</strong> ' . $this->sma->decode_html($inv->staff_note) . '</p>' : ''; ?>
            <div class="well well-sm" style="text-align:center; margin-top:-20px; border:none; background:none; font-size:11px;">
                <?= $this->sma->decode_html($biller->invoice_footer); ?>
            </div><hr style="border: 2px solid black !important;">
            <p style="text-align: center;font-size: 10px !important;">*** រាល់ទំនិញដែលទិញហើយមិនអាចប្ដូរយកប្រាក់វិញបានទេ ***</p>
            <p style="text-align: center; font-weight: 200;">*** Adorable Kid ***</p>
        </div>
        <?php $this->sma->qrcode('link', urlencode(site_url('pos/view/' . $inv->id)), 2); ?>
        <!-- <div class="text-center"><img
                src="<?= base_url() ?>assets/uploads/qrcode<?= $this->session->userdata('user_id') ?>.png"
                alt="<?= $inv->reference_no ?>"/></div>
        <?php $br = $this->sma->save_barcode($inv->reference_no, 'code39'); ?>
        <div class="text-center"><img
                src="<?= base_url() ?>assets/uploads/barcode<?= $this->session->userdata('user_id') ?>.png"
                alt="<?= $inv->reference_no ?>"/></div>
        <div style="clear:both;"></div> -->
    </div>
<?php if ($modal) {
    echo '</div></div></div></div>';
} else { ?>
<div id="buttons" style="padding-top:10px; text-transform:uppercase;" class="no-print">
    <hr>
    <?php if ($message) { ?>
    <div class="alert alert-success">
        <button data-dismiss="alert" class="close" type="button">×</button>
        <?= is_array($message) ? print_r($message, true) : $message; ?>
    </div>
<?php } ?>

    <?php if ($pos_settings->java_applet) { ?>
        <span class="col-xs-12"><a class="btn btn-block btn-primary" onClick="printReceipt()"><?= lang("print"); ?></a></span>
        <span class="col-xs-12"><a class="btn btn-block btn-info" type="button" onClick="openCashDrawer()">Open Cash
                Drawer</a></span>
        <div style="clear:both;"></div>
    <?php } else { ?>
  <!--   <span class="pull-right col-xs-12">
        <a href="javascript:void(0)" id="web_print" class="btn btn-block btn-primary"
           onClick="web_print()"><?= lang("web_print"); ?></a>
    </span> -->
     <span class="pull-right col-xs-12">
        <a href="javascript:window.print()" id="web_print" class="btn btn-block btn-primary"
           onClick="window.print();return false;"><?= lang("web_print"); ?></a>
    </span>
    <!-- <span class="pull-right col-xs-12">
        <a href="<?= site_url('pos/printsinvoice/'.$inv->id); ?>" id="web_print" class="btn btn-block btn-primary"
           >Print Invoices</a>
    </span> -->
    <?php } ?>
    <!-- <span class="pull-left col-xs-12"><a class="btn btn-block btn-success" href="#" id="email"><?= lang("email"); ?></a></span> -->

    <span class="col-xs-12">
        <a class="btn btn-block btn-warning" href="<?= site_url('admin/pos'); ?>"><?= lang("back_to_pos"); ?></a>
    </span>
    <?php if (!$pos_settings->java_applet) { ?>
        <div style="clear:both;"></div>
        <div class="col-xs-12" style="background:#F5F5F5; padding:10px;">
            <p style="font-weight:bold;">Please don't forget to disble the header and footer in browser print
                settings.</p>

            <p style="text-transform: capitalize;"><strong>FF:</strong> File &gt; Print Setup &gt; Margin &amp;
                Header/Footer Make all --blank--</p>

            <p style="text-transform: capitalize;"><strong>chrome:</strong> Menu &gt; Print &gt; Disable Header/Footer
                in Option &amp; Set Margins to None</p></div>
    <?php } ?>
    <div style="clear:both;"></div>

</div>

</div>
<canvas id="hidden_screenshot" style="display:none;">

</canvas>
<div class="canvas_con" style="display:none;"></div>
<script type="text/javascript" src="<?= $assets ?>pos/js/jquery-1.7.2.min.js"></script>

<?php if ($pos_settings->java_applet) {
        function drawLine()
        {
            $size = $pos_settings->char_per_line;
            $new = '';
            for ($i = 1; $i < $size; $i++) {
                $new .= '-';
            }
            $new .= ' ';
            return $new;
        }

        function printLine($str, $sep = ":", $space = NULL)
        {
            $size = $space ? $space : $pos_settings->char_per_line;
            $lenght = strlen($str);
            list($first, $second) = explode(":", $str, 2);
            $new = $first . ($sep == ":" ? $sep : '');
            for ($i = 1; $i < ($size - $lenght); $i++) {
                $new .= ' ';
            }
            $new .= ($sep != ":" ? $sep : '') . $second;
            return $new;
        }

        function printText($text)
        {
            $size = $pos_settings->char_per_line;
            $new = wordwrap($text, $size, "\\n");
            return $new;
        }

        function taxLine($name, $code, $qty, $amt, $tax)
        {
            return printLine(printLine(printLine(printLine($name . ':' . $code, '', 18) . ':' . $qty, '', 25) . ':' . $amt, '', 35) . ':' . $tax, ' ');
        }

        ?>

        <script type="text/javascript" src="<?= $assets ?>pos/qz/js/deployJava.js"></script>
        <script type="text/javascript" src="<?= $assets ?>pos/qz/qz-functions.js"></script>
        <script type="text/javascript">
            deployQZ('themes/<?=$Settings->theme?>/assets/pos/qz/qz-print.jar', '<?= $assets ?>pos/qz/qz-print_jnlp.jnlp');
            usePrinter("<?= $pos_settings->receipt_printer; ?>");
            <?php /*$image = $this->sma->save_barcode($inv->reference_no);*/ ?>
            function printReceipt() {
                //var barcode = 'data:image/png;base64,<?php /*echo $image;*/ ?>';
                receipt = "";
                receipt += chr(27) + chr(69) + "\r" + chr(27) + "\x61" + "\x31\r";
                receipt += "<?= $biller->company; ?>" + "\n";
                receipt += " \x1B\x45\x0A\r ";
                receipt += "<?= $biller->address . " " . $biller->city . " " . $biller->country; ?>" + "\n";
                receipt += "<?= $biller->phone; ?>" + "\n";
                receipt += "<?php if ($pos_settings->cf_title1 != "" && $pos_settings->cf_value1 != "") { echo printLine($pos_settings->cf_title1 . ": " . $pos_settings->cf_value1); } ?>" + "\n";
                receipt += "<?php if ($pos_settings->cf_title2 != "" && $pos_settings->cf_value2 != "") { echo printLine($pos_settings->cf_title2 . ": " . $pos_settings->cf_value2); } ?>" + "\n";
                receipt += "<?=drawLine();?>\r\n";
                receipt += "<?php if($Settings->invoice_view == 1) { echo lang('tax_invoice'); } ?>\r\n";
                receipt += "<?php if($Settings->invoice_view == 1) { echo drawLine(); } ?>\r\n";
                receipt += "\x1B\x61\x30";
                receipt += "<?= printLine(lang("reference_no") . ": " . $inv->reference_no) ?>" + "\n";
                receipt += "<?= printLine(lang("sales_person") . ": " . $biller->name); ?>" + "\n";
                receipt += "<?= printLine(lang("customer") . ": " . $inv->customer); ?>" + "\n";
                receipt += "<?= printLine(lang("date") . ": " . date($dateFormats['php_ldate'], strtotime($inv->date))) ?>" + "\n\n";
                receipt += "<?php $r = 1;
            foreach ($rows as $row): ?>";
                receipt += "<?= "#" . $r ." "; ?>";
                receipt += "<?= printLine(product_name(addslashes($row->product_name)).($row->variant ? ' ('.$row->variant.')' : '').":".$row->tax_code, '*'); ?>" + "\n";
                receipt += "<?= printLine($this->sma->formatNumber($row->quantity)."x".$this->sma->formatMoney($row->net_unit_price+($row->item_tax/$row->quantity)) . ":  ". $this->sma->formatMoney($row->subtotal), ' ') . ""; ?>" + "\n";
                receipt += "<?php $r++;
            endforeach; ?>";
                receipt += "\x1B\x61\x31";
                receipt += "<?=drawLine();?>\r\n";
                receipt += "\x1B\x61\x30";
                receipt += "<?= printLine(lang("total") . ": " . $this->sma->formatMoney($inv->total+$inv->product_tax)); ?>" + "\n";
                <?php if ($inv->order_tax != 0) { ?>
                receipt += "<?= printLine(lang("tax") . ": " . $this->sma->formatMoney($inv->order_tax)); ?>" + "\n";
                <?php } ?>
                <?php if ($inv->total_discount != 0) { ?>
                receipt += "<?= printLine(lang("discount") . ": (" . $this->sma->formatMoney($inv->product_discount).") ".$this->sma->formatMoney($inv->order_discount)); ?>" + "\n";
                <?php } ?>
                <?php if($pos_settings->rounding) { ?>
                receipt += "<?= printLine(lang("rounding") . ": " . $rounding); ?>" + "\n";
                receipt += "<?= printLine(lang("grand_total") . ": " . $this->sma->formatMoney($this->sma->roundMoney($inv->grand_total+$rounding))); ?>" + "\n";
                <?php } else { ?>
                receipt += "<?= printLine(lang("grand_total") . ": " . $this->sma->formatMoney($inv->grand_total)); ?>" + "\n";
                <?php } ?>
                <?php if($inv->paid < $inv->grand_total) { ?>
                receipt += "<?= printLine(lang("paid_amount") . ": " . $this->sma->formatMoney($inv->paid)); ?>" + "\n";
                receipt += "<?= printLine(lang("due_amount") . ": " . $this->sma->formatMoney($inv->grand_total-$inv->paid)); ?>" + "\n\n";
                <?php } ?>
                <?php
                if($payments) {
                    foreach($payments as $payment) {
                        if ($payment->paid_by == 'cash' && $payment->pos_paid) { ?>
                receipt += "<?= printLine(lang("paid_by") . ": " . lang($payment->paid_by)); ?>" + "\n";
                receipt += "<?= printLine(lang("amount") . ": " . $this->sma->formatMoney($payment->pos_paid)); ?>" + "\n";
                receipt += "<?= printLine(lang("change") . ": " . ($payment->pos_balance > 0 ? $this->sma->formatMoney($payment->pos_balance) : 0)); ?>" + "\n";
                <?php  } if (($payment->paid_by == 'CC' || $payment->paid_by == 'ppp' || $payment->paid_by == 'stripe') && $payment->cc_no) { ?>
                receipt += "<?= printLine(lang("paid_by") . ": " . lang($payment->paid_by)); ?>" + "\n";
                receipt += "<?= printLine(lang("amount") . ": " . $this->sma->formatMoney($payment->pos_paid)); ?>" + "\n";
                receipt += "<?= printLine(lang("card_no") . ": xxxx xxxx xxxx " . substr($payment->cc_no, -4)); ?>" + "\n";
                <?php } if ($payment->paid_by == 'Cheque' && $payment->cheque_no) { ?>
                receipt += "<?= printLine(lang("paid_by") . ": " . lang($payment->paid_by)); ?>" + "\n";
                receipt += "<?= printLine(lang("amount") . ": " . $this->sma->formatMoney($payment->pos_paid)); ?>" + "\n";
                receipt += "<?= printLine(lang("cheque_no") . ": " . $payment->cheque_no); ?>" + "\n";
                <?php if ($payment->paid_by == 'other' && $payment->amount) { ?>
                receipt += "<?= printLine(lang("paid_by") . ": " . lang($payment->paid_by)); ?>" + "\n";
                receipt += "<?= printLine(lang("amount") . ": " . $this->sma->formatMoney($payment->amount)); ?>" + "\n";
                receipt += "<?= printText(lang("payment_note") . ": " . $payment->note); ?>" + "\n";
                <?php }
            }

        }
    }

    if($Settings->invoice_view == 1) {
        if(!empty($tax_summary)) {
    ?>
                receipt += "\n" + "<?= lang('tax_summary'); ?>" + "\n";
                receipt += "<?= taxLine(lang('name'),lang('code'),lang('qty'),lang('tax_excl'),lang('tax_amt')); ?>" + "\n";
                receipt += "<?php foreach ($tax_summary as $summary): ?>";
                receipt += "<?= taxLine($summary['name'],$summary['code'],$this->sma->formatNumber($summary['items']),$this->sma->formatMoney($summary['amt']),$this->sma->formatMoney($summary['tax'])); ?>" + "\n";
                receipt += "<?php endforeach; ?>";
                receipt += "<?= printLine(lang("total_tax_amount") . ":" . $this->sma->formatMoney($inv->product_tax)); ?>" + "\n";
                <?php
                    }
                }
                ?>
                receipt += "\x1B\x61\x31";
                receipt += "\n" + "<?= $biller->invoice_footer ? printText(str_replace(array('\n', '\r'), ' ', $this->sma->decode_html($biller->invoice_footer))) : '' ?>" + "\n";
                receipt += "\x1B\x61\x30";
                <?php if(isset($pos_settings->cash_drawer_cose)) { ?>
                print(receipt, '', '<?=$pos_settings->cash_drawer_cose;?>');
                <?php } else { ?>
                print(receipt, '', '');
                <?php } ?>

            }

        </script>
    <?php } ?>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('#email').click(function () {
                        var email = prompt("<?= lang("email_address"); ?>", "<?= $customer->email; ?>");
                        if (email != null) {
                            $.ajax({
                                type: "post",
                                url: "<?= site_url('pos/email_receipt') ?>",
                                data: {<?= $this->security->get_csrf_token_name(); ?>: "<?= $this->security->get_csrf_hash(); ?>", email: email, id: <?= $inv->id; ?>},
                                dataType: "json",
                                success: function (data) {
                                    alert(data.msg);
                                },
                                error: function () {
                                    alert('<?= lang('ajax_request_failed'); ?>');
                                    return false;
                                }
                            });
                        }
                        return false;
                    });
                });
        <?php if (!$pos_settings->java_applet) { ?>
        $(window).load(function () {
            window.print();
        });
    <?php } ?>
            </script>


<script type="text/javascript" src="<?php echo base_url() ?>assets/php_print/example/interface/html2canvas.js"></script>

<style type="text/css">
    .x2{
        transform: scale(1,1) !important;
        margin:0 !important;
        padding:0 !important;
        width: 290px !important;

    }
</style>

<script type="text/javascript">
    function web_print(){
        con = confirm("Confirm Print");
        if (con===true) {
            do_capture_html();
        };
    }
    $(document).ready(function(){
            // do_capture_html();
    })

    function do_capture_html(){
        var c = $('#wrapper');
            c.addClass('x2');
            div_content = document.querySelector("#receiptData")
            var options = {
                scale:2
            }
            //make it as html5 canvas
            html2canvas(div_content,options).then(function(canvas) {
                //change the canvas to jpeg image
                data = canvas.toDataURL('image/jpeg');
                console.log(canvas);
                c.removeClass('x2');
                
                //then call a super hero php to save the image
                save_img(data);
            });
    }


    //to save the canvas image
    function save_img(data){
        //ajax method.
        $.post("<?php echo site_url('admin/Pos/save_receipt') ?>", 
            {data: data}, 
            function(res){
            //if the file saved properly, trigger a popup to the user.
                if(res != 0){
                    // yes = confirm('File saved in output folder, click ok to see it!');
                    // if(yes){
                    //  // location.href =document.URL+'/output/'+res+'.jpg';
                    // }
                    // alert('res');
                    do_print_receipt();
                }
                else{
                    alert('An Error Has Occured.');
                }
        });
    }

    function do_print_receipt(){

        var printer_name = "RONGTA RP80 Printer(2)";

        $.get("<?php echo site_url('admin/Pos/do_print_receipt') ?>",
            {printer_name:printer_name},
            function(res){
                console.log(res);
            });
    }
</script>

</body>
</html>
<?php } ?>