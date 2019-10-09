<?php include "data/database.php" ?>
<?php
class CategoryB
{
  private $cat_list = null;
  public function GetAllCategories()
  {
    if ($this->cat_list == null) {
      $sql = "SELECT * FROM Category";
      $db = new Database();
      $this->cat_list = $db->select($sql);
    }
    return $this->cat_list;
  }
}
?>