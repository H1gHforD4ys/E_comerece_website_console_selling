@extends('FrontEnd.shoplistMaster')
@section('tabcontent')
<div class="tab-content">
    <!-- grid-view -->
    <div id="grid-view" class="tab-pane" role="tabpanel">
        <div class="row">
            @foreach($products as $product)
            <!-- product-item start -->
            <div class="col-lg-4 col-md-6">
                <div class="product-item">
                    <div class="product-img">
                        <a href="{{ url('Single-Product', ['id' => $product->id]) }}">
                            <img src=" {{URL::asset('img/product/7.jpg')}} "   alt="" />
                        </a>
                    </div>
                    <div class="product-info">
                        <h6 class="product-title">
                            <a href="single-product.html">{{$product->tensanpham}}</a>
                        </h6>
                        <div class="pro-rating">
                            <a href="#"><i class="zmdi zmdi-star"></i></a>
                            <a href="#"><i class="zmdi zmdi-star"></i></a>
                            <a href="#"><i class="zmdi zmdi-star"></i></a>
                            <a href="#"><i class="zmdi zmdi-star-half"></i></a>
                            <a href="#"><i class="zmdi zmdi-star-outline"></i></a>
                        </div>
                        <h3 class="pro-price">{{number_format($product->giaban)}} VNĐ</h3>
                        <ul class="action-button">
                            <li>
                                <a onclick="AddWishlist({{$product->id}})" href="javascript:"  title="Wishlist"><i
                                        class="zmdi zmdi-favorite"></i></a>
                            </li>
                            <li>
                                <a onclick="Quickview({{$product->id}})" href="javascript:" data-bs-toggle="modal" data-bs-target="#productModal"
                                    title="Quickview"><i class="zmdi zmdi-zoom-in"></i></a>
                            </li>
                            <li>
                                <a href="#" title="Compare"><i
                                        class="zmdi zmdi-refresh"></i></a>
                            </li>
                            <li>
                                <a onclick="AddCart({{$product->id}})" href="javascript:" title="Add to cart"><i
                                    class="zmdi zmdi-shopping-cart-plus"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            @endforeach
            <!-- product-item end -->
        </div>
    </div>
    <!-- list-view -->
    <div id="list-view" class="tab-pane active show" role="tabpanel">
        <div class="row">
            @foreach($products as $product)
            <!-- product-item start -->
            <div class="col-lg-12">
                <div class="shop-list product-item">
                    <div class="product-img">
                        <a href="{{ url('Single-Product', ['id' => $product->id]) }}">
                            <img src="{{$product->anhsanpham}}" style="width: 300px; height: 251px;" alt="" />
                        </a>
                    </div>
                    <div class="product-info">
                        <div class="clearfix">
                            <h6 class="product-title f-left">
                                <a href="{{ url('Single-Product', ['id' => $product->id]) }}">{{$product->tensanpham}}</a>
                            </h6>
                            <div class="pro-rating f-right">
                                <a href="#"><i class="zmdi zmdi-star"></i></a>
                                <a href="#"><i class="zmdi zmdi-star"></i></a>
                                <a href="#"><i class="zmdi zmdi-star"></i></a>
                                <a href="#"><i class="zmdi zmdi-star-half"></i></a>
                                <a href="#"><i class="zmdi zmdi-star-outline"></i></a>
                            </div>
                        </div>
                        <h6 class="brand-name mb-30">Loại: {{$product->tenloaisanpham}}</h6>
                        <h3 class="pro-price">{{number_format($product->giaban)}} VNĐ</h3>
                        {{-- <p>Thông tin sản phẩm viết ở đây : {{$product->thongtinsanpham}} </p> --}}
                        {{-- <p>Ấn vào để xem chi tiết sản phẩm </p> --}}
                        <ul class="action-button">
                            <li>
                                <a onclick="AddWishlist({{$product->id}})" href="javascript:"  title="Wishlist"><i
                                        class="zmdi zmdi-favorite"></i></a>
                            </li>
                            <li>
                                <a onclick="Quickview({{$product->id}})" href="javascript:" data-bs-toggle="modal" data-bs-target="#productModal"
                                    title="Quickview"><i class="zmdi zmdi-zoom-in"></i></a>
                            </li>
                            <li>
                                <a onclick="AddCart({{$product->id}})" href="javascript:" title="Add to cart"><i
                                        class="zmdi zmdi-shopping-cart-plus"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- product-item end -->
            @endforeach
        </div>
    </div>
</div>
<ul class="shop-pagination box-shadow text-center ptblr-10-30">
    <li><a href="{{ $products->previousPageUrl() }}"><i class="zmdi zmdi-chevron-left"></i></a></li>
    @foreach ($products->getUrlRange(1, $products->lastPage()) as $page => $url)
        <li class="{{ $products->currentPage() == $page ? 'active' : '' }}" ><a href="{{ $url }}">{{ $page }}</a></li>
    @endforeach
    <li><a href="#"><i class="zmdi zmdi-chevron-right"></i></a>
    </li>
</ul>
@endsection
