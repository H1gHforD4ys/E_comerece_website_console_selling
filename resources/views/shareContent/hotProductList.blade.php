<?php

use App\Models\SanphamModel;

$sanpham = new SanphamModel();
$list = $sanpham->featured();

?>
@foreach($list as $product)
<div class="product-item">
    <div class="product-img">
        <a href="{{ url('Single-Product', ['id' => $product->id]) }}">
            <img src="{{$product->anhsanpham}}" class="new-product" alt="" />
        </a>
    </div>
    <div class="product-info">
        <h6 class="product-title">
            <a href="{{ url('Single-Product', ['id' => $product->id]) }}">Pokemon Chilling Reign</a>
        </h6>
        <div class="pro-rating">
            <a href="#"><i class="zmdi zmdi-star"></i></a>
            <a href="#"><i class="zmdi zmdi-star"></i></a>
            <a href="#"><i class="zmdi zmdi-star"></i></a>
            <a href="#"><i class="zmdi zmdi-star-half"></i></a>
            <a href="#"><i class="zmdi zmdi-star-outline"></i></a>
        </div>
        <h3 class="pro-price">
            <?php
            echo number_format($product->giaban) ;
            ?>
            ₫
        </h3>
        <ul class="action-button">
            <li>
                <a onclick="AddWishlist({{$product->id}})" href="javascript:" title="Wishlist"><i class="zmdi zmdi-favorite"></i></a>
            </li>
            <li>
                <a onclick="Quickview({{$product->id}})" href="javascript:" data-bs-toggle="modal" data-bs-target="#productModal" title="Quickview"><i
                        class="zmdi zmdi-zoom-in"></i></a>
            </li>
            <li>
                <a onclick="AddCart({{$product->id}})" href="javascript:" title="Add to cart"><i class="zmdi zmdi-shopping-cart-plus"></i></a>
            </li>
        </ul>
    </div>
</div>
@endforeach
