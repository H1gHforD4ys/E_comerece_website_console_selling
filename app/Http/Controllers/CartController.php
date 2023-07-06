<?php

namespace App\Http\Controllers;

use \Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use App\Models\SanphamModel;
use App\Models\ChitiethoadonModel;
use App\Cart;

class CartController extends Controller
{
    public $data;
    private $Cart;
    private $Product;
    public function index()
    {
        return view('BackEnd.cart');
    }
    public function ShowFormCheckout()
    {
        return view('BackEnd.checkout');
    }
    public function __construct()
    {
        $this->Cart = new ChitiethoadonModel();
        $this->Product = new SanphamModel();
    }
    public function DeleteItemCart($id, Request $req)
    {
        if (!session()->has('idkhachhang')) {
            $oldCart = Session('Cart') ? Session('Cart') : null;
            $newCart = new Cart($oldCart);
            $newCart->DeleteItemInCart($id);
            if (Count($newCart->products) > 0) {
                $req->session()->put('Cart', $newCart);
            } else {
                $req->session()->forget('Cart');
            }
            return view('shareContent.listCart');
        } else {
            $idhoadon = $this->Cart->getidhoadon(session()->get('idkhachhang'));
            $dataInsert = [
                $idhoadon->id,
                $id,
            ];
            $this->Cart->deleteCart($dataInsert);
            return view('shareContent.listCart');
        }
    }
    // public function SaveItemCart($id, Request $req, $quanity)
    // {
    //     if(!session()->has('idkhachhang')){
    //         $oldCart = Session('Cart') ? Session('Cart') : null;
    //         $newCart = new Cart($oldCart);
    //         $newCart->UpdateItemCart($id, $quanity);

    //         $req->session()->put('Cart', $newCart);

    //         return view('shareContent.listCart');
    //     }
    //     else{
    //         //$idhoadon = $this->Cart->getidhoadon(session()->get('idkhachhang'));
    //         $dataInsert =[
    //             session()->get('idkhachhang'),
    //             $id,
    //             $quanity,
    //         ];
    //         if($quanity <= $this->Product->getProductInfo($id)->soluong){
    //             $this->Cart->updateCart($dataInsert);
    //             return view('shareContent.listCart');
    //         }
    //         else{
    //             return "Không đủ số lượng";
    //         }
    //     }
    // }
    public function SaveItemCart($id, Request $req, $quanity)
    {
        if(!session()->has('idkhachhang')){
            $oldCart = Session('Cart') ? Session('Cart') : null;
            $newCart = new Cart($oldCart);

            if($quanity <= $this->Product->getProductInfo($id)->soluong){
                $newCart->UpdateItemCart($id, $quanity);

                $req->session()->put('Cart', $newCart);
                $data = [
                    'view' => view('shareContent.listCart')->render(),
                    'thongbao' => 'Đủ số lượng'
                ];
                return response()->json($data);
            }
            else{
                $data = [
                    'soluong' => $this->Product->getProductInfo($id)->soluong,
                    'view' => view('shareContent.listCart')->render(),
                    'thongbao' => 'Không đủ số lượng'
                ];
                return response()->json($data);
            }
        }
        else{
            //$idhoadon = $this->Cart->getidhoadon(session()->get('idkhachhang'));
            $dataInsert =[
                session()->get('idkhachhang'),
                $id,
                $quanity,
            ];
            if($quanity <= $this->Product->getProductInfo($id)->soluong){
                $this->Cart->updateCart($dataInsert);
                $data = [
                    'view' => view('shareContent.listCart')->render(),
                    'thongbao' => 'Đủ số lượng'
                ];
                return response()->json($data);
            }
            else{
                $data = [
                    'soluong' => $this->Product->getProductInfo($id)->soluong,
                    'view' => view('shareContent.listCart')->render(),
                    'thongbao' => 'Không đủ số lượng'
                ];
                return response()->json($data);
            }
        }
    }

}
