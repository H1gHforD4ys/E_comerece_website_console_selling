<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use TheSeer\Tokenizer\Exception;
use App\Models\PaymentsModel;
use App\Models\ChitiethoadonModel;

use Illuminate\Support\Facades\Validator;

class CheckOutController extends Controller
{
    private $payments;
    private $Cart;
    public function __construct()
    {
        $this->payments = new PaymentsModel();
        $this->Cart = new ChitiethoadonModel();
    }
    public function index()
    {
        return view('Backend.order');
    }
    public function vnpay_payment(Request $req)
    {
        //Lấy thông tin từ form checkout

        //in vào cơ sở dữ liệu
        if (!session()->get('idkhachhang')) {
            $insertData = [
                $req->input('hovaten'),
                $req->input('emailaddress'),
                $req->input('sodienthoai'),
                $req->input('thanhpho'),
                $req->input('diachi'),
                $req->session()->get('Cart')->totalPrice + 15000
            ];
            $idPayment = $this->payments->createPayment($insertData, 1,1);
            $cartDetail = $req->session()->get('Cart')->products;
            foreach ($cartDetail as $product) {
                $quantity = $product['quanity'];
                $productId = $product['productInfo']->id;
                //echo "<br>id sản phẩm: " . $productId . " số lượng: " . $quantity;
                $this->payments->insertPaymentDetail($idPayment, $productId, $quantity);
            }
        } else { // Dành cho khách hàng đã đăng nhập
            // $idhoadon = $this->Cart->getidhoadon(session()->get('idkhachhang'));
            // session()->put('idhoadon', $idhoadon->id);
            $tonggia = $this->Cart->cartTotalPrice(session()->get('idkhachhang'));
            $insertData = [
                $req->input('hovaten'),
                $req->input('emailaddress'),
                $req->input('sodienthoai'),
                $req->input('thanhpho'),
                $req->input('diachi'),
                $tonggia->tonggia + 15000
            ];
            $idPayment = $this->payments->createPayment($insertData, 0,1);
            $cartDetail = $this->Cart->cartList(session()->get('idkhachhang'));
            foreach ($cartDetail as $product) {
                //echo "<br> id sản phẩm" .$product->id. ", số lượng" .$product->soluong;
                //echo session()->get('idhoadon');
                $this->payments->insertPaymentDetail($idPayment, $product->id, $product->soluong);
            }
        }
        //Thanh toán sandbox
        $vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
        $vnp_Returnurl = route('payment-check'); // return về route kiểm tra
        $vnp_TmnCode = "KHBLVREA"; //Mã website tại VNPAY
        $vnp_HashSecret = "XWSSNAPCHGECJYUNQEOLBAESMEPOOGDR"; //Chuỗi bí mật

        $vnp_TxnRef = $idPayment; //Mã đơn hàng. Trong thực tế Merchant cần insert đơn hàng vào DB và gửi mã này sang VNPAY
        $vnp_OrderInfo = 'Thanh toán đơn hàng';
        $vnp_OrderType = 'Billpayment';
        $vnp_Amount = $insertData[5] * 100;
        $vnp_Locale = 'vn';
        //$vnp_BankCode = 'NCB'; // Nếu muốn chọn ngân hàng thì xóa cái này đi
        $vnp_IpAddr = $_SERVER['REMOTE_ADDR'];
        $inputData = array(
            "vnp_Version" => "2.1.0",
            "vnp_TmnCode" => $vnp_TmnCode,
            "vnp_Amount" => $vnp_Amount,
            "vnp_Command" => "pay",
            "vnp_CreateDate" => date('YmdHis'),
            "vnp_CurrCode" => "VND",
            "vnp_IpAddr" => $vnp_IpAddr,
            "vnp_Locale" => $vnp_Locale,
            "vnp_OrderInfo" => $vnp_OrderInfo,
            "vnp_OrderType" => $vnp_OrderType,
            "vnp_ReturnUrl" => $vnp_Returnurl,
            "vnp_TxnRef" => $vnp_TxnRef
        );

        if (isset($vnp_BankCode) && $vnp_BankCode != "") {
            $inputData['vnp_BankCode'] = $vnp_BankCode;
        }
        if (isset($vnp_Bill_State) && $vnp_Bill_State != "") {
            $inputData['vnp_Bill_State'] = $vnp_Bill_State;
        }

        //var_dump($inputData);
        ksort($inputData);
        $query = "";
        $i = 0;
        $hashdata = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
            } else {
                $hashdata .= urlencode($key) . "=" . urlencode($value);
                $i = 1;
            }
            $query .= urlencode($key) . "=" . urlencode($value) . '&';
        }

        $vnp_Url = $vnp_Url . "?" . $query;
        if (isset($vnp_HashSecret)) {
            $vnpSecureHash =   hash_hmac('sha512', $hashdata, $vnp_HashSecret); //
            $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
        }
        $returnData = array(
            'code' => '00', 'message' => 'success', 'data' => $vnp_Url
        );
        if (isset($_POST['redirect'])) { //nút redirect ở trang checkout
            header('Location: ' . $vnp_Url);
            die();
        } else {
            echo json_encode($returnData);
        }
        //vui lòng tham khảo thêm tại code demo
    }
    public function paymentCheck()
    {
        // Xử lý route 'payment-check' dành cho thanh toán vnpay
        if (isset($_GET['vnp_ResponseCode']) && $_GET['vnp_ResponseCode'] == '00') {
            // Thanh toán thành công
            //dd($_GET['vnp_TxnRef']);
            if (!session()->get('idkhachhang')) { // Kiểm tra người dùng hay khách vãng lai
                // khách vãng lai
                $this->payments->paymentGuestCheck($_GET['vnp_TxnRef']);
                session()->flush();
            } else {
                //khách hàng đã đăng nhập
                //dd(session()->get('idkhachhang'));
                $this->payments->paymentCustomerCheck($_GET['vnp_TxnRef'], session()->get('idkhachhang'),1);
            }
            $paymentDetail = $this->payments->paymentInfo($_GET['vnp_TxnRef']);
            // echo $paymentDetail[0]->idpayment;
            // echo "<br> Tên người nhận ". $paymentDetail[0]->ten;
            // foreach ($paymentDetail as $product) {
            //     echo " <br>id sản phẩm ".$product->id. ", Tên sản phẩm : ".$product->tensanpham. ", số lượng sản phẩm: ".$product->soluong;
            // }
            return view('Backend.order',['paymentDetail' => $paymentDetail]);
        } else {
            return view('Backend.checkout');
        }
    }
    public function shipping_payment(Request $req){
        if (!session()->get('idkhachhang')) {
            $insertData = [
                $req->input('hovaten'),
                $req->input('emailaddress'),
                $req->input('sodienthoai'),
                $req->input('thanhpho'),
                $req->input('diachi'),
                $req->session()->get('Cart')->totalPrice + 15000
            ];
            $idPayment = $this->payments->createPayment($insertData, 1,0);
            $cartDetail = $req->session()->get('Cart')->products;
            foreach ($cartDetail as $product) {
                $quantity = $product['quanity'];
                $productId = $product['productInfo']->id;
                //echo "<br>id sản phẩm: " . $productId . " số lượng: " . $quantity;
                $this->payments->insertPaymentDetail($idPayment, $productId, $quantity);
            }
        } else { // Dành cho khách hàng đã đăng nhập
            // $idhoadon = $this->Cart->getidhoadon(session()->get('idkhachhang'));
            // session()->put('idhoadon', $idhoadon->id);
            $tonggia = $this->Cart->cartTotalPrice(session()->get('idkhachhang'));
            $insertData = [
                $req->input('hovaten'),
                $req->input('emailaddress'),
                $req->input('sodienthoai'),
                $req->input('thanhpho'),
                $req->input('diachi'),
                $tonggia->tonggia + 15000
            ];
            $idPayment = $this->payments->createPayment($insertData, 0,0);
            $cartDetail = $this->Cart->cartList(session()->get('idkhachhang'));
            foreach ($cartDetail as $product) {
                //echo "<br> id sản phẩm" .$product->id. ", số lượng" .$product->soluong;
                //echo session()->get('idhoadon');
                $this->payments->insertPaymentDetail($idPayment, $product->id, $product->soluong);
            }
        }
        $shippingURL = '/shipping-pay-check/' . $idPayment;
        return redirect($shippingURL);
    }
    public function shipping_pay_check($idpayment){ //Thanh toán khi nhận hàng
        if(!session()->get('idkhachhang')){
            session()->flush();
        }
        else{
            $this->payments->paymentCustomerCheck($idpayment,session()->get('idkhachhang'),0);
        }
        $paymentDetail = $this->payments->paymentInfo($idpayment);
        //dd($idpayment);
        return view('Backend.order',['paymentDetail' => $paymentDetail]);
    }
    public function choose_payment_method($type){
        //dd($type);
        if($type == "Paid-when-recieved"){
            return response()->json('<a id="shipping-pay" href={{route("shipping-payment")}}><button class="submit-btn-1 mt-30 btn-hover-1" type="submit" >Thanh toán Khi nhận hàng</button></a>');
        }
        if($type == "Online-pay"){
            return response()->json('<button class="submit-btn-1 mt-30 btn-hover-1" type="submit" name="redirect" >Thanh toán VNPAY</button>');
        }
    }
    public function form_checkout_change($type){
        if($type == "Paid-when-recieved"){
            $url = route('shipping-payment');
        }
        if($type == "Online-pay"){
            $url = route('vnpay-payment');
        }
        return response()->json(['url' => $url]);
    }
}
