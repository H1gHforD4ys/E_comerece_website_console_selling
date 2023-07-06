<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\WishlistModel;

if (session()->has('idkhachhang')) {
    $id = session()->get('idkhachhang');
    $user = new WishlistModel();
    $Wishlist = $user->wishlist($id);
    $Count = $user->countItem($id);
}
?>
@if (!session()->has('idkhachhang')) <!--Khách hàng vãng lai -->
<a href="{{ Route('formWishlist') }}">
    <i class="zmdi zmdi-favorite"></i>
    @if (Session::has('Wishlist') != null)
        Wishlist ({{Session::get('Wishlist')->totalQuanity}}) 
    @else
        Wishlist (0) 
    @endif
</a>
@else
<a href="{{ Route('formWishlist') }}">
    <i class="zmdi zmdi-favorite"></i>
    Wishlist ({{$Count->count}})
</a>
@endif
