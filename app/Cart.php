<?php
namespace App;
class Cart{
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

    public function AddCart($product, $id){
        $newProduct = ['quanity' => 0, 'price' => $product->giaban, 'productInfo' => $product];
        if($this->products){
            if(array_key_exists($id, $this->products)){ //nếu đã tồn tài trong giỏ hàng thì
                $newProduct = $this->products[$id];
            }
        }
        $newProduct['quanity']++;
        $newProduct['price'] = $newProduct['quanity'] * $product->giaban;
        $this->products[$id] = $newProduct;
        $this->totalPrice += $product->giaban;
        $this->totalQuanity++;
    }
    public function DeleteItemInCart($id){
        $this->totalQuanity -= $this->products[$id]['quanity'];
        $this->totalPrice -= $this->products[$id]['price'];
        unset($this->products[$id]);
    }
    public function UpdateItemCart($id, $quanity){
        $this->totalQuanity -= $this->products[$id]['quanity'];
        $this->totalPrice -= $this->products[$id]['price'];

        $this->products[$id]['quanity'] = $quanity;

        $this->products[$id]['price'] = $quanity * $this->products[$id]['productInfo']->giaban;

        $this->totalQuanity += $this->products[$id]['quanity'];
        $this->totalPrice += $this->products[$id]['price'];
    }
    public function AddCartWithQuanity($product, $id, $quanity){
        $newProduct = ['quanity' => 0, 'price' => $product->giaban, 'productInfo' => $product];
        if($this->products){
            if(array_key_exists($id, $this->products)){
                $newProduct = $this->products[$id];
            }
        }
        $newProduct['quanity'] += $quanity;
        $newProduct['price'] = $newProduct['quanity'] * $product->giaban;
        $this->products[$id] = $newProduct;
        $this->totalPrice += $newProduct['price'];
        $this->totalQuanity += $quanity;
    }
    public function getProductQuantity($id){
        if(isset($this->products[$id]['quanity']))
        {
            return $this->products[$id]['quanity'];
        }
        else{
            return 0;
        }
    }
}
?>
