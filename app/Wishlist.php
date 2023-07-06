<?php
namespace App;
class Wishlist{
    public $products = null; // list
    public $totalPrice = 0;
    public $totalQuanity = 0;

    public function __construct($cart){
        if($cart){
            $this->products = $cart->products;
            $this->totalPrice = $cart->totalPrice;
            $this->totalQuanity = $cart->totalQuanity;
        }
    }
    public function AddWishlist($product, $id){
        $newProduct = ['quanity' => 0, 'price' => $product->giaban, 'productInfo' => $product];
        if($this->products){
            if(array_key_exists($id, $this->products)){
                $newProduct = $this->products[$id];
                echo "<script>alertify.success('Sản phẩm đã có trong Wishlist');</script>";
            }
        }
        $newProduct['quanity']++;
        $this->products[$id] = $newProduct;
        $previousQuantity = $this->totalQuanity;
        if($this->totalQuanity != count($this->products)) { //Kiểm tra nếu không bằng tổng số lượng sản phẩm đã có trong giỏ hàng thì set lại số lượng
            $this->totalQuanity = count($this->products);
        }
        if($this->totalQuanity > $previousQuantity) {
            echo "<script>alertify.success('Sản phẩm đã được thêm vào Wishlist');</script>";
        }
    }

    public function DeleteItemInWishlist($id){
        $this->totalQuanity--;
        unset($this->products[$id]);
    }
}
?>
