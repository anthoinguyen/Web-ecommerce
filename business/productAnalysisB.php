<?php include "../data/database.php"; ?>
<?php include "../include/lib/simple_html_dom.php"; ?>
<?php
$from = "2019-08-01";
$to = "2019-10-31";
$product_name = "iphone x 64gb";
$test = new ProductAnalysisB();
//$return_list = $test->GetRelevantLinks($product_name);
//$test->BuildUpDataset($product_name, $return_list);
$type = "class";
$rule = "price";
$raw = "19.000.000   đ   Tra gop ahihi";
$link = "https://www.thegioididong.com/dtdd/iphone-x-64gb";
//$test->CheckRuleMatchLink($link, $type, $rule);
$test->TrainRule($product_name);
//$test->GetUnfriendlyLinks($product_name);
//$test->FindPrice($link);
//$test->GetPrice($raw);

class ProductAnalysisB
{
  private $hight_view = 2;
  private $google_link = "https://www.google.com/search?q=";

  public function GetRelevantLinks($product_name)
  {
    // 1.Build search string
    $search = $this->BuildSearchString($product_name);
    $url = $this->google_link . $search;

    // 2.Send search string and get result 
    $html = file_get_html($url);
    // 3.Analyze search result and get
    // plaintext is content inside
    $return_list = array();
    foreach ($html->find('a') as $element) {
      $pos = stripos($element->plaintext, $product_name);
      if ($pos !== false) {
        $link = $this->StandarizeLink($element->href);
        if ($link != -1) {
          $return_list["{$element->plaintext}"] = "{$link}";
        }
      }
    }

    return $return_list;
  }

  public function CheckRuleMatchLink($link, $type, $rule)
  {
    $html = file_get_html($link);
    $all = $html->find("*");
    $matched_num = 0;

    for ($i = 0, $max = count($all); $i < $max; $i++) {
      $temp = $this->GetType($type);

      if ($temp == 1) {
        $matched_num += $this->CompareClassRule($all[$i], $rule);
      } else if ($temp == 2) {
        $matched_num += $this->CompareIDRule($all[$i], $rule);
      } else {
        $matched_num += $this->CompareClassRule($all[$i], $rule);
        $matched_num += $this->CompareIDRule($all[$i], $rule);
      }
      // if ($matched_num > 0) {
      //   return $matched_num;
      // }
    }
    return $matched_num;
  }

  public function CompareIDRule($element, $rule)
  {
    $id = 'Class: ' . $element->id . '<br>';
    if (stripos($id, $rule) !== false) {
      echo $element->tag . '<br>';
      echo $id;
      $pt2 = $element->plaintext . '<br>';
      //echo $pt2 . '<br>';
      $this->GetPrice($pt2);
      echo '<br>';
      return 1;
    }
    return 0;
  }

  public function CompareClassRule($element, $rule)
  {
    $class = 'Class: ' . $element->class . '<br>';
    if (stripos($class, $rule) !== false) {
      echo $element->tag . '<br>';
      echo $class;
      $pt1 = $element->plaintext . '<br>';
      echo $pt1 . '<br>';
      $this->GetPrice($pt1);
      echo '<br>';
      return 1;
    }
    return 0;
  }

  public function GetPrice($raw_string)
  {
    $pt1 = implode("", explode(" ", $raw_string));
    $end = stripos($pt1, "₫");
    $start = $end - 1;
    $price = 0;
    $base = 1;
    while ($start >= 0) {
      $link = substr($pt1, $start, $end - $start);
      if (is_numeric($link) || ($link == ".")) {
        if ($link != ".") {
          $price = $price + $base * intval($link);
          $base = $base * 10;
        }
        // echo $link . '<br>';
      } 
      // else {
      //   $start = -1;
      // }
      $end = $start;
      $start = $end - 1;
    }
    echo $price;
  }

  public function GetType($type)
  {
    if (stripos($type, 'class') !== false) {
      $temp = 1;
    } else if (stripos($type, 'ID') !== false) {
      $temp = 2;
    } else {
      $temp = 3;
    }
    return $temp;
  }

  public function IsLearn($rule_id, $link_id)
  {
    $sql = "SELECT count(*)as num FROM Rule_And_Dataset WHERE rule_id = {$rule_id} AND link_id = {$link_id}";
    $db = new Database();
    $result = $db->select($sql);
    $row = mysqli_fetch_array($result);
    return $row['num'];
  }

  public function TrainRule($product_name)
  {
    // 1.Get dataset
    $return_list = $this->GetAllLinks($product_name);

    // 2.Get rules and test train
    $sql = "SELECT * FROM rules";
    $db = new Database();
    $result = $db->select($sql);
    while ($row = mysqli_fetch_array($result)) {
      $rule_name = $row['name'];
      $type = $row['class_or_ID'];
      $rule_id = $row['rule_id'];
      $is_price = -1;
      $count = 0;
      foreach ($return_list as $x => $x_value) {
        $is_price = 0;
        $num = $this->CheckRuleMatchLink($x_value, $type, $rule_name);
        if ($num > 0) {
          $count++;
          $is_price = 1;
        }
        // Update relationship table
        if ($this->IsLearn($rule_id, $x) == 0) {
          if ($is_price > 0) {
            $this->UpdateRelationshipTable($rule_id, $x, 1, $is_price);
          } else {
            $this->UpdateRelationshipTable($rule_id, $x, 1, $is_price);
          }
        }
      }

      //1. Update matching ratio
      $ratio = (float) $count / count($return_list);
      $this->UpdateMatchingRatio($row['rule_id'], $ratio);
    }
  }

  public function GetUnfriendlyLinks($product_name)
  {
    // 1.Get dataset
    $link_list = $this->GetAllLinks($product_name);

    //2. Get All Rule
    $rule_list = $this->GetAllRule();

    //3. Check every link in Relationship table
    $return_list = array();
    foreach ($link_list as $link_id => $link_name) {
      $flag = 1;
      foreach ($rule_list as $rule_id => $rule_name) {
        // Check rule match link
        $num = $this->CheckLinkMatchRule($link_id, $rule_id);
        if ($num == 1) {
          $flag = 0;
        }
      }
      if ($flag == 1) {
        $return_list["{$link_id}"] = "{$link_name}";
      }
    }
    return $return_list;
  }

  public function CheckLinkMatchRule($link_id, $rule_id)
  {
    $sql = "SELECT `is_indentified_price` FROM `rule_and_dataset` WHERE link_id = {$link_id} AND rule_id = {$rule_id}";
    $db = new Database();
    $result = $db->select($sql);
    $row = mysqli_fetch_array($result);
    return $row['is_indentified_price'];
  }

  public function GetAllRule()
  {
    $sql = "SELECT * FROM rules";
    $db = new Database();
    $result = $db->select($sql);
    $return_list = array();
    while ($row = mysqli_fetch_array($result)) {
      $rule_ID = $row['rule_id'];
      $rule_name = $row['name'];
      $return_list["{$rule_ID}"] = "{$rule_name}";
    }
    return $return_list;
  }

  public function UpdateRelationshipTable($rule_id, $link_id, $is_visited, $is_price)
  {
    $sql = "INSERT INTO `Rule_And_Dataset`(`rule_id`,`link_id`,`is_visited`,`is_indentified_price`) VALUES ({$rule_id},{$link_id},{$is_visited},{$is_price})";
    $db = new Database();
    $db->insert($sql);
  }

  public function UpdateMatchingRatio($rule_id, $ratio)
  {
    $sql = "UPDATE `Rules` SET `matching_ratio`={$ratio} WHERE rule_id = {$rule_id}";
    $db = new Database();
    $db->update($sql);
  }

  public function GetAllLinks($product_name)
  {
    $PROD = "'" . $product_name . "'";
    $sql = "SELECT * FROM dataset WHERE product_name = {$PROD}";
    $db = new Database();
    $result = $db->select($sql);
    $return_list = array();
    while ($row = mysqli_fetch_array($result)) {
      $link_ID = $row['link_id'];
      $link_name = $row['link_name'];
      $return_list["{$link_ID}"] = "{$link_name}";
    }
    return $return_list;
  }

  public function BuildUpDataset($product_name, $return_list)
  {
    foreach ($return_list as $x => $x_value) {
      // 1.Get link is not in dataset
      $test = $this->CheckLinkInDataset($x_value);
      $test1 = $this->TestLink($x_value);
      // 2.Insert this link
      if ($test == 0 && $test1 == 1) {
        $PROD = "'" . $product_name . "'";
        $LINK = "'" . $x_value . "'";
        $sql = "INSERT INTO `dataset` (`product_name`,`link_name`) VALUES ({$PROD},{$LINK})";
        $db = new Database();
        $db->insert($sql);
      }
    }
  }

  public function TestLink($link)
  {
    $html = file_get_html($link);
    if ($html == false) {
      return -1;
    }
    return 1;
  }

  public function CheckLinkInDataset($link)
  {
    $LINK = "'" . $link . "'";
    $sql = "SELECT COUNT(*) as NUM FROM `dataset` WHERE `link_name` = {$LINK}";
    $db = new Database();
    $result = $db->select($sql);
    $row = mysqli_fetch_array($result);
    return $row['NUM'];
  }

  public function FindPrice($link)
  {
    $html = file_get_html($link);
    //$ret = $html->find('.area_price');
    //$test = '.area_price';
    $test = '.fs-dtprice';
    //$test = '#_price_new436';
    //$test = '.price';
    //$test = '.area_price';
    echo $test;
    foreach ($html->find($test) as $element)
      echo $element . '<br>';
  }

  public function StandarizeLink($raw_link)
  {
    $start = stripos($raw_link, "http");
    if ($start !== false) {
      $end = stripos($raw_link, "&");
      $link = substr($raw_link, $start, $end - $start);
      return $link;
    }
    return -1;
  }

  //standardize search string, replace space --> plus
  public function BuildSearchString($search)
  {
    $list = explode(" ", $search);
    $result = "";
    for ($i = 0; $i < count($list) - 1; $i++)
      $result = $result . $list[$i] . "+";
    $result = $result . $list[$i];
    return $result;
  }

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
