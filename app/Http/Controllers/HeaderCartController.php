<?php

namespace App\Http\Controllers;

use App\Models\SanphamModel;
use Illuminate\Http\Request;
use \Illuminate\Support\Facades\DB;
use App\Cart;
use App\Models\ChitiethoadonModel;
use Illuminate\Contracts\Session\Session;
use League\CommonMark\Extension\SmartPunct\EllipsesParser;

class HeaderCartController extends Controller
{
    private $Cart;
    private $Product;
    public function __construct()
    {
        $this->Cart = new ChitiethoadonModel();
        $this->Product = new SanphamModel();
    }
    public function index()
    {
        return view('shareHeader.headerCart');
    }
    public function AddCart($id, Request $req)
    {
        $product = DB::table('sanpham')->where('id', $id)->first();

        //dd(session()->get('productMaxQuantity'));
        if (!session()->has('idkhachhang')) { //Khách hàng chưa đăng nhập
            //dd($productQuantity);
            if ($product != null) {
                $oldCart = Session('Cart') ? Session('Cart') : null;
                $newCart = new Cart($oldCart);

                $productInCartQuantity = $newCart->getProductQuantity($id) ;

                if ($productInCartQuantity + 1  <= $product->soluong) { // Kiểm tra số lượng sản phẩm có trong giỏ hàng, nếu thấp hơn thì mới thêm vào
                    $newCart->AddCart($product, $id);

                    //dd($newCart);
                    $req->session()->put('Cart', $newCart);

                    return view('shareHeader.headerCart');;
                }
                else {
                    return 'Không đủ số lượng sản phẩm';
                }
            }
        }
        else { //Khách hàng đã đăng nhập
            $idhoadon = $this->Cart->getidhoadon(session()->get('idkhachhang'));
            $productQuantity = $this->Cart->getProductInCartInfo($idhoadon->id,$id);
            if($productQuantity + 1 <= $product->soluong){
                $dataInsert = [
                    $idhoadon->id,
                    $product->id,
                    1,
                    $product->giaban,
                ];
                //dd($idhoadon->id);
                $this->Cart->addCart($dataInsert);
                //$newwCart->addCart($dataInsert);
                return view('shareHeader.headerCart');
            }
            else{
                return 'Không đủ số lượng sản phẩm';
            }
        }
    }
    public function DeleteItemCart($id, Request $req)
    {
        if (!session()->has('idkhachhang')) { //Khách hàng chưa đăng nhập
            $oldCart = Session('Cart') ? Session('Cart') : null;
            $newCart = new Cart($oldCart);
            $newCart->DeleteItemInCart($id);

            if (Count($newCart->products) > 0) {
                $req->session()->put('Cart', $newCart);
            } else {
                $req->session()->forget('Cart');
            }
            return view('shareHeader.headerCart');
        } else {
            $idhoadon = $this->Cart->getidhoadon(session()->get('idkhachhang'));
            $dataInsert = [
                $idhoadon->id,
                $id,
            ];
            $this->Cart->deleteCart($dataInsert);
            return view('shareHeader.headerCart');
        }
    }
    public function search(Request $req){
        if($req->ajax()){
            $productsInfo = DB::table('sanpham')
            ->join('loaisanpham', 'sanpham.idloaisanpham', '=', 'loaisanpham.id')
            ->select('loaisanpham.ten', 'sanpham.id', 'sanpham.tensanpham', 'sanpham.soluong','sanpham.giaban','sanpham.anhsanpham')
            ->where('tensanpham', 'like', '%' . $req->search . '%')
            ->orwhere('loaisanpham.ten', 'like', '%' . $req->search . '%')->paginate(5);;
            if($req->search == null){
                return null;
            }
            else if($productsInfo->isNotEmpty()){
                return view('ShareBlocks.searchProduct',compact('productsInfo'));
            }
            else{
                // return '<div class="single-cart1 clearfix"> Không có sản phẩm nào có tên là: '.$req->search .'</div>';
                return null;
            }
        }
    }
}
