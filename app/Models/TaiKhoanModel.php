<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class TaiKhoanModel extends Model
{
    use HasFactory;
    public function register($data){
        $existNumber = DB::table('khachhang')
        ->where('sodienthoai','=',$data[2])->first();
        $existEmail = DB::table('khachhang')
        ->where('email','=',$data[4])->first();
        $existUsername = DB::table('khachhang')
        ->where('username','=',$data[1])->first();
        if($existNumber || $existEmail || $existUsername){
            return false;
        }
        else{
            $id = DB::table('khachhang')->insertGetId([
                'hovaten' => $data[0],
                'username' => $data[1],
                'sodienthoai' => $data[2],
                'diachi' => $data[3],
                'email' => $data[4],
                'password' => $data[5],
            ]);
            DB::table('hoadon')->insert([
                'idkieuthanhtoan' => 1,
                'idkhachhang' => $id
            ]);
            DB::table('wishlist')->insert([
                'idkhachhang' =>$id
            ]);
            return true;
        }
    }
    public function getUserInfo($idkhachhang){
        return DB::table('khachhang')->where('id','=',$idkhachhang)->first();
    }
    public function updateAccountInfo($idkhachhang,$data){
        DB::table('khachhang')
        ->where('id','=',$idkhachhang)
        ->update([
            'username' => $data[0],
            'hovaten' => $data[1],
            'email' =>$data[2],
            'sodienthoai' =>$data[3],
            'password'=>$data[4],
            'diachi'=>$data[5]
        ]);
    }
    public function comment($idkhachhang,$idsanpham,$comment){
        DB::table('comments')->insert([
            'idkhachhang' => $idkhachhang,
            'idsanpham' => $idsanpham,
            'noidung' => $comment
        ]);
    }
}
