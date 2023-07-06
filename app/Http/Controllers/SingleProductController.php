<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SanphamModel;
use App\Models\TaiKhoanModel;
use App\Models\ChitiethoadonModel;
use \Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use App\Cart;
use App\RecentProduct;

class SingleProductController extends Controller
{
    private $product, $Cart, $User;
    public function __construct()
    {
        $this->product = new SanphamModel();
        $this->Cart = new ChitiethoadonModel();
        $this->User = new TaiKhoanModel();
    }
    public function index($id, Request $req)
    {
        $productInfo = $this->product->getProductInfo($id);
        $productType = $this->product->getProductType($id)->ten;
        $comment = $this->product->getComment($id);

        //Hiển thị danh sách xem gần đây
        $oldRecentItem = Session('recent-item') ? Session('recent-item') : null;
        $newRecentItem = new RecentProduct($oldRecentItem);
        $newRecentItem->AddRecentProduct($productInfo,$id);
        $req->session()->put('recent-item', $newRecentItem);

        //Hiển thị danh sách liên quan
        $relatedProduct = $this->product->getRelatedProduct($productInfo->idloaisanpham);


        return view('BackEnd.singleProduct', compact('productInfo', 'productType','comment','relatedProduct'));
    }
    public function AddCart($id, Request $req, $quanity)
    {
        $product = DB::table('sanpham')->where('id', $id)->first();
        // $productMaxQuantity = $this->product->getProductInfo($id)->soluong;
        // $req->session()->put('productMaxQuantity',$productMaxQuantity);
        if (!session()->has('idkhachhang')) { //Khách hàng chưa đăng nhập
            if ($product != null) {
                $oldCart = Session('Cart') ? Session('Cart') : null;
                $newCart = new Cart($oldCart);

                $productInCartQuantity = $newCart->getProductQuantity($id);

                if ($productInCartQuantity + $quanity <= $product->soluong) {
                    $newCart->AddCartWithQuanity($product, $id, $quanity);
                    $req->session()->put('Cart', $newCart);
                    return view('shareHeader.headerCart');
                } else {
                    return 'Không đủ số lượng';
                }
            }
        } else { //Khách hàng đã đăng nhập
            $idhoadon = $this->Cart->getidhoadon(session()->get('idkhachhang'));

            $productQuantityInCart = $this->Cart->getProductInCartInfo($idhoadon->id, $id);
            //dd($productQuantityInCart);
            if ($productQuantityInCart + $quanity <= $product->soluong) {
                $dataInsert = [
                    $idhoadon->id,
                    $product->id,
                    $quanity,
                    $product->giaban,
                ];
                //dd($idhoadon->id);
                $this->Cart->addCart($dataInsert);
                //$newwCart->addCart($dataInsert);
                return view('shareHeader.headerCart');
            } else {
                return 'Không đủ số lượng';
            }
        }
    }
    public function comment($idkhachhang,$idsanpham,$comment){
        $this->User->comment($idkhachhang,$idsanpham,$comment);
        $comment = $this->product->getComment($idsanpham);
        return view('shareContent.commentSection',compact('comment'));
    }
}
