<?php

namespace App\Http\Controllers;

use App\Models\PaymentsModel;
use App\Models\TaiKhoanModel;
use Illuminate\Http\Request;

class HeaderController extends Controller
{
    private $paymentModel;
    private $accountModel;
    public function __construct(){
        $this->paymentModel = new PaymentsModel();
        $this->accountModel = new TaiKhoanModel();
    }
    public function accountView(Request $req){
        $payments = $this->paymentModel->getPayments($req->session()->get('idkhachhang'));
        $userInfo = $this->accountModel->getUserInfo($req->session()->get('idkhachhang'));

        return view('BackEnd.account',compact('payments','userInfo'));
    }
    public function updateAcc(Request $req){
        $data = [
            $req->input('username'),
            $req->input('hovaten'),
            $req->input('email'),
            $req->input('sodienthoai'),
            $req->input('newpassword'),
            $req->input('diachi')
        ];
        $this->accountModel->updateAccountInfo($req->session()->get('idkhachhang'),$data);
        //echo "<script>alertify.error('Vui lòng đăng nhập để sử dụng tính năng này')</script>";
        return redirect('/');
        //dd($data);
    }

}
