<?php include "business/productB.php" ?>
<?php include "business/inventoryB.php" ?>
<?php include "business/productAnalysisB.php" ?>
<?php
class ProductP
{
  private $from = "2019-08-01";
  private $to = "2019-12-21";

  public function ShowItem()
  {
    // 1. Get product id
    $product_id = $this->GetProduct();
    // 2. Show single product
    $pb = new ProductB();
    $result = $pb->GetProductsByID($product_id);
    $row = mysqli_fetch_array($result);
    $name = $row['product_name'];
    $price = $row['product_price'];
    $image = $row['product_image'];
    $this->ShowSingleProduct($name, $price, $image);

    // 3. Update view
    $pad = new ProductAnalysisB();
    $pad->UpdateViewOfProduct($product_id);
  }

  public function GetProduct()
  {
    if (!isset($_GET['product_id'])) {
      $product_id = 0;
    } else {
      $product_id = $_GET['product_id'];
    }
    return $product_id;
  }

  public function ShowSingleProduct($name, $price1, $image)
  {
    $price = number_format($price1);
    $product = <<<DELIMITER
      <div class="col-sm-12">
      <div class="card">
      <img class="card-img-top" src="{$image}" alt="Card image cap">
      <div class="card-body">
        <h5 class="card-title" style="font-size:22px">{$name}</h5>
        <p class="card-text">{$price} <span style="font-weight:bold; font-size: 17px">₫</span></p>
        <a href="#" class="btn btn-primary">Add to card</a>
      </div>
      </div>
      <br>
      </div>
      DELIMITER;
    echo $product;
  }

  public function ShowProduct($name, $price1, $id, $image)
  {
    $price = number_format($price1);
    $product = <<<DELIMITER
      <div class="col-sm-4">
      <div class="card">
      <a href="item.php?product_id={$id}">
      <img class="card-img-top" src="{$image}" alt="Card image cap">
      </a>
      <div class="card-body">
        <h5 class="card-title" style="font-size:16px">{$name}</h5>
        <p class="card-text">{$price} <span style="font-weight:bold; font-size:17px">₫</span></p>
        <a href="#" class="btn btn-primary">Add to card</a>
      </div>
      </div>
      <br>
      </div>
      DELIMITER;
    echo $product;
  }

  public function ShowFeaturedProduct()
  {
    // 1.Get product list sorted by performance
    $ib = new InventoryB();
    $featuredList = $ib->GetPoorPerformanceList($this->from, $this->to);
    $count = 0;
    foreach ($featuredList as $x => $x_value) {
      if ($count < 6) {
        $pb = new ProductB();
        $result = $pb->GetProductsByID($x);
        $row = mysqli_fetch_array($result);
        $this->ShowProduct($row['product_name'], $row['product_price'], $row['product_id'], $row['product_image']);
      }
      $count++;
    }
  }

  public function ShowProductByUser()
  {
    // $cp = new CategoryP();
    // $cat_id = $cp->GetCategory();
    // if ($cat_id == 0) {
    //   $this->ShowFeaturedProduct();
    // } else {
    //   $this->ShowProductsInCategory($cat_id);
    // }

    $cp = new CategoryP();
    $cat_id = $cp->GetCategory();
    // $product_group = $cp->GetPages();
    if ($cat_id == 0) {
      $this->ShowFeaturedProduct();
    } else {
      $this->ShowProductByGroup();
    }
  }

  public function ShowProductsInCategory($cat_id)
  {
    $pb = new ProductB();
    $result = $pb->GetAllProductFromCategory($cat_id);

    while ($row = mysqli_fetch_array($result)) {
      $this->ShowProduct($row['product_name'], $row['product_price'], $row['product_id'], $row['product_image']);
    }
  }

  public function ShowProductByGroup()
  {
    $cp = new CategoryP();
    $cat_id = $cp->GetCategory();
    $page_id = $cp->GetPages();

    $cb = new CategoryB();
    $result = $cb->GetProductInGroup($cat_id, $page_id);
    while ($row = mysqli_fetch_array($result)) {
      $this->ShowProduct($row['product_name'], $row['product_price'], $row['product_id'], $row['product_image']);
    }
  }

  public function VarForProductName($cat_id, $page_id, $product_name, $count)
  {
    $session_name = $cat_id . "_" . $page_id . "_" . "name" . "_" . $count;
    $_SESSION["$session_name"] = $product_name;
  }
}
?>