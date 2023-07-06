<?php
namespace App;
class RecentProduct{
    public $products = null; // list

    public function __construct($recentProduct){
        if($recentProduct){
            $this->products = $recentProduct->products;
        }
    }
    public function AddRecentProduct($product, $id){
        $newProduct = ['productInfo' => $product];
        if($this->products){
            if(array_key_exists($id, $this->products)){ //nếu đã tồn tài trong giỏ hàng thì
                $newProduct = $this->products[$id];
            }
        }
        $this->products[$id] = $newProduct;
    }
}
?>
