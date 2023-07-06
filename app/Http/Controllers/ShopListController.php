<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use \Illuminate\Support\Facades\DB;
use App\Models\SanphamModel;

class ShopListController extends Controller
{
    private $product;
    public function __construct(){
        $this->product = new SanphamModel();
    }
    public function index($id = null,Request $req ){
        //session::put('idloaisanpham',$id);
        //dd(session::get('idloaisanpham'));
        $products = $this->product->getAllProductInfo($id)->paginate(4);
        //dd($products);
        return view('BackEnd.shoplist',compact('products'));
    }
}
