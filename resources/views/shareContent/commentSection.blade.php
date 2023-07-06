@if ($comment != 'Chưa có bình luận nào được viết')
    <!-- nếu chưa có comment được viết -->
    @foreach ($comment as $item)
        <!-- single comments -->
        <div class="media mt-30">
            <div class="media-left">
                <a href="#"><img class="media-object" style="width:33px; height:40px" src="{{URL::asset('img/author/avamacdinh.jpg')}}" alt="#"></a>
            </div>
            <div class="media-body">
                <div class="clearfix">
                    <div class="name-commenter pull-left">
                        <h6 class="media-heading"><a href="#">{{ $item->hovaten }}</a>
                        </h6>
                    </div>
                </div>
                <p class="mb-0">{{ $item->noidung }}</p>
            </div>
        </div>
        <!-- end single comment-->
    @endforeach
@else
    Chưa có bình luận nào được viết
@endif
