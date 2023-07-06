<ul>
    @foreach ($productsInfo as $item)
        <!-- single-cart -->
        <div class="single-cart1 clearfix">
            <div class="cart-img f-left searching-img">
                <a href="#">
                    <img style="width: 90px; height: 70px;"
                        src="{{ $item->anhsanpham }}"
                        alt="Cart Product" />
                </a>
            </div>
            <div class="cart-info f-left searching-info">
                <h6 class="text-capitalize">
                    <a style="display: inline-block;
                    width: 350px;
                    white-space: nowrap;
                    overflow: hidden;
                    text-overflow: ellipsis;" href="{{ url('Single-Product', ['id' => $item->id]) }}">{{ $item->tensanpham }}</a>

                </h6>
                <div class="type-and-price">
                    <p>
                        <span
                            style='display: inline-block; width: 70px;'>Loại
                            <strong>:</strong></span>{{ $item->ten }}
                    </p>
                    <p>
                        <span
                            style='display: inline-block; width: 70px;'>Giá
                            <strong>:</strong></span>{{ number_format($item->giaban) }}
                        VNĐ
                    </p>
                </div>
            </div>
        </div>
        <!-- end single-cart -->
    @endforeach
</ul>
<style>
    .truncate-text {
        display: inline-block;
        width: 300px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
</style>
