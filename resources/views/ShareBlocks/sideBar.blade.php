<aside class="widget widget-categories box-shadow mb-30">
    <h6 class="widget-title border-left mb-20">Danh mục</h6>
    <div id="cat-treeview" class="product-cat">
        <ul>
            <li class="open"><a href="{{ url('/shoplist/4') }}">Nintendo Switch</a>
                <ul>
                    <li><a href="{{ url('/shoplist/4') }}">Máy Nintendo switch</a></li>
                    <li><a href="{{ url('/shoplist/7') }}">Game Switch cũ</a></li>
                    <li><a href="{{ url('/shoplist/9') }}">Phụ kiện Nintendo Switch</a></li>
                    <li><a href="{{ url('/shoplist/16') }}">Tay cầm nintendo switch</a></li>
                </ul>
            </li>
            <li class="closed"><a href="{{ url('/shoplist/41') }}">Playstation</a>
                <ul>
                    <li><a href="{{ url('/shoplist/42') }}">Máy Game PS5</a></li>
                    <li><a href="{{ url('/shoplist/43') }}">Máy Game PS4</a></li>
                    <li><a href="{{ url('/shoplist/39') }}">Đĩa Game PS</a></li>
                    <li><a href="{{ url('/shoplist/44') }}">Phụ kiện PS4 & PS5</a></li>
                </ul>
            </li>
            <li class="closed"><a href="{{ url('/shoplist/4') }}">Gundam</a>
                <ul>
                    <li><a href="{{ url('/shoplist/4') }}">Gundam SD</a></li>
                    <li><a href="{{ url('/shoplist/4') }}">Gundam HG</a></li>
                    <li><a href="{{ url('/shoplist/4') }}">Gundam RG</a></li>
                    <li><a href="{{ url('/shoplist/4') }}">Gundam MG</a></li>
                    <li><a href="{{ url('/shoplist/4') }}">Gundam PG</a></li>
                </ul>
            </li>
            <li class="closed"><a href="{{ url('/shoplist/4') }}">Figure</a>
                <ul>
                    <li><a href="{{ url('/shoplist/4') }}">GoodSmile Company</a></li>
                    <li><a href="{{ url('/shoplist/4') }}">Mô hình Figure Banpresto</a></li>
                    <li><a href="{{ url('/shoplist/4') }}">Mô hình KyouKai Senki</a></li>
                    <li><a href="{{ url('/shoplist/4') }}">Mô hình Kamen Rider</a></li>
                    <li><a href="{{ url('/shoplist/4') }}">Figure các hãng khác</a></li>
                </ul>
            </li>

        </ul>
    </div>
</aside>
<!-- shop-filter -->
{{-- <aside class="widget shop-filter box-shadow mb-30">
    <h6 class="widget-title border-left mb-20">Price</h6>
    <div class="price_filter">
        <div class="price_slider_amount">
            <input type="submit" value="You range :" />
            <input type="text" id="amount" name="price"
                placeholder="Add Your Price" />
        </div>
        <div id="slider-range"></div>
    </div>
</aside> --}}
<!-- widget-color -->
{{-- <aside class="widget widget-color box-shadow mb-30">
    <h6 class="widget-title border-left mb-20">color</h6>
    <ul>
        <li class="color-1"><a href="#">LightSalmon</a></li>
        <li class="color-2"><a href="#">Dark Salmon</a></li>
        <li class="color-3"><a href="#">Tomato</a></li>
        <li class="color-4"><a href="#">Deep Sky Blue</a></li>
        <li class="color-5"><a href="#">Electric Purple</a></li>
        <li class="color-6"><a href="#">Atlantis</a></li>
    </ul>
</aside> --}}
<!-- operating-system -->
{{-- <aside class="widget operating-system box-shadow mb-30">
    <h6 class="widget-title border-left mb-20">operating system</h6>
    <form action="https://htmldemo.net/subas/subas/action_page.php">
        <label><input type="checkbox" name="operating-1" value="phone-1">Windows
            Phone</label><br>
        <label><input type="checkbox" name="operating-1" value="phone-1">Bleckgerry
            ios</label><br>
        <label><input type="checkbox" name="operating-1"
                value="phone-1">Android</label><br>
        <label><input type="checkbox" name="operating-1" value="phone-1">ios</label><br>
        <label><input type="checkbox" name="operating-1" value="phone-1">Windows
            Phone</label><br>
        <label><input type="checkbox" name="operating-1"
                value="phone-1">Symban</label><br>
        <label class="mb-0"><input type="checkbox" name="operating-1"
                value="phone-1">Bleckgerry
            os</label><br>
    </form>
</aside> --}}
<!-- widget-product -->
<aside class="widget widget-product box-shadow">
    <h6 class="widget-title border-left mb-20">Xem gần đây</h6>
    @if (session()->has('recent-item'))
        @foreach (array_slice(session()->get('recent-item')->products, -3) as $item)
            <!-- product-item start -->
            <div class="product-item">
                <div class="product-img">
                    <a href="single-product.html">
                        <img src="{{ $item['productInfo']->anhsanpham }}" style="width:45px; height:50px;"
                            alt="" />
                    </a>
                </div>
                <div class="product-info">
                    <h6 class="product-title">
                        <a class="highlight"
                            href="{{ url('Single-Product', ['id' => $item['productInfo']->id]) }}">{{ $item['productInfo']->tensanpham }}</a>
                    </h6>
                    <h3 class="pro-price">{{ number_format($item['productInfo']->giaban) }} đ</h3>
                </div>
            </div>
            <!-- product-item end -->
        @endforeach
    @endif
</aside>

