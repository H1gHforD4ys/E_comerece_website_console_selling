<div class="modal-product clearfix">
    <div class="product-images">
        <div class="main-image images">
            @if (session()->has('productQuickview'))
                <img alt="" style="width: 365 px,height: 485 px" src="{{session()->get('productQuickview.image')}}">
            @else
                <img alt="" src="img/product/quickview.jpg">
            @endif
        </div>
    </div><!-- .product-images -->
    <div class="product-info">
        @if (session()->has('productQuickview'))
            <h1><?php echo session()->get('productQuickview.name'); ?> </h1>
        @else
            <h1>Không thấy sản phẩm</h1>
        @endif
        <div class="price-box-3">
            <div class="s-price-box">
                <span class="new-price">
                    @if (session()->has('productQuickview'))
                        <h1><?php echo number_format(session()->get('productQuickview.price')); ?> ₫</h1>
                    @else
                        <h1>0</h1>
                    @endif
                </span>
                <span class="old-price">
                    @if (session()->has('productQuickview'))
                        <h1><?php echo number_format(session()->get('productQuickview.price') + 50000); ?> ₫</h1>
                    @else
                        <h1>0</h1>
                    @endif
                </span>
            </div>
        </div>
        <a href="{{ url('Single-Product', ['id' => session()->get('productQuickview.id')]) }}" class="see-all">See all features</a>
        <div class="quick-add-to-cart">
            <form method="post" class="cart">
                <div class="numbers-row">
                    <input type="number" name="quick-view-quantity" id="french-hens" value="1" min="1">
                </div>
                <a onclick="addCartFromQuickView(<?php echo session()->get('productQuickview.id'); ?>)">
                <button class="single_add_to_cart_button" data-bs-dismiss="modal" type="button">Add to cart</button>
                </a>
            </form>
        </div>
        <div class="quick-desc">
            <?php echo session()->get('productQuickview.thongtinsanpham'); ?>.
        </div>
        <div class="social-sharing">
            <div class="widget widget_socialsharing_widget">
                <h3 class="widget-title-modal">Share this product</h3>
                <ul class="social-icons clearfix">
                    <li>
                        <a class="facebook" href="#" target="_blank" title="Facebook">
                            <i class="zmdi zmdi-facebook"></i>
                        </a>
                    </li>
                    <li>
                        <a class="google-plus" href="#" target="_blank" title="Google +">
                            <i class="zmdi zmdi-google-plus"></i>
                        </a>
                    </li>
                    <li>
                        <a class="twitter" href="#" target="_blank" title="Twitter">
                            <i class="zmdi zmdi-twitter"></i>
                        </a>
                    </li>
                    <li>
                        <a class="pinterest" href="#" target="_blank" title="Pinterest">
                            <i class="zmdi zmdi-pinterest"></i>
                        </a>
                    </li>
                    <li>
                        <a class="rss" href="#" target="_blank" title="RSS">
                            <i class="zmdi zmdi-rss"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div><!-- .product-info -->
</div><!-- .modal-product -->
