<?php

namespace App\Http\Controllers;

use App\Models\WishlistModel;
use App\Wishlist;
use Illuminate\Http\Request;
use \Illuminate\Support\Facades\DB;

class WishlistController extends Controller
{
    private $Wishlist;
    public function index(){
        return view('Backend.wishlist');
    }
    public function __construct()
    {
        $this->Wishlist = new WishlistModel();
    }
    public function updateHeader(){
        return view('shareHeader.headerWishlist');
    }
    public function addWishlist($id, Request $req){
        $product = DB::table('sanpham')->where('id', $id)->first();
        if (!session()->has('idkhachhang')) { //Khách vãng lai
            $oldWishlist = Session('Wishlist') ? Session('Wishlist') : null;
            $newWishlist = new Wishlist($oldWishlist);
            $newWishlist->AddWishlist($product, $id);

            $req->session()->put('Wishlist', $newWishlist);

            return view('shareHeader.headerWishlist');
        } else {
            // Dành cho khách hàng đã đăng nhập
            $idWishlist = $this->Wishlist->getIdWishlist(session()->get('idkhachhang'));
            $insertData = [
                $idWishlist,
                $product->id,
            ];
            $this->Wishlist->addWishlist($insertData);
            return view('shareHeader.headerWishlist');
        }
    }
    public function DeleteItemWishlist($id, Request $req){
        if (!session()->has('idkhachhang')) { //Khách vãng lai
            $oldWishlist = Session('Wishlist') ? Session('Wishlist') : null;
            $newWishlist = new Wishlist($oldWishlist);
            $newWishlist->DeleteItemInWishlist($id);

            if (Count($newWishlist->products) > 0) {
                $req->session()->put('Wishlist', $newWishlist);
            } else {
                $req->session()->forget('Wishlist');
            }
            return view('shareContent.wishlistDetail');
        } else {
            // Dành cho khách hàng đã đăng nhập
            $idWishlist = $this->Wishlist->getIdWishlist(session()->get('idkhachhang'));
            $insertData = [
                $idWishlist,
                $id,
            ];
            $this->Wishlist->deleteWishlist($insertData);
            return view('shareContent.wishlistDetail');
        }
    }
}
