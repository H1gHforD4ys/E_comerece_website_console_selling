<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\ChitiethoadonModel;

if (session()->has('idkhachhang')) {
    $id = session()->get('idkhachhang');
    $user = new ChitiethoadonModel();
    $cartQuanity = $user->cartTotalQuanity($id);
    $listCart = $user->cartList($id);
    $tonggia = $user->cartTotalPrice($id);
}
?>
@if (!session()->has('idkhachhang'))
    <!-- Khách hàng vãng lai -->
    <div class="total-cart-in">
        <div class="cart-toggler">
            <a href="{{ url('/Cart') }}">
                <span class="cart-quantity">
                    @if (Session::has('Cart') != null)
                        {{ Session::get('Cart')->totalQuanity }}
                    @else
                        0
                    @endif
                </span><br>
                <span class="cart-icon">
                    <i class="zmdi zmdi-shopping-cart-plus"></i>
                </span>
            </a>
        </div>
        <ul>
            <li>
                <div class="top-cart-inner your-cart">
                    <h5 class="text-capitalize">Your Cart</h5>
                </div>
            </li>
            <li>
                <div class="total-cart-pro">
                    @if (Session::has('Cart') != null)
                        @foreach (Session::get('Cart')->products as $product)
                            <!-- single-cart -->
                            <div class="single-cart clearfix">
                                <div class="cart-img f-left">
                                    <a href="{{ url('Single-Product', ['id' => $product['productInfo']->id]) }}">
                                        <img style="width:70px; height:100px"
                                            src="{{ $product['productInfo']->anhsanpham }}" alt="Cart Product" />
                                    </a>
                                    <div class="del-icon">
                                        <a href="#?">
                                            <i class="zmdi zmdi-close" data-id="{{ $product['productInfo']->id }}"></i>
                                        </a>
                                        {{-- <a onclick="DeleteItemCart({{ $product['productInfo']->id }})"
                                            href="javascript:">
                                            <i class="zmdi zmdi-close"></i>
                                        </a> --}}
                                    </div>
                                </div>
                                <div class="cart-info f-left">
                                    <h6 class="text-capitalize">
                                        <a href="{{ url('Single-Product', ['id' => $product['productInfo']->id]) }}"
                                            style='display: inline-block; width: 170px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'>{{ $product['productInfo']->tensanpham }}</a>
                                    </h6>
                                    <p>
                                        <span>Loại<strong>:</strong></span>
                                        <span
                                            style="display: inline-block;
                                        width: 150px;
                                        white-space: nowrap;
                                        overflow: hidden;
                                        text-overflow: ellipsis;">
                                            <?php
                                            $type = DB::select('SELECT lsp.ten FROM `sanpham` s INNER JOIN loaisanpham lsp ON s.idloaisanpham = lsp.id WHERE s.id = ' . $product['productInfo']->id);
                                            echo $type[0]->ten;
                                            ?>
                                        </span>
                                    </p>
                                    <p>
                                        <span style='display: inline-block; width: 70px;'>Số lượng <strong>
                                                :</strong></span> {{ $product['quanity'] }}
                                    </p>
                                    <p>
                                        <span style='display: inline-block; width: 70px;'>Giá <strong>:</strong></span>
                                        {{ number_format($product['price']) }} VNĐ
                                    </p>
                                </div>
                            </div>
                            <!-- end single-cart -->
                        @endforeach
                    @endif
                </div>
            </li>
            <li>
                <div class="top-cart-inner subtotal">
                    <h4 class="text-uppercase g-font-2">
                        Total =
                        <span>
                            @if (Session::has('Cart') != null)
                                {{ number_format(Session::get('Cart')->totalPrice) }} VNĐ
                            @else
                                0 VNĐ
                            @endif
                        </span>
                    </h4>
                </div>
            </li>
            <li>
                <div class="top-cart-inner view-cart">
                    <h4 class="text-uppercase">
                        <a href="{{ url('/Cart') }}">View cart</a>
                    </h4>
                </div>
            </li>
            <li>
                <div class="top-cart-inner check-out">
                    <h4 class="text-uppercase">
                        <a id="header-checkout-button" href="{{ url('/Checkout') }}">Check out</a>
                    </h4>
                </div>
            </li>
        </ul>
    </div>
    <script>
        var cartQuantity = "<?php if (Session::has('Cart') != null) {echo Session::get('Cart')->totalQuanity;} ?>";
        if (cartQuantity == 0) {
            document.getElementById('header-checkout-button').addEventListener('click', function(event) {
                event.preventDefault();
                alertify.error('Vui lòng thêm sản phẩm vào giỏ hàng');
            });
        }
    </script>
@else
    {{-- Nếu đã có khách hàng đăng nhập  --}}
    <div class="total-cart-in">
        <div class="cart-toggler">
            <a href="{{ url('/Cart') }}">
                <span class="cart-quantity">
                    @if ($cartQuanity->soluong)
                        <?php echo $cartQuanity->soluong; ?>
                    @else
                        0
                    @endif
                </span><br>
                <span class="cart-icon">
                    <i class="zmdi zmdi-shopping-cart-plus"></i>
                </span>
            </a>
        </div>
        <ul>
            <li>
                <div class="top-cart-inner your-cart">
                    <h5 class="text-capitalize">Your Cart</h5>
                </div>
            </li>
            <li>
                <div class="total-cart-pro">
                    @foreach ($listCart as $product)
                        <!-- single-cart -->
                        <div class="single-cart clearfix">
                            <div class="cart-img f-left">
                                <a href="#">
                                    <img style="width:70px; height:100px" src="{{ $product->anhsanpham }}"
                                        alt="Cart Product" />
                                </a>
                                <div class="del-icon">
                                    <a href="#?">
                                        <i class="zmdi zmdi-close" data-id="{{ $product->id }}"></i>
                                    </a>
                                    {{-- <a onclick="DeleteItemCart({{$product->id}})" href="javascript:">
                                        <i class="zmdi zmdi-close"></i>
                                    </a> --}}
                                </div>
                            </div>
                            <div class="cart-info f-left">
                                <h6 class="text-capitalize">
                                    <a href="#"
                                    style='display: inline-block; width: 170px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;'><?php echo $product->tensanpham; ?></a>
                                </h6>
                                <p>
                                    <span>Loại<strong>:</strong></span><span style="display: inline-block;
                                        width: 150px;
                                        white-space: nowrap;
                                        overflow: hidden;
                                        text-overflow: ellipsis;"><?php echo $product->ten; ?></span>
                                </p>
                                <p>
                                    <span style='display: inline-block; width: 70px;'>Số
                                        lượng<strong>:</span></strong><?php echo $product->soluong; ?>
                                </p>
                                <p>
                                    <span style='display: inline-block; width: 70px;'>Giá
                                        <strong>:</strong></span><?php echo number_format($product->giaban); ?>
                                    VNĐ
                                </p>
                            </div>
                        </div>
                        <!-- end single-cart -->
                    @endforeach
                </div>
            </li>
            <li>
                <div class="top-cart-inner subtotal">
                    <h4 class="text-uppercase g-font-2">
                        Total =
                        <span>
                            <?php echo number_format($tonggia->tonggia); ?> VNĐ
                        </span>
                    </h4>
                </div>
            </li>
            <li>
                <div class="top-cart-inner view-cart">
                    <h4 class="text-uppercase">
                        <a href="{{ url('/Cart') }}">Giỏ hàng</a>
                    </h4>
                </div>
            </li>
            <li>
                <div class="top-cart-inner check-out">
                    <h4 class="text-uppercase">
                        <a id="header-checkout-button" href="{{ url('/Checkout') }}">Check out</a>
                    </h4>
                </div>
            </li>
        </ul>
    </div>
    <script>
        var cartQuantity = "<?php echo $cartQuanity->soluong; ?>"
        if (cartQuantity == 0) {
            document.getElementById('header-checkout-button').addEventListener('click', function(event) {
                event.preventDefault();
                alertify.error('Vui lòng thêm sản phẩm vào giỏ hàng');
            });
        }
    </script>
@endif
