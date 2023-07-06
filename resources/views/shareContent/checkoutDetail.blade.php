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
    <!--Khách hàng chưa đăng nhập-->
    <h6 class="widget-title border-left mb-20">our order</h6>
    <table>
        @if (Session::has('Cart') != null)
            @foreach (Session::get('Cart')->products as $product)
                <tr>
                    <td class="td-title-1">{{ $product['productInfo']->tensanpham }} x {{ $product['quanity'] }} </td>
                    <td class="td-title-2">{{ number_format($product['price']) }} VNĐ</td>
                </tr>
            @endforeach
            <tr>
                <td class="td-title-1">Giá tổng giỏ hàng</td>
                <td class="td-title-2">
                    @if (Session::has('Cart') != null)
                        {{ number_format(Session::get('Cart')->totalPrice) }} VNĐ
                    @else
                        0 VNĐ
                    @endif
                </td>
            </tr>
            <tr>
                <td class="td-title-1">Giá ship</td>
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
        @endif
    </table>
@else
    <?php
    $tenKhachhang = DB::select('SELECT hovaten FROM `khachhang` WHERE id = ' . $id);
    ?>
    <h6 class="widget-title border-left mb-20">Giỏ hàng của <?php echo $tenKhachhang[0]->hovaten; ?></h6>
    <table>
            @foreach ($listCart as $product)
                <tr>
                    <td class="td-title-1">{{ $product->tensanpham }} x {{ $product->soluong }}</td>
                    <td class="td-title-2">{{ number_format($product->giaban * $product->soluong) }} VNĐ</td>
                </tr>
            @endforeach
            <tr>
                <td class="td-title-1">Giá tổng giỏ hàng</td>
                <td class="td-title-2">
                    {{ number_format($tonggia->tonggia) }} VNĐ
                </td>
            </tr>
            <tr>
                <td class="td-title-1">Giá ship</td>
                <td class="td-title-2">15,000 VNĐ</td>
            </tr>
            <tr>
                <td class="td-title-1">Vat</td>
                <td class="td-title-2">0 VNĐ</td>
            </tr>
            <tr>
                <td class="order-total">Tổng đơn hàng</td>
                <td class="order-total-price">
                    {{ number_format($tonggia->tonggia + 15000) }} VNĐ
                </td>
            </tr>
    </table>
@endif
