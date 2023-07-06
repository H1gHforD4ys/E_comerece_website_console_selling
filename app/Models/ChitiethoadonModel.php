<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use \Illuminate\Support\Facades\DB;

class ChitiethoadonModel extends Model
{
    use HasFactory;
    public function getidhoadon($idkhachhang)
    {
        $idhoadon = DB::table('hoadon as h')
            ->where('h.idkhachhang', '=', $idkhachhang)
            ->where('h.status', '=', 0)
            ->select('h.id')
            ->first();
        return $idhoadon;
    }
    public function cartList($idkhachhang)
    {
        $cart = DB::table('sanpham as s')
            ->join('chitiethoadon as c', 's.id', '=', 'c.idsanpham')
            ->join('hoadon as h', 'c.idhoadon', '=', 'h.id')
            ->join('loaisanpham as lsp', 's.idloaisanpham', '=', 'lsp.id')
            ->select('s.tensanpham', 's.anhsanpham', 'c.soluong', 'h.tonggia', 's.giaban', 'h.idkhachhang', 'lsp.ten', 's.id')
            ->where('h.idkhachhang', $idkhachhang)
            ->where('h.status', 0)
            ->get();
        return $cart;
    }
    public function cartTotalQuanity($idkhachhang)
    {
        $totalQuanity = DB::table('chitiethoadon')
            ->selectRaw('SUM(soluong) as soluong')
            ->join('hoadon', 'chitiethoadon.idhoadon', '=', 'hoadon.id')
            ->where('hoadon.idkhachhang', '=', $idkhachhang)
            ->where('hoadon.status', '=', '0')
            ->first();
        return $totalQuanity;
    }
    public function cartTotalPrice($idkhachhang)
    {
        $totalPrice = DB::table('chitiethoadon')
            ->join('sanpham', 'sanpham.id', '=', 'chitiethoadon.idsanpham')
            ->join('hoadon', 'hoadon.id', '=', 'chitiethoadon.idhoadon')
            ->select(DB::raw('SUM(chitiethoadon.soluong * sanpham.giaban) as tonggia'))
            ->where('hoadon.idkhachhang', $idkhachhang)
            ->where('hoadon.status', '=', '0')
            ->first();
        return $totalPrice;
    }
    public function addCart($data)
    {
        $existProduct = DB::table('chitiethoadon')
            ->join('hoadon', 'chitiethoadon.idhoadon', '=', 'hoadon.id')
            ->where('hoadon.id', '=', $data[0])
            ->where('hoadon.status', '=', '0')
            ->where('chitiethoadon.idsanpham', '=', $data[1])->first();
        if ($existProduct) { // Nếu sản phẩm đã tồn tại
            $newQuanity = $existProduct->soluong + $data[2];
            DB::table('chitiethoadon')
                ->join('hoadon', 'chitiethoadon.idhoadon', '=', 'hoadon.id')
                ->where('hoadon.id', '=', $data[0])
                ->where('idsanpham', '=', $data[1])
                ->where('hoadon.status', '=', '0')
                ->update(['soluong' => $newQuanity]);
        } else {
            DB::table('chitiethoadon')
                ->join('hoadon', 'chitiethoadon.idhoadon', '=', 'hoadon.id')
                ->where('hoadon.id', '=', $data[0])
                ->where('hoadon.status', '=', '0')
                ->insert([
                    'idhoadon' => $data[0],
                    'idsanpham' => $data[1],
                    'soluong' => $data[2],
                    'gia' => $data[3],
                ]);
        }
    }
    public function deleteCart($data)
    {
        DB::table('chitiethoadon')
            ->where('idhoadon', '=', $data[0])
            ->where('idsanpham', '=', $data[1])
            ->delete();
    }
    public function updateCart($data)
    {
        DB::table('chitiethoadon')
            ->join('hoadon', 'chitiethoadon.idhoadon', '=', 'hoadon.id')
            ->where('hoadon.idkhachhang', '=', $data[0])
            ->where('idsanpham', '=', $data[1])
            ->where('status', '=', 0)
            ->update(['soluong' => $data[2]]);
    }
    public function getProductInCartInfo($idhoadon,$idProduct)
    {
        $info = DB::table('chitiethoadon')
            ->join('hoadon', 'chitiethoadon.idhoadon', '=', 'hoadon.id')
            ->where('hoadon.id', $idhoadon)
            ->where('chitiethoadon.idsanpham', $idProduct)
            ->select('chitiethoadon.soluong')
            ->first();
        if ($info) {
            return $info->soluong;
        } else {
            return 0;
        }
    }
}
