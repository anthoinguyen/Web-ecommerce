<?php include "../data/database.php"; ?>
<?php include "../include/lib/simple_html_dom.php"; ?>
<?php
// $from = "2019-09-01";
// $to = "2019-10-31";
 $test = new ProductAnalysisB();
// $test->GetView(1, $from, $to);
$test->TEST();
class ProductAnalysisB
{
  public function TEST()
  {
    $html = file_get_html("https://vnexpress.net");
    echo $html;
  }
  // private $hight_view = 2;
  public function GetView($product_id, $from, $to)
  {
    $FROM = "'" . $from . "'";
    $TO = "'" . $to . "'";
    $sql = "SELECT COUNT(*) as NUM FROM `Product Analysis` WHERE `product_id`={$product_id} AND `visited_date`>{$FROM} AND `visited_date`< {$TO}";
    $db = new Database();
    $result = $db->select($sql);
    $row = mysqli_fetch_array($result);
    echo $row['NUM'];
    // return $result;
  }

  public function UpdateViewOfProduct($product_id)
  {
    $now = date("Y-m-d H:i:s");
    $NOW = "'" . $now . "'";
    $sql = "INSERT INTO `Product Analysis`(`product_id`,`visited_date`) VALUES ({$product_id},{$NOW})";
    $db = new Database();
    $db->insert($sql);
  }
}
