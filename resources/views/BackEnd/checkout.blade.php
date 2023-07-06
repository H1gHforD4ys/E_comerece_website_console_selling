@extends('FrontEnd.checkoutMaster')

@section('checkout')
    <div class="checkout-content box-shadow p-30">
        <form id="checkout-form-change" action="{{ route('shipping-payment') }}" method="POST">
            @csrf
            <div class="row">
                <!-- billing details -->
                <div class="col-md-6">
                    <div class="billing-details pr-10">
                        <h6 class="widget-title border-left mb-20">Hóa đơn</h6>
                        <input type="text" name="hovaten" autocomplete="off" required placeholder="Họ và tên...">
                        <input type="text" name="emailaddress" required placeholder="Địa chỉ email...">
                        <input type="text" name="sodienthoai" required placeholder="Số điện thoại...">
                        <select class="custom-select" required name="thanhpho">
                            <option value="Hà Nội">Hà Nội</option>
                            <option value="Thái Nguyên">Thái Nguyên</option>
                            <option value="Hưng Yên">Hưng Yên</option>
                            <option value="Hải Phòng">Hải Phòng</option>
                        </select>
                        <textarea class="custom-textarea" name="diachi" required placeholder="Địa chỉ..."></textarea>
                    </div>
                </div>
                <div class="col-md-6">
                    <!-- our order -->
                    <div class="payment-details pl-10 mb-50">
                        @include('shareContent.checkoutDetail')
                    </div>
                    <!-- payment-method -->
                    <div class="payment-method">
                        <h6 class="widget-title border-left mb-20">chọn kiểu thanh toán</h6>
                        <div id="accordion">
                            <div class="panel">
                                <h4 class="payment-title box-shadow">
                                    <a onclick="choosePaymentType('Paid-when-recieved')" data-bs-toggle="collapse"
                                        href="#Paid-when-recieved">
                                        Thanh toán khi nhận hàng
                                    </a>
                                </h4>
                                <div id="Paid-when-recieved" class="panel-collapse collapse show" data-bs-parent="#accordion">
                                    <div class="payment-content">
                                        <p>Đơn hàng sẽ vận chuyển đến địa chỉ nhà của bạn và người vận chuyển sẽ thu tiền
                                            của bạn .</p>
                                    </div>
                                </div>
                            </div>
                            {{-- <div class="panel">
                                <h4 class="payment-title box-shadow">
                                    <a class="collapsed" data-bs-toggle="collapse" href="#collapseTwo">
                                        cheque payment
                                    </a>
                                </h4>
                                <div id="collapseTwo" class="panel-collapse collapse" data-bs-parent="#accordion">
                                    <div class="payment-content">
                                        <p>Please send your cheque to Store Name, Store Street, Store Town, Store State /
                                            County, Store Postcode.</p>
                                    </div>
                                </div>
                            </div> --}}
                            <div class="panel">
                                <h4 class="payment-title box-shadow">
                                    <a onclick="choosePaymentType('Online-pay')" data-bs-toggle="collapse"
                                        href="#collapseThree">
                                        Thanh toán Online
                                    </a>
                                </h4>
                                <div id="collapseThree" class="panel-collapse collapse" data-bs-parent="#accordion">
                                    <div class="payment-content">
                                        <p>Thanh toán bằng tài khoản ngân hàng qua cổng thanh toán VNPAY.</p>
                                        <ul class="payent-type mt-10">
                                            <li><a href="#"><img src="img/payment/vnpay.jpg"
                                                        style="width:28px; height:17px;" alt=""></a></li>
                                            {{-- <li><a href="#"><img src="img/payment/2.png"
                                                        style="width:28px; height:17px;" alt=""></a></li>
                                            <li><a href="#"><img src="img/payment/3.png"
                                                        style="width:28px; height:17px;" alt=""></a></li>
                                            <li><a href="#"><img src="img/payment/4.png"
                                                        style="width:28px; height:17px;" alt=""></a></li>
                                        </ul> --}}
                                    </div>
                                </div>
                                <div id="payment-type-change">
                                    {{-- <button class="submit-btn-1 mt-30 btn-hover-1" type="submit" name="redirect">Thanh toán
                                        VNPAY</button> --}}
                                        <a id="shipping-pay" href={{route("shipping-payment")}}><button class="submit-btn-1 mt-30 btn-hover-1" type="submit" >Thanh toán Khi nhận hàng</button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- payment-method end -->
                </div>
            </div>
        </form>
    </div>
    {{-- <script>
        var checkLogin = "<?php if(!session()->has('idkhachhang')){echo null;} else{echo session()->get('idkhachhang');} ?>"
        if(checkLogin == 0){
            document.getElementById('shipping-pay').addEventListener('click',function(event){
                event.preventDefault();
                alertify.error('Vui lòng đăng nhập để sử dụng tính năng này');
            });
        }
    </script> --}}
@endsection
