<?php include "data/database.php" ?>
<?php
class CategoryB
{
  private $cat_list = null;
  private $MAX_PRODUCT = 3;

  public function GetAllCategories()
  {
    if ($this->cat_list == null) {
      $sql = "SELECT * FROM Category";
      $db = new Database();
      $this->cat_list = $db->select($sql);
    }
    return $this->cat_list;
  }

  public function GetAmountOfProductInCategory($cat_id)
  {
    $sql = "SELECT COUNT(*) as NUM FROM Product WHERE cat_id={$cat_id}";
    $db = new Database();
    $result = $db->select($sql);
    $row = mysqli_fetch_array($result);
    $num = $row['NUM'];
    return $num;
  }

  public function CalculateNumberOfLinks($cat_id)
  {
    $num = $this->GetAmountOfProductInCategory($cat_id);
    $max = $this->MAX_PRODUCT;
    $result = (float) $num / $max;
    $result = ceil($result);
    return $result;
  }

  public function GetProductInGroup($cat_id, $link_num)
  {
    $offset = ($link_num - 1) * $this->MAX_PRODUCT;
    $sql = "SELECT * FROM Product WHERE cat_id={$cat_id} LIMIT {$offset},{$this->MAX_PRODUCT}";
    $db = new Database();
    $result = $db->select($sql);
    return $result;
  }
}
?>