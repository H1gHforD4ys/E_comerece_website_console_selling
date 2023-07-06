<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ShopListController;
use App\Http\Controllers\HeaderCartController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\LoginAndRegisterController;
use App\Http\Controllers\WishlistController;
use App\Http\Controllers\QuickviewController;
use App\Http\Controllers\SingleProductController;
use App\Http\Controllers\CheckOutController;
use App\Http\Controllers\HeaderController;

use Illuminate\Support\Facades\Session;



/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/',[HomeController::class,'index'])->name('home');

Route::get('/shoplist/{id?}',[ShopListController::class,'index']);

Route::get('/Add-Cart/{id}',[HeaderCartController::class,'AddCart']);

Route::get('/quickview/{id}',[QuickviewController::class,'index']);

Route::get('/Single-Product/{id?}',[SingleProductController::class,'index']);

Route::get('Add-Cart-Single-Product/{id}/{quanity}',[SingleProductController::class,'AddCart']);

Route::get('/Delete-Item-Cart/{id}',[HeaderCartController::class,'DeleteItemCart']);

Route::get('/Cart',[CartController::class,'index']);

Route::get('/Delete-Item-List-Cart/{id}',[CartController::class,'DeleteItemCart']);

Route::get('/Save-Item-List-Cart/{id}/{quanity}',[CartController::class,'SaveItemCart']);

//Route::get('/Save-All-Item-List-Cart',[CartController::class,'SaveAllItemCart']);

Route::get('/Wishlist',[WishlistController::class,'index'])->name('formWishlist');

Route::get('/Add-Wishlist/{id}',[WishlistController::class,'addWishlist']);

Route::get('/Delete-Item-Wishlist/{id}',[WishlistController::class,'DeleteItemWishlist']);

Route::get('/Checkout',[CartController::class,'ShowFormCheckout'])->name('checkout');

//Đăng nhập
Route::get('/LoginOrRegister',[LoginAndRegisterController::class,'index']);

Route::post('/register',[LoginAndRegisterController::class,'register'])->name('register');

Route::post('/login',[LoginAndRegisterController::class,'login'])->name('login');

Route::get('/logout', [LoginAndRegisterController::class,'logout'])->name('logout');

Route::get('/account',[HeaderController::class,'accountView'])->name('view-account');

Route::post('/update-account-info',[HeaderController::class,'updateAcc'])->name('update-account-info');

//Route::get('/profile', [LoginAndRegisterController::class,'profile'])->name('profile.form');
//Route::post('/profile', [LoginAndRegisterController::class,'profileUpdate'])->name('profile.update');

Route::get('/save-header-cart-item',[HeaderCartController::class,'index']); //Mãi mới nghĩ ra :<<<<<

Route::get('/save-header-wishlist-item',[WishlistController::class,'updateHeader']);

//Thanh toán
Route::post('/vnpay_payment',[CheckOutController::class,'vnpay_payment'])->name('vnpay-payment');

Route::get('/order',[CheckOutController::class,'index'])->name('order');

Route::get('/payment-check',[CheckOutController::class,'paymentCheck'])->name('payment-check');

Route::post('/shipping-payment',[CheckOutController::class,'shipping_payment'])->name('shipping-payment');

Route::get('/choose-payment-method/{type}',[CheckOutController::class,'choose_payment_method']);

Route::get('/form-checkout/{type}',[CheckOutController::class,'form_checkout_change']);

Route::get('/shipping-pay-check/{idpayment}',[CheckOutController::class,'shipping_pay_check']);

//
Route::get('/check-product-quantity/{id}',[HeaderCartController::class,'checkProductQuantity']);

Route::get('/searching',[HeaderCartController::class,'search']);
//Bình luận
Route::get('/comment/{idkhachhang}/{idsanpham}/{comment}',[SingleProductController::class,'comment']);
