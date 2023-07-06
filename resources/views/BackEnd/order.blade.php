@extends('FrontEnd.orderMaster')

@section('content')
    <style>
        .text-right {
            margin-left: 30px;
        }
    </style>

    <div class="tab-pane active" id="order-complete">
        <div class="order-complete-content box-shadow">
            <div class="thank-you p-30 text-center">
                <h6 class="text-black-5 mb-0">Cảm ơn bạn đã mua hàng của công ty chúng tôi. Đơn hàng đã được đóng gói và sẽ
                    đến sớm với bạn </h6>
            </div>
            <div class="order-info p-30 mb-10">
                <ul class="order-info-list">
                    <li>
                        <h6>Mã hóa đơn</h6>
                        <p>{{ $paymentDetail[0]->idpayment }}</p>
                    </li>
                    <li>
                        <h6>Tên người nhận</h6>
                        <p>{{ $paymentDetail[0]->ten }}</p>
                    </li>
                    <li>
                        <h6>Thành phố</h6>
                        <p>{{ $paymentDetail[0]->thanhpho }}</p>
                    </li>
                </ul>
            </div>
            <div class="row">
                <!-- our order -->
                <div class="col-md-6">
                    <div class="payment-details p-30">
                        <h6 class="widget-title border-left mb-20">Đơn hàng của bạn</h6>
                        <table>
                            @foreach ($paymentDetail as $product)
                                <tr>
                                    <td class="td-title-1">{{ $product->tensanpham }} x {{ $product->soluong }}</td>
                                    <td class="td-title-2">{{ number_format($product->giaban * $product->soluong) }} ₫</td>
                                </tr>
                            @endforeach
                            <tr>
                                <td class="td-title-1">Tổng giá giỏ hàng</td>
                                <td class="td-title-2">{{ number_format($paymentDetail[0]->tonggia - 15000) }} ₫</td>
                            </tr>
                            <tr>
                                <td class="td-title-1">Shipping and Handing</td>
                                <td class="td-title-2">15,000 ₫</td>
                            </tr>
                            <tr>
                                <td class="td-title-1">Vat</td>
                                <td class="td-title-2">Miễn phí</td> <!-- nếu có vat thì nhân thêm số phần trăm vat -->
                            </tr>
                            <tr>
                                <td class="order-total">Order Total</td>
                                <td class="order-total-price">{{ number_format($paymentDetail[0]->tonggia) }} ₫</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="bill-details p-30">
                        <h6 class="widget-title border-left mb-20">Thông tin hóa đơn</h6>
                        <ul class="bill-address">
                            <li>
                                <span>Address:</span>
                                {{ $paymentDetail[0]->diachi }}
                            </li>
                            <li>
                                <span>email:</span>
                                {{ $paymentDetail[0]->email }}
                            </li>
                            <li>
                                <span>phone: </span>
                                {{ $paymentDetail[0]->sodienthoai }}
                            </li>
                        </ul>
                    </div>
                    {{-- <div class="bill-details pl-30">
                        <h6 class="widget-title border-left mb-20">billing details</h6>
                        <ul class="bill-address">
                            <li>
                                <span>Address:</span>
                                28 Green Tower, Street Name, New York City, USA
                            </li>
                            <li>
                                <span>email:</span>
                                info@companyname.com
                            </li>
                            <li>
                                <span>phone : </span>
                                (+880) 19453 821758
                            </li>
                        </ul>
                    </div> --}}
                    <a href="{{ route('home') }}">
                        <button class="submit-btn-1 mt-30 btn-hover-1 text-right" type="button">Quay lại trang chủ
                        </button>
                    </a>
                </div>
            </div>
        </div>
    </div>
@endsection
