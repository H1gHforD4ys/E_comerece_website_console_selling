<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \Illuminate\Support\Facades\DB;


class QuickviewController extends Controller
{
    public function index($id, Request $req)
    {
        $product = DB::table('sanpham')->where('id', $id)->first();
        $req->session()->put('productQuickview', [
            'id' => $product->id,
            'name' => $product->tensanpham,
            'price' => $product->giaban,
            'image' => $product->anhsanpham,
        ]);
        //dd($req->session()->get('product.name'));
        return view('shareContent.quickviewDetail');
    }
}
