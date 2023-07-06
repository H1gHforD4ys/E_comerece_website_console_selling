<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\WishlistModel;

if (session()->has('idkhachhang')) {
    $id = session()->get('idkhachhang');
    $user = new WishlistModel();
    $Wishlist = $user->wishlist($id);
}
?>
@if (!session()->has('idkhachhang')) <!--Khách hàng vãng lai -->
    <table class="text-center">
        <thead>
            <tr>
                <th class="product-thumbnail">Sản phẩm</th>
                <th class="product-price">Giá</th>
                <th class="product-stock">Tình trạng</th>
                <th class="product-add-cart">Thêm vào giỏ hàng</th>
                <th class="product-remove">Xóa</th>
            </tr>
        </thead>
        <tbody>
            <!-- tr -->
            @if (Session::has('Wishlist') != null)
                @foreach (Session::get('Wishlist')->products as $product)
                    <tr>
                        <td class="product-thumbnail">
                            <div class="pro-thumbnail-img">
                                <img style="width:70px;height:70px" src="{{$product['productInfo']->anhsanpham}}" alt="">
                            </div>
                            <div class="pro-thumbnail-info text-start">
                                <h6 class="product-title-2">
                                    <a href="#">{{$product['productInfo']->tensanpham}}</a>
                                </h6>
                                <p>Loại: <?php
                                    $type = DB::select('SELECT lsp.ten FROM `sanpham` s INNER JOIN loaisanpham lsp ON s.idloaisanpham = lsp.id WHERE s.id = ' . $product['productInfo']->id);
                                    echo $type[0]->ten;
                                    ?></p>
                            </div>
                        </td>
                        <td class="product-price">{{ number_format($product['price']) }} VNĐ</td>
                        <td class="product-stock text-uppercase">Còn hàng</td>
                        <td class="product-add-cart">
                            <a onclick="AddCart({{$product['productInfo']->id}})" href="javascript:" title="Add To Cart">
                                <i class="zmdi zmdi-shopping-cart-plus"></i>
                            </a>
                        </td>
                        <td class="product-remove">
                            <a onclick="DeleteItemWishlist({{$product['productInfo']->id}})" href="javascript:"><i class="zmdi zmdi-close"></i></a>
                        </td>
                    </tr>
                    <!-- tr -->
                    @endforeach
                @endif
        </tbody>
    </table>

@else <!--Khách hàng đã đăng nhập -->
<table class="text-center">
    <thead>
        <tr>
            <th class="product-thumbnail" >Sản phẩm</th>
            <th class="product-price">Giá</th>
            <th class="product-stock">Tình trạng</th>
            <th class="product-add-cart">Thêm vào giỏ hàng</th>
            <th class="product-remove">Xóa</th>
        </tr>
    </thead>
    <tbody>
        <!-- tr -->
            @foreach ($Wishlist as $product)
                <tr>
                    <td class="product-thumbnail">
                        <div class="pro-thumbnail-img">
                            <img style="width:70px;height:70px" src="{{$product->anhsanpham}}" alt="">
                        </div>
                        <div class="pro-thumbnail-info text-start">
                            <h6 class="product-title-2">
                                <a href="#" >{{$product->tensanpham}}</a>
                            </h6>
                            <p>Loại: {{$product->ten}}
                        </div>
                    </td>
                    <td class="product-price">{{ number_format($product->giaban) }} VNĐ</td>
                    <td class="product-stock text-uppercase">Còn hàng</td>
                    <td class="product-add-cart">
                        <a onclick="AddCart({{$product->id}})" href="javascript:" title="Add To Cart">
                            <i class="zmdi zmdi-shopping-cart-plus"></i>
                        </a>
                    </td>
                    <td class="product-remove">
                        <a onclick="DeleteItemWishlist({{$product->id}})" href="javascript:"><i class="zmdi zmdi-close"></i></a>
                    </td>
                </tr>
                <!-- tr -->
                @endforeach
    </tbody>
</table>
@endif
