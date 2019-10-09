<?php
  class ProductB{
    public function GetAllProductFromCategory($cat_id){
    $sql = "SELECT * FROM Product WHERE cat_id = {$cat_id}";
      $db = new Database();
      $result = $db->select($sql);
      return $result;
    }

    public function GetProductsByID($product_id){
      $sql = "SELECT * FROM Product WHERE product_id = {$product_id}";
        $db = new Database();
        $result = $db->select($sql);
        return $result;
      }
  }
