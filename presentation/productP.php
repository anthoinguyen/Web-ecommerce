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
    $new_price = $row['new_price'];
    $this->ShowSingleProduct($name, $price, $image, $new_price);

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

  public function ShowSingleProduct($name, $price1, $image, $new_price1)
  {
    $price = number_format($price1);
    if ($new_price1 != null) {
      $new_price = number_format($new_price1);
      $product = <<<DELIMITER
      <div class="col-sm-12">
      <div class="card">
      <div class="row">
      <div class="col-sm-6">
      <img class="card-img-top" style="height:400px; width:350px; margin:10px; display:inline-block" src="{$image}" alt="Card image cap">
      </div>
      <div class="col-sm-6">
      <div class="card-body" style="dislay:inline-block">
        <h5 class="card-title" style="font-size:22px">{$name}</h5>
        <p class="card-text" style="text-decoration:line-through; font-size:12px; margin-bottom:5px">{$price} <span style="font-size: 15px">₫</span></p>
        <p class="card-text" style="color:red">{$new_price} <span style="font-weight:bold; font-size: 17px">₫</span></p>
        <a href="#" class="btn btn-primary">Add to card</a>
      </div>
      </div>
      </div>
      </div>
      <br>
      </div>
      DELIMITER;
    } else {
      $product = <<<DELIMITER
      <div class="col-sm-12">
      <div class="card">
      <div class="row">
      <div class="col-sm-6">
      <img class="card-img-top" style="height:400px; width:350px; margin:10px; display:inline-block" src="{$image}" alt="Card image cap">
      </div>
      <div class="col-sm-6">
      <div class="card-body">
        <h5 class="card-title" style="font-size:22px">{$name}</h5>
        <p class="card-text" style="color:red">{$price} <span style="font-weight:bold; font-size: 17px">₫</span></p>
        <a href="#" class="btn btn-primary">Add to card</a>
      </div>
      </div>
      </div>
      </div>
      <br>
      </div>
      DELIMITER;
    }
    echo $product;
  }

  public function ShowProduct($name, $price1, $id, $image, $new_price1)
  {
    $from = "2019-08-01";
    $to = "2019-12-25";
    $pad = new ProductAnalysisB();
    $getview = $pad->GetView($id, $from, $to);
    $view = $getview ? $getview : 0;
    $price = number_format($price1);
    if ($new_price1 != null) {
      $new_price = number_format($new_price1);
      $product = <<<DELIMITER
      <div class="col-sm-4">
      <div class="card">
      <a href="item.php?product_id={$id}">
      <img class="card-img-top" style="margin:5px 0" src="{$image}" alt="Card image cap">
      </a>
      <div class="card-body">
        <h5 class="card-title" style="font-size:16px">{$name}</h5>
        <p class="card-text" style="color:red; display:inline-block; margin-right:10px">{$new_price} <span style="font-size:17px">₫</span></p>
        <p class="card-text" style="text-decoration:line-through; font-size:12px; margin-bottom:5px; display:inline-block">{$price} <span style="font-size: 15px">₫</span></p>
        <a href="#" class="btn btn-primary">Add to card</a>
        <p class="card-text" style="display:inline; margin-left:40px;font-size:12px"> <i class="fas fa-eye" style="margin-right:3px"></i>{$view}</p>
      </div>
      </div>
      <br>
      </div>
      DELIMITER;
    } else {
      $product = <<<DELIMITER
      <div class="col-sm-4">
      <div class="card">
      <a href="item.php?product_id={$id}">
      <img class="card-img-top" style="margin:5px 0" src="{$image}" alt="Card image cap">
      </a>
      <div class="card-body">
        <h5 class="card-title" style="font-size:16px">{$name}</h5>
        <p class="card-text" style="color:red">{$price} <span style="font-size:17px">₫</span></p>
        <a href="#" class="btn btn-primary">Add to card</a>
        <p class="card-text" style="display:inline; margin-left:40px;font-size:12px"> <i class="fas fa-eye" style="margin-right:3px"></i>{$view}</p>
      </div>
      </div>
      <br>
      </div>
      DELIMITER;
    }
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
        $this->ShowProduct($row['product_name'], $row['product_price'], $row['product_id'], $row['product_image'], $row['new_price']);
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
      $this->ShowProduct($row['product_name'], $row['product_price'], $row['product_id'], $row['product_image'], $row['new_price']);
    }
  }

  public function ShowProductByGroup()
  {
    $cp = new CategoryP();
    $cat_id = $cp->GetCategory();
    $page_id = $cp->GetPages();

    $session_name = "category" . $cat_id . "page" . $page_id;

    if (isset($_SESSION["{$session_name}"])) {
      for ($i = 0; $i < 3; $i++) {
        if (isset($_SESSION["{$session_name}"][$i])) {
          $row = $_SESSION["{$session_name}"][$i];
          // echo "have session";
          $this->ShowProduct($row['product_name'], $row['product_price'], $row['product_id'], $row['product_image'], $row['new_price']);
        }
      }
      return;
    }


    $cb = new CategoryB();
    $result = $cb->GetProductInGroup($cat_id, $page_id);
    $count = 0;
    while ($row = mysqli_fetch_array($result)) {
      $_SESSION["{$session_name}"]["{$count}"] = array(
        "product_name" => $row['product_name'],
        "product_price" => $row['product_price'],
        "product_image" => $row['product_image'],
        "product_id" => $row['product_id'],
        "new_price" => $row['new_price']
      );
      // echo "haven't session";
      $this->ShowProduct($row['product_name'], $row['product_price'], $row['product_id'], $row['product_image'], $row['new_price']);
      $count++;
    }
  }
}
?>