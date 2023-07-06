@extends('FrontEnd.singleProductMaster')

@section('content')
    <div class="single-product-area mb-80">
        <div class="row">
            <!-- imgs-zoom-area start -->
            <div class="col-lg-5">
                <div class="imgs-zoom-area">
                    <img id="zoom_03" src="{{ $productInfo->anhsanpham }}" data-zoom-image="img/product/6.jpg" alt="">
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="gallery_01" class="carousel-btn slick-arrow-3 mt-30">
                                <div class="p-c">
                                    <a href="#" data-image="img/product/2.jpg" data-zoom-image="img/product/2.jpg">
                                        <img class="zoom_03" src="img/product/2.jpg" alt="">
                                    </a>
                                </div>
                                <div class="p-c">
                                    <a href="#" data-image="img/product/3.jpg" data-zoom-image="img/product/3.jpg">
                                        <img class="zoom_03" src="img/product/3.jpg" alt="">
                                    </a>
                                </div>
                                <div class="p-c">
                                    <a href="#" data-image="img/product/4.jpg" data-zoom-image="img/product/4.jpg">
                                        <img class="zoom_03" src="img/product/4.jpg" alt="">
                                    </a>
                                </div>
                                <div class="p-c">
                                    <a href="#" data-image="img/product/5.jpg" data-zoom-image="img/product/5.jpg">
                                        <img class="zoom_03" src="img/product/5.jpg" alt="">
                                    </a>
                                </div>
                                <div class="p-c">
                                    <a href="#" data-image="img/product/6.jpg" data-zoom-image="img/product/6.jpg">
                                        <img class="zoom_03" src="img/product/6.jpg" alt="">
                                    </a>
                                </div>
                                <div class="p-c">
                                    <a href="#" data-image="img/product/7.jpg" data-zoom-image="img/product/7.jpg">
                                        <img class="zoom_03" src="img/product/7.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- imgs-zoom-area end -->
            <!-- single-product-info start -->
            <div class="col-lg-7">
                <div class="single-product-info">
                    <h3 class="text-black-1">{{ $productInfo->tensanpham }}</h3>
                    <h6 class="brand-name-2">{{ $productType }}</h6>
                    <!--  hr -->
                    <hr>
                    <!-- single-pro-color-rating -->
                    <div class="single-pro-color-rating clearfix">
                        <div class="sin-pro-color f-left">
                            <p class="color-title f-left">Color</p>
                            <div class="widget-color f-left">
                                <ul>
                                    <li class="color-1"><a href="#"></a></li>
                                    <li class="color-2"><a href="#"></a></li>
                                    <li class="color-3"><a href="#"></a></li>
                                    <li class="color-4"><a href="#"></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="pro-rating sin-pro-rating f-right">
                            <a href="#" tabindex="0"><i class="zmdi zmdi-star"></i></a>
                            <a href="#" tabindex="0"><i class="zmdi zmdi-star"></i></a>
                            <a href="#" tabindex="0"><i class="zmdi zmdi-star"></i></a>
                            <a href="#" tabindex="0"><i class="zmdi zmdi-star-half"></i></a>
                            <a href="#" tabindex="0"><i class="zmdi zmdi-star-outline"></i></a>
                            <span class="text-black-5">( 27 Rating )</span>
                        </div>
                    </div>
                    <!-- hr -->
                    <hr>
                    <!-- plus-minus-pro-action -->
                    <div class="plus-minus-pro-action clearfix">
                        <div class="sin-plus-minus f-left clearfix">
                            <p class="color-title f-left">Qty</p>
                            <div class="cart-plus-minus f-left">
                                <input data-id="{{ $productInfo->id }}" type="text" id="quanity-item-single-product"
                                    value="1" name="qtybutton" class="cart-plus-minus-box">
                            </div>
                        </div>
                        <div class="sin-pro-action f-right">
                            <ul class="action-button">
                                <li>
                                    <a onclick="AddWishlist({{ $productInfo->id }})" href="javascript:" title="Wishlist"
                                        tabindex="0"><i class="zmdi zmdi-favorite"></i></a>
                                </li>
                                <li>
                                    <a onclick="Quickview({{ $productInfo->id }})" href="javascript:"
                                        data-bs-toggle="modal" data-bs-target="#productModal" title="Quickview"
                                        tabindex="0"><i class="zmdi zmdi-zoom-in"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- plus-minus-pro-action end -->
                    <!-- hr -->
                    <hr>
                    <!-- single-product-price -->
                    <h3 class="pro-price">{{ number_format($productInfo->giaban) }} ₫</h3>
                    <!--  hr -->
                    <hr>
                    <div>
                        <a onclick="AddCartWithQuanity({{ $productInfo->id }})" href="javascript:"
                            class="button extra-small button-black" tabindex="-1">
                            <span class="text-uppercase">Thêm vào giỏ hàng</span>
                        </a>
                    </div>
                </div>
            </div>
            <!-- single-product-info end -->
        </div>
        <!-- single-product-tab -->
        <div class="row">
            <div class="col-lg-12">
                <!-- hr -->
                <hr>
                <div class="single-product-tab reviews-tab">
                    <ul class="nav mb-20">
                        <li><a class="active" href="#information" data-bs-toggle="tab">Thông tin sản phẩm</a></li>
                        <li><a href="#reviews" data-bs-toggle="tab">Bình luận</a></li>
                    </ul>
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active show" id="information">
                            <p>{{ $productInfo->thongtinsanpham }}</p>

                        </div>
                        <div role="tabpanel" class="tab-pane" id="reviews">
                            <!-- reviews-tab-desc -->
                            <div class="reviews-tab-desc">
                                <div id="comment-page">
                                    @if($comment != "Chưa có bình luận nào được viết") <!-- nếu chưa có comment được viết -->
                                    @foreach($comment as $item)
                                    <!-- single comments -->
                                    <div class="media mt-30">
                                        <div class="media-left">
                                            <a href="#"><img class="media-object" style="width:33px; height:40px" src="{{URL::asset('img/author/avamacdinh.jpg')}}"
                                                    alt="#"></a>
                                        </div>
                                        <div class="media-body">
                                            <div class="clearfix">
                                                <div class="name-commenter pull-left">
                                                    <h6 class="media-heading"><a href="#">{{$item->hovaten}}</a>
                                                    </h6>
                                                </div>
                                            </div>
                                            <p class="mb-0">{{$item->noidung}}</p>
                                        </div>
                                    </div>
                                    <!-- end single comment-->
                                    @endforeach
                                    @else
                                    Chưa có bình luận nào được viết
                                    @endif
                                </div>
                                @if(session()->has('idkhachhang'))
                                <form>
                                    <br>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <br>
                                            <input style="width: 500px;" type="text" id="comment-text" name="comment" placeholder="Viết bình luận của bạn về sản phẩm này..." required>
                                        </div>
                                        <div class="col-md-6">
                                            <a  onclick="comment(<?php echo session()->get('idkhachhang') ?>,{{$productInfo->id }})"><button  class="submit-btn-1 mt-20 btn-hover-1 f-right" type="reset">Bình luận</button></a>
                                        </div>
                                    </div>
                                </form>
                                @else
                                <br>
                                Vui lòng đăng nhập để dùng được tính năng Bình luận
                                @endif
                            </div>
                        </div>

                    </div>
                </div>
                <!--  hr -->
                <hr>
            </div>
        </div>
    </div>
@endsection

@section('related-product')
    <div class="related-product-area">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title text-start mb-40">
                    <h2 class="uppercase">Sản phẩm liên quan</h2>
                    <h6>There are many variations of passages of brands available,</h6>
                </div>
                <div class="active-related-product">
                    @foreach($relatedProduct as $item)
                    <!-- single item -->
                    <div class="product-item">
                        <div class="product-img">
                            <a href="{{ url('Single-Product', ['id' => $item->id]) }}">
                                <img style="width:270px; height:300px" src="{{$item->anhsanpham}}" alt="" />
                            </a>
                        </div>
                        <div class="product-info">
                            <h6 class="product-title">
                                <a href="{{ url('Single-Product', ['id' => $item->id]) }}">{{$item->tensanpham}}</a>
                            </h6>
                            <div class="pro-rating">
                                <a href="#"><i class="zmdi zmdi-star"></i></a>
                                <a href="#"><i class="zmdi zmdi-star"></i></a>
                                <a href="#"><i class="zmdi zmdi-star"></i></a>
                                <a href="#"><i class="zmdi zmdi-star-half"></i></a>
                                <a href="#"><i class="zmdi zmdi-star-outline"></i></a>
                            </div>
                            <h3 class="pro-price">{{number_format($item->giaban)}} đ</h3>
                            <ul class="action-button">
                                <li>
                                    <a onclick="AddWishlist({{$item->id}})" href="javascript:"  title="Wishlist"><i
                                            class="zmdi zmdi-favorite"></i></a>
                                </li>
                                <li>
                                    <a onclick="Quickview({{$item->id}})" href="javascript:" data-bs-toggle="modal" data-bs-target="#productModal"
                                        title="Quickview"><i class="zmdi zmdi-zoom-in"></i></a>
                                </li>
                                <li>
                                    <a onclick="AddCart({{$item->id}})" href="javascript:" title="Add to cart"><i
                                            class="zmdi zmdi-shopping-cart-plus"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!--end single item -->
                    @endforeach
                </div>
            </div>
        </div>
    </div>
@endsection
