@extends('FrontEnd.cartMaster')

@section('content')
<div class="shop-section mb-80">
    <div class="container">
        <div class="row">
            <div class="col-lg-2">
                <ul class="nav cart-tab">
                    <li>
                        <a class="active" data-bs-toggle="tab">
                            <span>01</span>
                            Shopping cart
                        </a>
                    </li>
                    <li>
                        <a>
                            <span>02</span>
                            Wishlist
                        </a>
                    </li>
                    <li>
                        <a >
                            <span>03</span>
                            Checkout
                        </a>
                    </li>
                    <li>
                        <a  >
                            <span>04</span>
                            Order complete
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-lg-10">
                <!-- Tab panes -->
                <div class="tab-content">
                    <!-- shopping-cart start -->
                    <div class="tab-pane active" id="shopping-cart">
                        @include('shareContent.listCart') <!-- Show giỏ hàng -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection