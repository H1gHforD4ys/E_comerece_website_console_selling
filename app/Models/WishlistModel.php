<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use \Illuminate\Support\Facades\DB;

class WishlistModel extends Model
{
    use HasFactory;
    public function getIdWishlist($data)
    {
        $idWishlist = DB::table('wishlist')->where('idkhachhang', '=', $data)->first();
        return $idWishlist->id;
    }

    public function wishlist($idkhachhang)
    {
        $wishlistList = DB::table('sanpham as s')
            ->join('chitietwishlist as ctw', 'ctw.idsanpham', '=', 's.id')
            ->join('wishlist as w', 'w.id', '=', 'ctw.idwishlist')
            ->join('loaisanpham as lsp', 'lsp.id', '=', 's.idloaisanpham')
            ->where('w.idkhachhang', '=', $idkhachhang)
            ->select('s.tensanpham', 'lsp.ten', 's.giaban', 's.id','s.anhsanpham')
            ->get();
        return $wishlistList;
    }
    public function addWishlist($data)
    {
        $existProduct = DB::table('chitietwishlist')
            ->where('chitietwishlist.idwishlist', '=', $data[0])
            ->where('chitietwishlist.idsanpham', '=', $data[1])->first();;
        if ($existProduct == null) { //Nếu sản phẩm chưa tồn tại trong wishlist
            DB::table('chitietwishlist')
                ->where('wishlist.idwishlist', '=', $data[0])
                ->insert([
                    'idwishlist' => $data[0],
                    'idsanpham' => $data[1],
                ]);
            echo "<script>alertify.success('Đã thêm sản phẩm vào Wishlist');</script>";
        } else {
            //in ra alert gì đó ở đây
            echo "<script>alertify.error('Sản phẩm đã có trong Wislist');</script>";
        }
    }
    public function deleteWishlist($data)
    {
        DB::table('chitietwishlist')
            ->where('idwishlist', '=', $data[0])
            ->where('idsanpham', '=', $data[1])
            ->delete();
    }
    public function countItem($idkhachhang)
    {
        $idwishlist = $this->getIdWishlist($idkhachhang);
        $count = DB::table('chitietwishlist')
            ->where('idwishlist', '=', $idwishlist)
            ->select(DB::raw('COUNT(idwishlist) as count'))->first();
        return $count;
    }
}
