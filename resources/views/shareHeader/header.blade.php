<?php
use Symfony\Component\HttpFoundation\Session\Session;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
if (session()->has('idkhachhang')) {
    $id = session()->get('idkhachhang');
    $khachhang = DB::table('khachhang')
        ->where('id', '=', $id)
        ->first();
}
?>
<header class="header-area header-wrapper">
    <!-- header-top-bar -->
    <div class="header-top-bar plr-185">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-6 d-none d-md-block">
                    <div class="call-us">
                        <p class="mb-0 roboto">0123456789</p>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="top-link clearfix">
                        <ul class="link f-right">
                            <li>
                                @if (session()->has('idkhachhang'))
                                    <a href="{{route('view-account')}}">
                                        <i class="zmdi zmdi-account"></i>
                                        <?php echo $khachhang->hovaten  ?>
                                    </a>
                                @else
                                    <a onclick="LoginRequest()" href="javascript:">
                                        <i class="zmdi zmdi-account"></i>
                                        My Account
                                    </a>
                                @endif
                            </li>
                            <li>
                                <div id="change-wishlist-count">
                                    @include('shareHeader.headerWishlist')
                                    <div>
                            </li>
                            <li>
                                @if (session()->has('idkhachhang'))
                                    <a href="{{ route('logout') }}">
                                        <i class="zmdi zmdi-lock"></i>
                                        Logout
                                    </a>
                                @else
                                    <a href="{{ url('/LoginOrRegister') }}">
                                        <i class="zmdi zmdi-lock"></i>
                                        Login
                                    </a>
                                @endif
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- header-middle-area -->
    <div id="sticky-header" class="header-middle-area plr-185">
        <div class="container-fluid">
            <div class="full-width-mega-dropdown">
                <div class="row">
                    <!-- logo -->
                    <div class="col-lg-2 col-md-4">
                        <div class="logo">
                            <a href="{{route('home')}}">
                                <img src="{{ URL::asset('img/logo/logo.png') }}" alt="main logo">
                            </a>
                        </div>
                    </div>
                    <!-- primary-menu -->
                    <div class="col-lg-8 d-none d-lg-block">
                        <nav id="primary-menu">
                            <ul class="main-menu text-center">
                                <li><a href="{{ url('/') }}">Home</a></li>

                                <li><a href="{{ url('/shoplist/4') }}">Nintendo Switch</a>

                                    <ul class="dropdwn">
                                        <li>
                                            <a href="{{ url('/shoplist/4') }}">Máy Nintendo Switch</a>
                                        </li>
                                        <li>
                                            <a href="{{ url('/shoplist/5') }}">Game Nintendo Switch</a>
                                        </li>
                                        <li>
                                            <a href="{{ url('/shoplist/7') }}">Game Switch cũ</a>
                                        </li>
                                        <li><a href="{{ url('/shoplist/9') }}">Phụ kiện Nintendo Switch</a>
                                            <ul class="dropdwn-repeat">
                                                <li>
                                                    <a href="{{ url('/shoplist/16') }}">Tay cầm
                                                        nintendo switch</a>
                                                </li>
                                                <li>
                                                    <a href="{{ url('/shoplist/17') }}">Phụ kiện cho tay cầm & Joycon</a>
                                                </li>
                                                <li>
                                                    <a href="{{ url('/shoplist/25') }}">Miếng dán bảo vệ màn hình Switch</a>
                                                </li>
                                                <li>
                                                    <a href="{{ url('/shoplist/18') }}">Ốp lưng & Túi đựng máy Switch</a>
                                                </li>
                                                <li>
                                                    <a href="{{ url('/shoplist/19') }}">Hộp đựng băng game & để dựng</a>
                                                </li>
                                                <li>
                                                    <a href="{{ url('/shoplist/20') }}">Adapter - Cáp sạc</a>
                                                </li>
                                                <li>
                                                    <a href="{{ url('/shoplist/21   ') }}">Thẻ nhớ cho Nintendo Switch</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a href="{{ url('/shoplist/22') }}">Phụ kiện Nintendo Switch OLED</a>
                                            <ul class="dropdwn-repeat">
                                                <li>
                                                    <a href="{{ url('/shoplist/23') }}">Tay cầm nintendo switch OLED</a>
                                                </li>
                                                <li>
                                                    <a href="{{ url('/shoplist/24') }}">Phụ kiện cho tay cầm & Joycon OLED</a>
                                                </li>
                                                <li>
                                                    <a href="{{ url('/shoplist/25') }}">Miếng dán bảo vệ màn hình Switch OLED</a>
                                                </li>
                                                <li>
                                                    <a href="{{ url('/shoplist/26') }}">Ốp lưng & Túi đựng máy Switch OLED</a>
                                                </li>
                                                <li>
                                                    <a href="{{ url('/shoplist/27') }}">Hộp đựng băng game & để dựng</a>
                                                </li>
                                                <li>
                                                    <a href="{{ url('/shoplist/28') }}">Adapter - Cáp sạc</a>
                                                </li>
                                                <li>
                                                    <a href="{{ url('/shoplist/29') }}">Thẻ nhớ cho Nintendo Switch OLED</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li><a href="{{ url('/shoplist/30') }}">Phụ kiện Nintendo Switch LITE</a>
                                            <ul class="dropdwn-repeat">
                                                <li>
                                                    <a href="{{ url('/shoplist/31') }}">Tay cầm nintendo switch LITE</a>
                                                </li>
                                                <li>
                                                    <a href="{{ url('/shoplist/33') }}">Miếng dán bảo vệ màn hình Switch LITE</a>
                                                </li>
                                                <li>
                                                    <a href="{{ url('/shoplist/34') }}">Ốp lưng & Túi đựng máy Switch LITE</a>
                                                </li>
                                                <li>
                                                    <a href="{{ url('/shoplist/35') }}">Hộp đựng băng game & để dựng LITE</a>
                                                </li>
                                                <li>
                                                    <a href="{{ url('/shoplist/36') }}">Adapter - Cáp sạc</a>
                                                </li>
                                                <li>
                                                    <a href="{{ url('/shoplist/37') }}">Thẻ nhớ cho Nintendo Switch LITE</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="{{ url('/shoplist/38') }}">Amiibo</a>
                                        </li>
                                    </ul>
                                </li>

                                <li><a href="{{ url('/shoplist/41') }}">Playstation</a>
                                    <ul class="dropdwn">
                                        <li>
                                            <a href="{{ url('/shoplist/42') }}">Máy Game PS5</a>
                                        </li>
                                        <li>
                                            <a href="{{ url('/shoplist/43') }}">Máy Game PS4</a>
                                        </li>
                                        <li>
                                            <a href="{{ url('/shoplist/39') }}">Đĩa Game PS</a>
                                        </li>
                                        <li>
                                            <a href="{{ url('/shoplist/44') }}">Phụ kiện PS4 & PS5 </a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="{{ url('/shoplist/4') }}">Gundam</a>
                                    <ul class="dropdwn">
                                        <li>
                                            <a href="{{ url('/shoplist/4') }}">Gundam SD</a>
                                        </li>
                                        <li>
                                            <a href="{{ url('/shoplist/4') }}">Gundam HG</a>
                                        </li>
                                        <li>
                                            <a href="{{ url('/shoplist/4') }}">Gundam RG</a>
                                        </li>
                                        <li>
                                            <a href="{{ url('/shoplist/4') }}">Gundam MG</a>
                                        </li>
                                        <li>
                                            <a href="{{ url('/shoplist/4') }}">Gundam PG</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="{{ url('/shoplist/4') }}">Figure</a>
                                    <ul class="dropdwn">
                                        <li>
                                            <a href="{{ url('/shoplist/4') }}">GoodSmile Company</a>
                                        </li>
                                        <li>
                                            <a href="{{ url('/shoplist/4') }}">Figure Bandai</a>
                                            <ul class="dropdwn-repeat">
                                                <li>
                                                    <a href="{{ url('/shoplist/4') }}">Mô hình Figure Banpresto</a>
                                                </li>
                                                <li>
                                                    <a href="{{ url('/shoplist/4') }}">Mô hình KyouKai Senki</a>
                                                </li>
                                                <li>
                                                    <a href="{{ url('/shoplist/4') }}">Mô hình Kamen Rider</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="{{ url('/shoplist/4') }}">Figure Rement</a>
                                        </li>
                                        <li>
                                            <a href="{{ url('/shoplist/4') }}">Figure các hãng khác</a>
                                        </li>
                                        <li>
                                            <a href="{{ url('/shoplist/4') }}">Tamiya Model Kit</a>
                                        </li>
                                        <li>
                                            <a href="{{ url('/shoplist/4') }}"> XeTamiya Mini 4WD</a>
                                        </li>
                                        <li>
                                            <a href="{{ url('/shoplist/4') }}">Dụng cụ sơn mô hình</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="shop-list.php{{ url('/shoplist/4') }}">Bảng tin</a></li>
                            </ul>
                        </nav>
                    </div>
                    <!-- header-search & total-cart -->
                    <div class="col-lg-2 col-md-8">
                        <div class="search-top-cart  f-right">
                            <!-- header-search -->
                            <div class="header-search f-left">
                                <div class="header-search-inner">
                                    <button class="search-toggle">
                                        <i class="zmdi zmdi-search"></i>
                                    </button>
                                    <form action="#">
                                        <div class="top-search-box">
                                            <input type="text" id="search" autocomplete="off"
                                                placeholder="Search here your product...">
                                            <button type="submit">
                                                <i class="zmdi zmdi-search"></i>
                                            </button>
                                            <div class="search-ajax-result" id="search-ajax-result">
                                                {{-- <ul>
                                                    <!-- single-cart -->
                                                    <div class="single-cart1 clearfix">
                                                        <div class="cart-img f-left searching-img">
                                                            <a href="#">
                                                                <img style="width: 90px; height: 70px;"
                                                                    src="{{ URL::asset('img/cart/1.jpg') }}"
                                                                    alt="Cart Product" />
                                                            </a>
                                                        </div>
                                                        <div class="cart-info f-left searching-info">
                                                            <h6 class="text-capitalize">
                                                                <a href="" class="truncate-text">nintendo
                                                                    switch siêu cấp vip pro</a>
                                                            </h6>
                                                            <div class="type-and-price">
                                                                <p>
                                                                    <span
                                                                        style='display: inline-block; width: 70px;'>Loại
                                                                        <strong>:</strong></span>Máy chơi game
                                                                </p>
                                                                <p>
                                                                    <span
                                                                        style='display: inline-block; width: 70px;'>Giá
                                                                        <strong>:</strong></span>1.000.000
                                                                    VNĐ
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- end single-cart -->
                                                </ul> --}}
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <!-- total-cart -->
                            <div id="change-item-cart" class="total-cart f-left">
                                @include('shareHeader.headerCart')
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style>
        .search-ajax-result {
            /* margin-top: 60px; */
            /* border: 1px solid black; */

            width: 500px;
            height: 80px;
            display: grid;
            display: flex;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            grid-gap: 10px;
        }
        .type-and-price{
            margin-top: 10px;
        }
        .single-cart1 {
            flex: 1;
            background-color: white;
            width: 500px;
            height: 80px;
            /* box-shadow: 10px 10px 5px 12px lightblue; */
        }

        .truncate-text {
            display: inline-block;
            width: 150px;
            white-space: nowrap;
            /* overflow: hidden; */
            text-overflow: ellipsis;
        }
    </style>
</header>
