<?php include "business/cardB.php" ?>
<?php session_start(); ?>
<?php
$card = new CardB();
if (isset($_GET['type'])) {
	if ($_GET['type'] == 'addToCart') {
		$id = $_GET['id'];
		$name = $_GET['name'];
		$price = $_GET['price'];
		$image = $_GET['image'];
		$card->AddToCard($id, $name, $price, $image);
	}
	if (isset($_GET['category'])) {
		$category = $_GET['category'];
		$pages = $_GET['pages'];
		header("Location: index.php?category={$category}&pages={$pages}");
	} else {
		$id = $_GET['id'];
		header("Location: item.php?product_id={$id}");
	}
	exit();
}
?>