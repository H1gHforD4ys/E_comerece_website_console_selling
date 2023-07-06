<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use \Illuminate\Support\Facades\DB;

class PaymentsModel extends Model
{
    use HasFactory;
    public function createPayment($data,$checkGuest,$onlinepaycheck)
    {
        $paymentId = DB::table('payments')->insertGetId([
            'tennguoinhan' => $data[0],
            'email' => $data[1],
            'sodienthoai' => $data[2],
            'thanhpho' => $data[3],
            'diachi' => $data[4],
            'tonggia' => $data[5],
            'guestcheck' => $checkGuest, //Khách hàng = 0; khách vãng lai = 1
            'onlinepaymentcheck' => $onlinepaycheck
        ]);
        return $paymentId;
    }
    public function insertPaymentDetail($paymentId,$productId,$quanity){
        DB::table('paymentsdetail')
        ->join('payments', 'payments.id', '=', 'paymentdetail.idpayment')
        ->where('paymentdetail.idpayment', '=', $paymentId)
        ->insert([
            'idpayment' => $paymentId,
            'idsanpham' => $productId,
            'soluong' => $quanity
        ]);
    }
    public function paymentGuestCheck($paymentId){
        DB::table('payments')
        ->where('id','=',$paymentId)
        ->update(['status' => 1]);
    }
    public function paymentCustomerCheck($paymentId,$idkhachhang,$paidCheck){
        DB::table('payments')
        ->where('id','=',$paymentId)
        ->update([
            'status' => $paidCheck,
            'guestcheck' => 0,
            'customerId' =>$idkhachhang
        ]);
        DB::table('chitiethoadon')
        ->join('hoadon','hoadon.id','=','chitiethoadon.idhoadon')
        ->where('hoadon.idkhachhang','=',$idkhachhang)
        ->delete();
    }
    public function paymentInfo($idPayment){
        $payemtDetail = DB::table('paymentsDetail')
        ->where('idpayment','=',$idPayment)
        ->join('sanpham','sanpham.id','=','paymentsDetail.idsanpham')
        ->join('payments','payments.id','=','paymentsDetail.idpayment')
        ->select('payments.id as idpayment',
        'sanpham.tensanpham','sanpham.id',
        'sanpham.giaban',
        'paymentsDetail.soluong',
        'paymentsDetail.idpayment',
        'payments.tennguoinhan as ten',
        'payments.tonggia',
        'payments.sodienthoai',
        'payments.diachi',
        'payments.email',
        'payments.thanhpho')
        ->get();
        return $payemtDetail;
    }
    public function getPayments($idkhachhang){
        $payemtDetail = DB::table('payments')
        ->where('payments.customerId','=',$idkhachhang)->get();
        return $payemtDetail;
    }
}
