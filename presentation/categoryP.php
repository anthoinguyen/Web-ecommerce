<?php include "business/categoryB.php" ?>
<?php



// $test = new CategoryP();
// echo $test -> showLinksOfPagination();
class CategoryP
{
  public function ShowAllCategories()
  {
    $cb = new CategoryB();
    $result = $cb->GetAllCategories();

    $count = 1;
    while ($row = mysqli_fetch_array($result)) {
      $catgory = <<<DELIMITER
        <a href="index.php?category={$count}&page=1" class="list-group-item list-group-item-action" 
        {$this->SetStyleForCurrentCategory($count)}>
           {$row['cat_name']}
         </a>
        DELIMITER;
      echo $catgory;
      $count++;
    }
  }

  public function BuildLinks()
  {
    $cb = new CategoryB();
    $cat_id = $this->GetCategory();
    $num = $cb->CalculateNumberOfLinks($cat_id);
    if ($num == 1)
      return;
    $count = 1;
    while ($count <= $num) {
      $link = <<<DELIMITER
      <a href="index.php?category={$cat_id}&page={$count}" {$this->SetStyleForCurrentPage($count)}>
         [{$count}]
       </a>
      DELIMITER;

      echo $link;
      $count++;
    }
  }


  public function showLinksOfPagination()
  {
    $cb = new CategoryB();
    $current_cat = $this->GetCategory();
    $result =  $cb->CalculateNumberOfLinks($current_cat);
    return $result;
  }

  public function SetStyleForCurrentPage($count)
  {
    $page_id = $this->GetPage();
    $style = "";
    if ($count == $page_id)
      $style = "style='color:red'";
    return $style;
  }

  public function SetStyleForCurrentCategory($count)
  {
    $cat_id = $this->GetCategory();
    $style = "";
    if ($count == $cat_id)
      $style = "style='color:red'";
    return $style;
  }


  public function GetPage()
  {
    if (!isset($_GET['page']))
      $page_id = 1;
    else
      $page_id = $_GET['page'];
    return $page_id;
  }

  public function GetCategory()
  {
    if (!isset($_GET['category']))
      $cat_id = 0;
    else
      $cat_id = $_GET['category'];
    return $cat_id;
  }
}
?>