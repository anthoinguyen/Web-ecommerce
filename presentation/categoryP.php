<?php include "business/categoryB.php" ?>
<?php
class CategoryP
{
  public function ShowAllCategories()
  {
    $cb = new categoryB();
    $result = $cb->GetAllCategories();
    $count = 1;
    while ($row = mysqli_fetch_array($result)) {
      $category = <<<DELIMITER
         <a href="index.php?category={$count}&product_group=1" {$this->SetStyleForCurrentCategory($count)} class="list-group-item">{$row['cat_name']}</a> 
        DELIMITER;
      echo $category;
      $count++;
    }
  }

  public function SetStyleForCurrentCategory($count)
  {
    $cat_id = $this->GetCategory();
    $style = "";
    if ($count == $cat_id)
      $style = "style='color:blue'";
    return $style;
  }

  public function GetCategory()
  {
    if (!isset($_GET['category']))
      $cat_id = 0;
    else
      $cat_id = $_GET['category'];
    return $cat_id;
  }

  public function GetGroup()
  {
    if (!isset($_GET['product_group'])) {
      $product_group = 1;
    } else {
      $product_group = $_GET['product_group'];
    }
    return $product_group;
  }

  public function ShowLinkPagination()
  {
    $cb = new categoryB();
    $current_cat = $this->GetCategory();
    $current_group = $this->GetGroup();
    $num = $cb->CalculateNumberOfLinks($current_cat);
    $previou = $current_group - 1;
    $previou_disable = $previou > 0 ? "" : "disable";
    $next = $current_group + 1;
    $next_disable = $next <= $num ? "" : "disable";
    $c = 1;
    echo "<li class='page-item'><a class='page-link' " . $previou_disable .  "href='index.php?category={$current_cat}&product_group={$previou}'>Previous</a></li>";
    for ($x = 1; $x <= $num; $x++) {
      $link = <<<DELIMITER
        <li class="page-item"><a class="page-link" {$this->SetStyleForCurrentPage($c)} href="index.php?category={$current_cat}&product_group={$x}">{$x}</a></li>
        DELIMITER;
      echo $link;
      $c++;
    }
    echo "<li class='page-item'><a class='page-link' " .  $next_disable . "href='index.php?category={$current_cat}&product_group={$next}'>Next</a></li>";
  }

  public function SetStyleForCurrentPage($c)
  {
    $group_id = $this->GetGroup();
    $style = "";
    if ($c == $group_id)
      $style = "style='color:red'";
    return $style;
  }
}
?>