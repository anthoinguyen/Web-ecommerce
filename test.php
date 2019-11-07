<?php include "include/lib/simple_html_dom.php"; ?>
<?php
$test = new TEST();
$test->GetRelevantLinks("IPHONE X 64GB");
//$test->BuildSearchString("QUẦN THỂ THAO SBO 6008-Men");
//$test->ExploreHTMLTree("https://www.thegioididong.com/dtdd/iphone-x-64gb");
// $test->ExploreHTMLTree("https://fptshop.com.vn/dien-thoai/iphone-x");
// $test->ExploreHTMLTree("https://viettelstore.vn/dien-thoai/iphone-x-64gb-pid118486.html");
// $test->ExploreHTMLTree("https://www.dienmayxanh.com/dien-thoai/iphone-x-64gb");

class TEST
{
  private $max_page = 5;
  private $google_link = "https://www.google.com/search?q=";
  //get all relevant links
  public function GetRelevantLinks($product_name)
  {
    $search = $this->BuildSearchString($product_name);
    $url = $this->google_link . $search;
    $html = file_get_html($url);
    // Find all links
    foreach ($html->find('a') as $element) {
      $A = $product_name;
      $B = $element->plaintext;
      echo $A . '<br>';
      echo $B . '<br>';

      $pos = stripos($B, $A);
      if ($pos !== false) {
        echo $pos . "<br>";
        //echo $element->href . "<br>"; 
        $link = $this->StandarizeLink($element->href);
        //echo $link;
        //$this->FindPrice("https://www.thegioididong.com/dtdd/iphone-x-64gb");
        //$this->FindPrice("https://fptshop.com.vn/dien-thoai/iphone-x");
        //$this->FindPrice("https://viettelstore.vn/dien-thoai/iphone-x-64gb-pid118486.html");
        //$this->FindPrice("https://cellphones.com.vn/apple-iphone-x-64-gb-chinh-hang-vn.html"); -> can not access
        //$this->FindPrice("https://www.dienmayxanh.com/dien-thoai/iphone-x-64gb");
        echo '<br>';
      } else
        echo "ERROR" . "<br>";
      echo '<br>';
    }
  }

  public function ExploreHTMLTree($link)
  {
    $html = file_get_html($link);
    //echo $html;

    $all = $html->find("*");


    for ($i = 0, $max = count($all); $i < $max; $i++) {

      $class = 'Class: ' . $all[$i]->class . '<br>';
      $id = 'ID: ' . $all[$i]->id . '<br>';
      if (stripos($class, "price") !== false) {
        // Do something with the element here
        echo "Count at {$i}" . '<br>';
        //echo count($all[$i]->find("*")).'<br>';
        //echo $all[$i]->find("*")[0]->tag.'<br>';
        echo $all[$i]->tag . '<br>';
        //echo $all[$i]->outertext.'<br>';   
        echo $class;
        $pt1 = $all[$i]->plaintext . '<br>';

        $start = 0;
        $end = stripos($pt1, "₫");
        $link = substr($pt1, $start, $end - $start);
        $arr = explode(".", $link);
        $link1 = implode("", $arr);
        echo $link1 . '<br>';

        $ss = (float) $link1 + 1000;
        echo $ss . '<br>';
        echo '<br>';
      }

      if (stripos($id, "price") !== false) {
        // Do something with the element here
        echo "Count at {$i}" . '<br>';
        //echo count($all[$i]->find("*")).'<br>';
        //echo $all[$i]->find("*")[0]->tag.'<br>';
        echo $all[$i]->tag . '<br>';
        //echo $all[$i]->outertext.'<br>';   
        echo $id;
        $pt2 = $all[$i]->plaintext . '<br>';
        $start = 0;
        $end = stripos($pt2, "₫");
        $link = substr($pt2, $start, $end - $start);
        echo $link . '<br>';
        echo '<br>';
      }

      //echo $all[$i]->innertext.'<br>';
      //echo $all[$i]->plaintext.'<br>';
      //echo $all[$i]->find("*")[0].'<br>';//content 

    }
  }

  public function FindPrice($link)
  {
    $html = file_get_html($link);
    //$ret = $html->find('.area_price');
    //$test = '.area_price';
    //$test = '.fs-dtprice';
    //$test = '#_price_new436';
    //$test = '.price';
    $test = '.area_price';
    echo $test;
    foreach ($html->find($test) as $element)
      echo $element . '<br>';
  }

  public function StandarizeLink($raw_link)
  {
    echo $raw_link . '<br>';
    $start = stripos($raw_link, "http");
    $end = stripos($raw_link, "&");
    $link = substr($raw_link, $start, $end - $start);
    echo $link . '<br>';
    return $link;
  }

  //standardize search string
  public function BuildSearchString($search)
  {
    $list = explode(" ", $search);
    $result = "";
    for ($i = 0; $i < count($list) - 1; $i++)
      $result = $result . $list[$i] . "+";
    $result = $result . $list[$i];
    return $result;
  }
}
// Find all element which class=foo
//foreach($html->find(".price") as $ul){
//  echo $ul->plaintext."<br>";
//}
?>