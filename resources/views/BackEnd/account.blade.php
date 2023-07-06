@extends('FrontEnd.myAccountMaster')

@section('content')
    <div id="page-content" class="page-wrapper section">

        <!-- LOGIN SECTION START -->
        <div class="login-section mb-80">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <div class="my-account-content" id="accordion">
                            <!-- My Personal Information -->
                            {{-- <div class="card mb-15">
                                <div class="card-header" id="headingOne">
                                    <h4 class="card-title">
                                        <a href="" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true"
                                            aria-controls="collapseOne">Thông tin cá nhân</a>
                                    </h4>
                                </div>
                                <div id="collapseOne" class="collapse show" aria-labelledby="headingOne"
                                    data-bs-parent="#accordion">
                                    <div class="card-body">
                                        <form action="" method="post">
                                            <div class="new-customers">
                                                <div class="p-30">
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <input type="text" placeholder="First Name">
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <input type="text" placeholder="last Name">
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <select class="custom-select">
                                                                <option value="defalt">country</option>
                                                                <option value="c-1">Australia</option>
                                                                <option value="c-2">Bangladesh</option>
                                                                <option value="c-3">Unitd States</option>
                                                                <option value="c-4">Unitd Kingdom</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <select class="custom-select">
                                                                <option value="defalt">State</option>
                                                                <option value="c-1">Melbourne</option>
                                                                <option value="c-2">Dhaka</option>
                                                                <option value="c-3">New York</option>
                                                                <option value="c-4">London</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <select class="custom-select">
                                                                <option value="defalt">Town/City</option>
                                                                <option value="c-1">Victoria</option>
                                                                <option value="c-2">Chittagong</option>
                                                                <option value="c-3">Boston</option>
                                                                <option value="c-4">Cambridge</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <input type="text" placeholder="Phone here...">
                                                        </div>
                                                    </div>
                                                    <input type="text" placeholder="Company neme here...">
                                                    <input type="text" placeholder="Email address here...">
                                                    <input type="password" placeholder="Password">
                                                    <input type="password" placeholder="Confirm Password">
                                                    <textarea class="custom-textarea" placeholder="Additional information..."></textarea>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <button class="submit-btn-1 mt-20 btn-hover-1" type="submit"
                                                                value="register">Save</button>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <button class="submit-btn-1 mt-20 btn-hover-1 f-right"
                                                                type="reset">Clear</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div> --}}
                            <!-- My billing details -->
                            <div class="card mb-15">
                                <div class="card-header">
                                    <h4 class="card-title">
                                        <a href="" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false"
                                            aria-controls="collapseThree">Thông tin cá nhân</a>
                                    </h4>
                                </div>
                                <div id="collapseThree" class="collapse" aria-labelledby="headingThree"
                                    data-bs-parent="#accordion">
                                    <div class="card-body">
                                        <form action="{{route('update-account-info')}}" method="post">
                                            <div class="billing-details p-30">
                                                @csrf
                                                Username:
                                                <input type="text" name="username" value="{{$userInfo->username}}" placeholder="Tên đăng nhập : {{$userInfo->username}}">
                                                Họ và tên:
                                                <input type="text" name="hovaten" value="{{$userInfo->hovaten}}" placeholder="Họ và tên mặc định: {{$userInfo->hovaten}}">
                                                Email:
                                                <input type="text" name="email" value="{{$userInfo->email}}" placeholder="Địa chỉ email: {{$userInfo->email}}">
                                                Số điện thoại:
                                                <input type="text" name="sodienthoai" value="{{$userInfo->sodienthoai}}" placeholder="Số điện thoại: {{$userInfo->sodienthoai}}">
                                                Mật khẩu mới:
                                                <input type="password" name="newpassword" value="{{$userInfo->password}}" placeholder="New Password">
                                                Địa chỉ:
                                                <textarea type="text" name="diachi" value="{{$userInfo->diachi}}" class="custom-textarea" placeholder="">{{$userInfo->diachi}}</textarea>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <button class="submit-btn-1 mt-20 btn-hover-1" type="submit"
                                                            value="register">Save</button>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <button class="submit-btn-1 mt-20 btn-hover-1 f-right"
                                                            type="reset">Clear</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- My Order info -->
                            <div class="card mb-15">
                                <div class="card-header">
                                    <h4 class="card-title">
                                        <a href="" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false"
                                            aria-controls="collapseFour"> Lịch sử giao dịch</a>
                                    </h4>
                                </div>
                                <div id="collapseFour" class="collapse" aria-labelledby="headingFour"
                                    data-bs-parent="#accordion">
                                    <div class="card-body">
                                        <?php
                                            use App\Models\PaymentsModel;
                                            $paymentModel = new PaymentsModel();
                                        ?>
                                        <!-- Thông tin giao dịch -->
                                        @foreach($payments as $item )
                                        <?php
                                        $product = $paymentModel->paymentInfo($item->id);
                                        ?>
                                        <div class="card">
                                            <div class="card-header">
                                                <h4 class="card-title">
                                                    <a href="" data-bs-toggle="collapse" data-bs-target="#collapseFive{{$item->id}}"
                                                        aria-expanded="false" aria-controls="collapseFive{{$item->id}}">Mã hóa đơn: {{$item->id}} | Giá tiền: <?php echo number_format($item->tonggia) ?> đ | Ngày giao dịch : {{date('d/m/Y', strtotime($item->ngaytao))}}</a>
                                                </h4>
                                            </div>
                                            <div id="collapseFive{{$item->id}}" class="collapse" aria-labelledby="headingFive"
                                                data-bs-parent="">
                                                <div class="panel-body">
                                                    <div class="payment-details p-30">
                                                        <table>
                                                            @foreach($product as $item1)
                                                            <tr>
                                                                <td class="td-title-1">{{$item1->tensanpham}} x {{$item1->soluong}}</td>
                                                                <td class="td-title-2">{{number_format($item1->soluong * $item1->giaban)}} ₫</td>
                                                            </tr>
                                                            @endforeach
                                                            <tr>
                                                                <td class="td-title-1">Tổng giỏ hàng</td>
                                                                <td class="td-title-2">{{number_format($product[0]->tonggia)}} ₫</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="td-title-1">Shipping and Handing</td>
                                                                <td class="td-title-2">15,000 ₫</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="td-title-1">Vat</td>
                                                                <td class="td-title-2">Không mất phí</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="order-total">Tổng đơn hàng</td>
                                                                <td class="order-total-price">{{number_format($product[0]->tonggia + 15000)}} ₫</td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <!-- Hết thông tin giao dịch -->
                                        @endforeach
                                    </div>
                                </div>
                            </div>

                            <!-- Payment Method -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- LOGIN SECTION END -->
    </div>
@endsection
