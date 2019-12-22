<?php
//$test = new InventoryB();
$from = "2019-08-01";
$to = "2019-12-21";
//$test->UpdatePerformanceTable(30,$from,$to);

//$test->GetPoorPerformanceList($from,$to);
class InventoryB
{
  public function GetPoorPerformanceList($from, $to)
  {
    // 1. Get product_id
    $product_list = $this->GetRelevantProductID($from, $to);

    // 2. Update "return" array
    $plist = array();
    while ($row = mysqli_fetch_array($product_list)) {
      $product_id = $row['product_id'];

      // 2.1 Get correct performance
      $performance = $this->GetLatestPerformance($product_id);
      $plist["{$product_id}"] = "{$performance}";
    }
    asort($plist);
    return $plist;
  }

  public function GetLatestPerformance($product_id)
  {
    $sql = "SELECT performance FROM inventory_performance
    WHERE ip_id = (SELECT max(ip_id) FROM (SELECT * FROM inventory_performance 
    WHERE product_id = {$product_id}) as TEMP)";
    $db = new Database();
    $result = $db->select($sql);
    $row = mysqli_fetch_array($result);
    return $row['performance'];
  }

  public function GetRelevantProductID($from, $to)
  {
    $FROM = "'" . $from . "'";
    $TO = "'" . $to . "'";
    $sql = "SELECT DISTINCT product_id FROM inventory_performance WHERE from_date>{$FROM} AND to_date<{$TO}";
    $db = new Database();
    $result = $db->select($sql);
    return $result;
  }

  public function UpdatePerformanceTable($product_id, $from, $to)
  {
    $FROM = "'" . $from . "'";
    $TO = "'" . $to . "'";
    $performance = $this->CalculatePerformance($product_id, $from, $to);
    $sql = "INSERT INTO `inventory_performance`(`product_id`,`from_date`,`to_date`,`performance`) 
    VALUES ({$product_id},{$FROM},{$TO},{$performance})";
    $db = new Database();
    $db->insert($sql);
  }


  public function CalculatePerformance($product_id, $from, $to)
  {
    // 1. Get all relevant inventory_id
    $list = $this->GetRelevantInventoryID($product_id, $to);

    // 2.SUM M_S, M_I, -->P_ID
    $sum_M_S = 0;
    $sum_M_I = 0;
    while ($row = mysqli_fetch_array($list)) {
      $inventory_id = $row['inventory_id'];
      $import_date = $row['import_date'];

      // 2.1 Find out M_S of current inventory_id
      $sum_M_S = $this->MarkOfSoldItems($inventory_id, $from, $to, $import_date);
      // 2.2 Find out M_I of current inventory_id
      $sum_M_I += $this->MarkOfInStockItems($inventory_id, $import_date);
    }
    return $sum_M_S / ($sum_M_S + $sum_M_I);
  }

  public function MarkOfInStockItems($inventory_id, $import_date)
  {
    // 1. Get latest record
    $record = $this->GetLatestInventoryStatus($inventory_id);

    // 2. Calculate 1 row
    $row = mysqli_fetch_array($record);
    $in_stock_amount = $row['in_stock'];
    $M = strtotime($import_date);
    $M_I = $M * $in_stock_amount;
    return $M_I;
  }

  public function GetLatestInventoryStatus($inventory_id)
  {
    $sql = "SELECT * FROM inventory_management WHERE inventory_id = {$inventory_id} ORDER BY im_id DESC LIMIT 1";
    $db = new Database();
    $result = $db->select($sql);
    return $result;
  }

  public function MarkOfSoldItems($inventory_id, $from, $to, $import_date)
  {
    // 1. Get correct row
    $list = $this->GetCorrectSoldItems($inventory_id, $from, $to);

    // 2.Calculate row by row
    $total = 0;
    $M = strtotime($import_date);
    while ($row = mysqli_fetch_array($list)) {
      $export_date = $row['export_date'];
      $E = strtotime($export_date);
      $N = strtotime($to);
      $M_S = $N - ($E - $M);
      $total += $M_S;
    }
    return $total;
  }

  public function GetCorrectSoldItems($inventory_id, $from, $to)
  {
    $FROM = "'" . $from . "'";
    $TO = "'" . $to . "'";
    $sql = "SELECT * FROM inventory_out WHERE inventory_id = {$inventory_id} AND export_date>{$FROM} AND export_date<{$TO}";
    $db = new Database();
    $result = $db->select($sql);
    return $result;
  }

  public function GetRelevantInventoryID($product_id, $to)
  {
    $TO = "'" . $to . "'";
    $sql = "SELECT * FROM inventory_in WHERE product_id = {$product_id} AND import_date<{$TO}";
    $db = new Database();
    $result = $db->select($sql);
    return $result;
  }
}
