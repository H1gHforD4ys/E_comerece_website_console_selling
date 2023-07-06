@extends('FrontEnd.loginAndRegisterMaster')

@section('login')
    <div class="col-lg-6">
        <div class="registered-customers">
            <h6 class="widget-title border-left mb-50">Đăng nhập nếu đã có tài khoản</h6>
            @if (Session::has('ErrorLogin'))
                <div class="alert alert-danger">
                    {{ Session::get('ErrorLogin') }}
                </div>
            @endif
            <form action="{{ route('login') }}" method="post">
                @csrf
                <div class="login-account p-30 box-shadow">
                    <p>If you have an account with us, Please log in.</p>
                    <input type="text" name="username" placeholder="Tên đăng nhập">
                    <input type="password" name="password" placeholder="Mật khẩu">
                    <p><small><a href="#">Forgot our password?</a></small></p>
                    <button class="submit-btn-1 btn-hover-1" type="submit">login</button>
                </div>
            </form>
        </div>
    </div>
@endsection

@section('register')

    <div class="col-lg-6">
        <div class="new-customers">
            @if (Session::has('Error'))
                <div class="alert alert-danger">
                    {{ Session::get('Error') }}
                </div>
            @endif
            @if(Session::has('Success'))
            <div class="alert alert-success">
                {{ Session::get('Success') }}
            </div>
            @endif
            <form action="{{ route('register') }}" method="post">
                @csrf
                <h6 class="widget-title border-left mb-50">Đăng kí thành viên</h6>
                <div class="login-account p-30 box-shadow">
                    <div class="row">
                        <div class="col-sm-6">
                            <input type="text" name="hovaten-register" placeholder="Họ và tên..." required>
                        </div>
                        <div class="col-sm-6">
                            <input type="text" name="username-register" placeholder="Tên đăng nhập..." required>
                        </div>
                        <div class="col-sm-6">
                            <select class="custom-select" name="gioitinh">
                                <option value="defalt">Giới tính</option>
                                <option value="c-1">Nam</option>
                                <option value="c-2">Nữ</option>
                                <option value="c-3">Khác</option>
                            </select>
                        </div>
                        <div class="col-sm-6">
                            <input type="text" name="sodienthoai-register" placeholder="Số điện thoại..." required>
                        </div>
                    </div>
                    <input type="text" name="diachi-register" placeholder="Địa chỉ..." required>
                    <input type="text" name="email-register" placeholder="Email..." required>
                    <input type="password" name="password-register" placeholder="Mật khẩu..." required>
                    <input type="password" name="confirm-password-register" placeholder="Xác thực lại mật khẩu..." required>
                    <div class="checkbox">
                        {{-- <label class="mr-10">
                        <small>
                            <input type="checkbox" name="signup">Sign up for our newsletter!
                        </small>
                    </label>
                    <label>
                        <small>
                            <input type="checkbox" name="signup">Receive special offers from our partners!
                        </small>
                    </label> --}}
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <button class="submit-btn-1 mt-20 btn-hover-1" type="submit" value="register">Register</button>
                        </div>
                        <div class="col-md-6">
                            <button class="submit-btn-1 mt-20 btn-hover-1 f-right" type="reset">Clear</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection
