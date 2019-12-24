<?php
class CardB
{
	public function AddToCard($id, $name, $price, $image )
  	{
  		$session_name = "name" . $name;
  		if (isset($_SESSION['cart']["{$session_name}"])) {
        	$_SESSION['cart']["{$session_name}"]['count']++;
        	return;
	    }else{
	    	$_SESSION['cart']["{$session_name}"] = array(
		    	"product_id" => $id,
		        "product_name" => $name,
		        "product_price" => $price,
		        "product_image" => $image,
		        "count" => 1
	      	);
	    }
	    print_r($_SESSION['cart']);
  	}
}
?>