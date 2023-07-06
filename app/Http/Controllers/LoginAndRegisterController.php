<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \Illuminate\Support\Facades\DB;

use Illuminate\Support\Facades\Session;

use App\Models\TaiKhoanModel;
class LoginAndRegisterController extends Controller
{
    private $Account;
    public function __construct(){
        $this->Account = new TaiKhoanModel();
    }
    public function index(){
        return view('BackEnd.loginAndRegister');
    }
    public function login(Request $req){
        $loginId = DB::select("SELECT id FROM khachhang WHERE username='$req->username' AND password='$req->password'");
        if($loginId == null){ // Đăng nhập sai
            Session::flash('ErrorLogin','Tên đăng nhập hoặc mật khẩu của bạn không đúng');
            return view('BackEnd.loginAndRegister');
        }
        else{
            $req->session()->put('idkhachhang',$loginId[0]->id);
            return view('BackEnd.home');
        }
        //dd($req->session()->get('idkhachhang'));
    }
    public function register(Request $req){
        $data = [
            $req->input('hovaten-register'),
            $req->input('username-register'),
            $req->input('sodienthoai-register'),
            $req->input('diachi-register'),
            $req->input('email-register'),
            $req->input('password-register')
        ];
        if($req->input('password-register') == $req->input('confirm-password-register')){
            $checkUnique = $this->Account->register($data);
            if($checkUnique == false)
            {
                Session::flash('Error','Tên đăng nhập,Số điện thoại hoặc email đã có người chọn');
            }
            else{
                Session::flash('Success','Đăng kí thành công, giờ đã có thể đăng nhập');;
            }
        }
        else{
            Session::flash('Error','Vui lòng xác nhận lại mật khẩu chính xác');
        }
        return redirect('/LoginOrRegister');
    }
    public function logout(){
        session()->flush();
        return view('BackEnd.home');
    }
}
