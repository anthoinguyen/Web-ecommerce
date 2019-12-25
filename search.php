<?php
if (isset($_POST['search'])) {
  $key = $_POST['key'];
  if ($key && $key != "") {
    header("Location:search.php?key=${key}&pages=1");
  }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Ecommerce</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
  <!-- Navbar -->
  <div class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="index.php">An Thới</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">About</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Service
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Contact</a>
        </li>
      </ul>
      <form class="form-inline my-2 my-lg-0" method="POST" action="">
        <input style="width:460px" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="key">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="search">Search</button>
        <button class="right-20" style="border: 1px solid green; margin-left:100px; padding:5px; border-radius: 5px;">
          <span class="fas fa-cart-plus" style="font-size:30px; color:green; opacity:0.7; margin-right:5px">

            <!-- <span  style="color: red; position:absolute; top:-5px; left:20px; font-size:15px">1</span> -->
          </span>
          <span style="font-size:16px; position:relative; top:-5px; color:green; margin-right:10px">giỏ hàng</span>
          <span style=" position:relative; top:-4px; margin-right:10px; color:red">0</span>
        </button>
      </form>
    </div>
  </div>
  <!-- Main -->
  <div class="container">
    <div class="row">
      <div class="col-sm-3">
        <!-- List-group -->
        <div class="list-group">
          <h3>List of categrogies</h3>
          <?php
          include "presentation/categoryP.php";
          $cp = new CategoryP();
          $cp->ShowAllCategories();
          ?>
        </div>
      </div>
      <div class="col-sm-9">
        <h3>Search for "
          <?php
          include "presentation/productP.php";
          $pp = new ProductP();
          $key = $pp->GetKeyOfSearch();
          if ($key) {
            echo $key;
          } ?>"
        </h3>
        <div class="row">
          <?php
          $pp->ShowProductBySearchKey();
          ?>
        </div>
      </div>
      <nav aria-label="Page navigation example" style="display:inline; margin-left:77%">
        <ul class="pagination">
          <!-- <li class="page-item"><a class="page-link" href="#">Previous</a></li> -->
          <?php
          $pp->BuildLinksOfSearch();
          ?>
          <!-- <li class="page-item"><a class="page-link" href="#">Next</a></li> -->
        </ul>
      </nav>
    </div>
  </div>
  <!-- Footer -->
  <footer class="page-footer font-small indigo">
    <div class="container text-center text-md-left">
      <div class="row">
        <div class="col-md-3 mx-auto">
          <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Links</h5>
          <ul class="list-unstyled">
            <li>
              <a href="#!">Very long link 1</a>
            </li>
            <li>
              <a href="#!">Very long link 2</a>
            </li>
            <li>
              <a href="#!">Very long link 3</a>
            </li>
            <li>
              <a href="#!">Very long link 4</a>
            </li>
          </ul>

        </div>
        <hr class="clearfix w-100 d-md-none">
        <div class="col-md-3 mx-auto">
          <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Links</h5>
          <ul class="list-unstyled">
            <li>
              <a href="#!">Link 1</a>
            </li>
            <li>
              <a href="#!">Link 2</a>
            </li>
            <li>
              <a href="#!">Link 3</a>
            </li>
            <li>
              <a href="#!">Link 4</a>
            </li>
          </ul>
        </div>
        <hr class="clearfix w-100 d-md-none">
        <div class="col-md-3 mx-auto">
          <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Links</h5>
          <ul class="list-unstyled">
            <li>
              <a href="#!">Link 1</a>
            </li>
            <li>
              <a href="#!">Link 2</a>
            </li>
            <li>
              <a href="#!">Link 3</a>
            </li>
            <li>
              <a href="#!">Link 4</a>
            </li>
          </ul>
        </div>
        <hr class="clearfix w-100 d-md-none">
        <div class="col-md-3 mx-auto">
          <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Links</h5>
          <ul class="list-unstyled">
            <li>
              <a href="#!">Link 1</a>
            </li>
            <li>
              <a href="#!">Link 2</a>
            </li>
            <li>
              <a href="#!">Link 3</a>
            </li>
            <li>
              <a href="#!">Link 4</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="footer-copyright text-center py-3">© 2019 Copyright: UIT - AnThoi
    </div>
  </footer>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>