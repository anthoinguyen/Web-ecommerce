<?php
class ProductB
{
  private $MAX_PRODUCT = 3;

  public function GetAllProductFromCategory($cat_id)
  {
    $sql = "SELECT * FROM Product WHERE cat_id = {$cat_id}";
    $db = new Database();
    $result = $db->select($sql);
    return $result;
  }

  public function GetProductsByID($product_id)
  {
    $sql = "SELECT * FROM Product WHERE product_id = {$product_id}";
    $db = new Database();
    $result = $db->select($sql);
    return $result;
  }

  public function BuildSearchKey($term)
  {
    // removing symbols used by MySQL
    $reservedSymbols = ['-', '+', '<', '>', '@', '(', ')', '~'];
    $term = str_replace($reservedSymbols, '', $term);
    $words = explode(' ', $term);

    foreach ($words as $key => $word) {
      /*
          * applying + operator (required word) only big words
          * because smaller ones are not indexed by mysql
          */
      if (strlen($word) >= 1) {
        $words[$key] = '*' . $word . '*';
        // $words[$key] = $word;
      }
    }

    $searchTerm = implode(' ', $words);
    return $searchTerm;
  }

  public function GetProductsBySearch($key, $page)
  {
    $offset = ($page - 1) * $this->MAX_PRODUCT;
    $keyClean = $this->BuildSearchKey($key);
    $sql = "SELECT * FROM Product WHERE MATCH(`product_name`) AGAINST('{$keyClean}' IN BOOLEAN MODE) LIMIT {$offset},{$this->MAX_PRODUCT}";
    $db = new Database();
    $result = $db->select($sql);
    return $result;
  }

  public function GetAmountOfProductBySearch($key)
  {
    $keyClean = $this->BuildSearchKey($key);
    $sql = "SELECT COUNT(*) as NUM FROM Product WHERE MATCH(`product_name`) AGAINST('{$keyClean}' IN BOOLEAN MODE)";
    $db = new Database();
    $result = $db->select($sql);
    $row = mysqli_fetch_array($result);
    $num = $row['NUM'];
    return $num;
  }

  public function CalculateNumberOfLinksOfSearch($key)
  {
    $session_name = "searchPages_" . $key;
    if (isset($_SESSION["{$session_name}"])) {
      $result = $_SESSION["{$session_name}"];
      return $result;
    }
    $num = $this->GetAmountOfProductBySearch($key);
    $max = $this->MAX_PRODUCT;
    $result = (float) $num / $max;
    $result = ceil($result);
    $_SESSION["{$session_name}"] = $result;
    return $result;
  }
}
