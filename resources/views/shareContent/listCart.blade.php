<!-- tr -->
<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\ChitiethoadonModel;

if (session()->has('idkhachhang')) { // Khách hàng đã đăng nhập
    $id = session()->get('idkhachhang');
    $user = new ChitiethoadonModel();
    $cartQuanity = $user->cartTotalQuanity($id);
    $listCart = $user->cartList($id);
    $tonggia = $user->cartTotalPrice($id);
}
?>

{{-- <style>
    .box {
        display: flex;
        flex-direction: row;
        align-items: center;
    }

    .box-item {
        width: 26px;
        height: 23px;
        background-color: #999;
    }

    card-container {
        width: 50px;
        height: 23px;
        border: 1px #999 solid;
    }
</style> --}}

<!-- tr -->
@csrf
@if (!session()->has('idkhachhang'))
    <!-- Khách hàng vãng lai -->
    <div class="shopping-cart-content">
        <form action="#">
            <div class="table-content table-responsive mb-50">
                <table class="text-center">
                    <thead>
                        <tr>
                            <th class="product-thumbnail">Sản phẩm</th>
                            <th class="product-price">Giá tiền</th>
                            <th class="product-quantity">Số lượng</th>
                            <th class="product-subtotal">Tổng giá</th>
                            <th class="product-remove">Xóa</th>
                        </tr>
                    </thead>
                    <tbody id="listCart">
                        <!-- tr -->
                        @if (Session::has('Cart') != null)
                            @foreach (Session::get('Cart')->products as $product)
                                <tr>
                                    <td class="product-thumbnail">
                                        <div class="pro-thumbnail-img">
                                            <img  style="width:70px; height:70px" src="{{$product['productInfo']->anhsanpham}}" alt="">
                                        </div>
                                        <div class="pro-thumbnail-info text-start">
                                            <h6 class="product-title-2">
                                                <a style='display: inline-block; width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'
                                                    href="{{ url('Single-Product', ['id' => $product['productInfo']->id]) }}">{{ $product['productInfo']->tensanpham }}</a>
                                            </h6>
                                            <p>Model:
                                                <?php
                                                $type = DB::select('SELECT lsp.ten FROM `sanpham` s INNER JOIN loaisanpham lsp ON s.idloaisanpham = lsp.id WHERE s.id = ' . $product['productInfo']->id);
                                                echo $type[0]->ten;
                                                ?>
                                            </p>
                                        </div>
                                    </td>
                                    <td class="product-price">{{ number_format($product['productInfo']->giaban) }} VNĐ
                                    </td>
                                    <td class="product-quantity">
                                        <div class="cart-plus-minus f-left" onclick="SaveItemListCart(this)">
                                            <input data-id="{{ $product['productInfo']->id }}" type="text"
                                                id="quanity-item-{{ $product['productInfo']->id }}"
                                                value="{{ $product['quanity'] }}" name="qtybutton"
                                                class="cart-plus-minus-box">
                                        </div>
                                        {{-- <div class="box">
                                            <button class="box-item" id="increase-quanity">
                                                <p style="color: white">-</p>
                                            </button>
                                            <card-container>
                                                <input data-id="{{ $product['productInfo']->id }}" type="text"
                                                    id="quanity-item-{{ $product['productInfo']->id }}"
                                                    value="{{ $product['quanity'] }}" class='cart-plus-minus-box'>
                                            </card-container>
                                            <button class="box-item">
                                                <p style="color: white">+</p>
                                            </button>
                                        </div> --}}
                                    </td>
                                    <td class="product-subtotal">{{ number_format($product['price']) }} </td>
                                    {{-- <td class="product-save">
                                    <a onclick="SaveItemListCart({{($product['productInfo']->id)}})" href="javascript:"><i class="zmdi zmdi-save"></i></a>
                                </td> --}}
                                    <td class="product-remove">
                                        <a onclick="DeleteItemListCart({{ $product['productInfo']->id }})"
                                            href="javascript:"><i class="zmdi zmdi-close"></i></a>
                                    </td>
                                </tr>
                            @endforeach
                        @else
                            {{-- null --}}
                        @endif
                        <!-- tr -->
                    </tbody>
                </table>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="coupon-discount box-shadow p-30 mb-50">
                        <h6 class="widget-title border-left mb-20">Mã Giảm giá</h6>
                        <p>Hãy Nhập mã giảm giá nếu bạn có !</p>
                        <input type="text" name="name" placeholder="Nhập mã giảm giá vào đây">
                        <button class="submit-btn-1 black-bg btn-hover-2" type="submit">áp dụng mã</button>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="payment-details box-shadow p-30 mb-50">
                        <h6 class="widget-title border-left mb-20">hóa đơn</h6>
                        <table>
                            <tr>
                                <td class="td-title-1">Tổng giá giỏ hàng</td>
                                <td class="td-title-2">
                                    @if (Session::has('Cart') != null)
                                        {{ number_format(Session::get('Cart')->totalPrice) }} VNĐ
                                    @else
                                        0 VNĐ
                                    @endif
                                </td>
                            </tr>
                            <tr>
                                <td class="td-title-1">Phí ship</td>
                                <td class="td-title-2">15,000 VNĐ</td>
                            </tr>
                            <tr>
                                <td class="td-title-1">Vat</td>
                                <td class="td-title-2">$00.00</td>
                            </tr>
                            <tr>
                                <td class="order-total">Tổng đơn hàng</td>
                                <td class="order-total-price">
                                    @if (Session::has('Cart') != null)
                                        {{ number_format(Session::get('Cart')->totalPrice + 15000) }} VNĐ
                                    @else
                                        0 VNĐ
                                    @endif
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="culculate-shipping box-shadow p-30">
                        <h6 class="widget-title border-left mb-20">Tính toán đơn hàng </h6>
                        <p>Nhập địa chỉ của bạn</p>
                        <div class="row">
                            <div class="col-sm-4 col-xs-12">
                                <input type="text" placeholder="Country">
                            </div>
                            <div class="col-sm-4 col-xs-12">
                                <input type="text" placeholder="Region / State">
                            </div>
                            <div class="col-sm-4 col-xs-12">
                                <input type="text" placeholder="Post code">
                            </div>
                            <div class="col-md-12">
                                <a id="checkout-button" href="{{ route('checkout') }}"><button type="button"
                                        class="submit-btn-1 black-bg btn-hover-2">Nhận báo giá</button></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <script>
        var cartQuantity = "<?php if(Session::has('Cart') != null){ echo Session::get('Cart')->totalQuanity ; } else{} ?>";
        if(cartQuantity == 0)
        {
            document.getElementById('checkout-button').addEventListener('click', function(event123) {
            event.preventDefault();
            console.log(event123);
            alertify.error('Vui lòng thêm sản phẩm vào giỏ hàng');
            });
        }
    </script>
@else
    <!--Khách hàng đã đăng nhập -->
    <div class="shopping-cart-content">
        <form action="#">
            <div class="table-content table-responsive mb-50">
                <table class="text-center">
                    <thead>
                        <tr>
                            <th class="product-thumbnail">Sản phẩm</th>
                            <th class="product-price">Giá tiền</th>
                            <th class="product-quantity">Số lượng</th>
                            <th class="product-subtotal">Tổng giá</th>
                            <th class="product-remove">Xóa</th>
                        </tr>
                    </thead>
                    <tbody id="listCart">
                        <!-- tr -->
                        @foreach ($listCart as $product)
                            <tr>
                                <td class="product-thumbnail">
                                    <div class="pro-thumbnail-img">
                                        <img style="width:70px; height:70px" src="{{$product->anhsanpham}}" alt="">
                                    </div>
                                    <div class="pro-thumbnail-info text-start">
                                        <h6 class="product-title-2">
                                            <a style='display: inline-block; width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;' href="#"><?php echo $product->tensanpham; ?></a>
                                        </h6>
                                        <p>Model:
                                            <?php
                                            $type = DB::select('SELECT lsp.ten FROM `sanpham` s INNER JOIN loaisanpham lsp ON s.idloaisanpham = lsp.id WHERE s.id = ' . $product->id);
                                            echo $type[0]->ten;
                                            ?>
                                        </p>
                                    </div>
                                </td>
                                <td class="product-price"><?php echo number_format($product->giaban); ?> ₫
                                </td>
                                <td class="product-quantity">
                                    <div class="cart-plus-minus f-left" onclick="SaveItemListCart(this)">
                                        <input data-id="{{ $product->id }}" id="quanity-item-{{ $product->id }}"
                                            type="text" value="{{ $product->soluong }}" name="qtybutton"
                                            class="cart-plus-minus-box">
                                    </div>
                                </td>
                                <td class="product-subtotal">{{ number_format($product->giaban * $product->soluong) }}
                                    ₫
                                </td>
                                {{-- <td class="product-save">
                                    <a onclick="SaveItemListCart({{($product['productInfo']->id)}})" href="javascript:"><i class="zmdi zmdi-save"></i></a>
                                </td> --}}
                                <td class="product-remove">
                                    <a onclick="DeleteItemListCart({{ $product->id }})" href="javascript:"><i
                                            class="zmdi zmdi-close"></i></a>
                                </td>
                            </tr>
                        @endforeach
                        <!-- tr -->
                    </tbody>
                </table>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="coupon-discount box-shadow p-30 mb-50">
                        <h6 class="widget-title border-left mb-20">Mã Giảm giá</h6>
                        <p>Hãy Nhập mã giảm giá nếu bạn có !</p>
                        <input type="text" name="name" placeholder="Nhập mã giảm giá vào đây">
                        <button class="submit-btn-1 black-bg btn-hover-2" type="submit">áp dụng mã</button>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="payment-details box-shadow p-30 mb-50">
                        <h6 class="widget-title border-left mb-20">hóa đơn</h6>
                        <table>
                            <tr>
                                <td class="td-title-1">Tổng giá giỏ hàng</td>
                                <td class="td-title-2">
                                    {{ number_format($tonggia->tonggia) }} ₫
                                </td>
                            </tr>
                            <tr>
                                <td class="td-title-1">Phí ship</td>
                                <td class="td-title-2">15,000 ₫</td>
                            </tr>
                            <tr>
                                <td class="td-title-1">Vat</td>
                                <td class="td-title-2">00.00 ₫</td>
                            </tr>
                            <tr>
                                <td class="order-total">Tổng đơn hàng</td>
                                <td class="order-total-price">
                                    {{ number_format($tonggia->tonggia + 15000) }} ₫
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="culculate-shipping box-shadow p-30">
                        <h6 class="widget-title border-left mb-20">Tính toán đơn hàng </h6>
                        <p>Nhập địa chỉ của bạn</p>
                        <div class="row">
                            <div class="col-sm-4 col-xs-12">
                                <input type="text" placeholder="Country">
                            </div>
                            <div class="col-sm-4 col-xs-12">
                                <input type="text" placeholder="Region / State">
                            </div>
                            <div class="col-sm-4 col-xs-12">
                                <input type="text" placeholder="Post code">
                            </div>
                            <div class="col-md-12">
                                <a id="checkout-button" href="{{ route('checkout') }}"><button type="button"
                                        class="submit-btn-1 black-bg btn-hover-2">Nhận báo giá</button></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <script>
        var cartQuantity = "<?php echo $cartQuanity->soluong; ?>";
        if(cartQuantity == 0)
        {
            document.getElementById('checkout-button').addEventListener('click', function(event) {
            event.preventDefault();
            alertify.error('Vui lòng thêm sản phẩm vào giỏ hàng');
            });
        }
    </script>
@endif
