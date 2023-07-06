<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use \Illuminate\Support\Facades\DB;

class SanphamModel extends Model
{
    use HasFactory;
    public function hotThisWeek()
    {
        $list = DB::table('sanpham')
            ->where('hotthisweek', '=', 1)
            ->get();
        return $list;
    }
    public function featured()
    {
        $list = DB::table('sanpham')
            ->where('featured', '=', 1)
            ->get();
        return $list;
    }
    public function getProductInfo($id)
    {
        $list = DB::table('sanpham')
            ->where('id', '=', $id)
            ->first();
        return $list;
    }
    public function getProductType($id)
    {
        return DB::table('loaisanpham')
            ->join('sanpham', 'sanpham.idloaisanpham', '=', 'loaisanpham.id')
            ->where('sanpham.id', '=', $id)
            ->select('loaisanpham.ten')->first();
    }
    public function getAllProductInfo($id)
    {
        return DB::table('sanpham')->where('idloaisanpham', $id)
            ->join('loaisanpham', 'sanpham.idloaisanpham', '=', 'loaisanpham.id')
            ->select('sanpham.*', 'loaisanpham.ten as tenloaisanpham');
    }
    public function searchProduct($name)
    {
        return DB::table('sanpham')
            ->join('loaisanpham', 'sanpham.idloaisanpham', '=', 'loaisanpham.id')
            ->select('loaisanpham.ten', 'sanpham.id', 'sanpham.tensanpham', 'sanpham.soluong', 'sanpham.giaban')
            ->where('tensanpham', 'like', '%' . $name . '%')
            ->orwhere('loaisanpham.ten', 'like', '%' . $name . '%')->paginate(5);
    }
    public function getComment($idsanpham)
    {
        $comment = DB::table('comments')
            ->where('comments.idsanpham', '=', $idsanpham)
            ->join('khachhang', 'khachhang.id', '=', 'comments.idkhachhang')
            ->select('comments.noidung', 'khachhang.hovaten')
            ->get();
        if ($comment->count() > 0) {
            return $comment;
        } else {
            return "Chưa có bình luận nào được viết";
        }
    }
    public function getRelatedProduct($idType)
    {
        $list = DB::table('sanpham')->where('idloaisanpham', '=', $idType)->get();
        $listId = $list->pluck('id'); // trích xuất một cột duy nhất từ kết quả truy vấn
        $listIdArray = $listId->toArray(); // Chuyển đổi thành mảng

        $randomNumber1 = $listIdArray[array_rand($listIdArray)];
        $randomNumber2 = $listIdArray[array_rand($listIdArray)];
        $randomNumber3 = $listIdArray[array_rand($listIdArray)];

        $newlist = [
            DB::table('sanpham')->where('id', '=', $randomNumber1)->first(),
            DB::table('sanpham')->where('id', '=', $randomNumber2)->first(),
            DB::table('sanpham')->where('id', '=', $randomNumber3)->first()
        ];
        return $newlist;
    }
}
