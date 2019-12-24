<?php
if (isset($_POST['search'])) {
  $key = $_POST['key'];
  if ($key && $key != "") {
    header("Location:search.php?key=${key}&pages=1");
  }
}

function convertCurrency($amount, $from, $to)
{
  $data = file_get_contents("https://www.google.com/finance/converter?a=$amount&from=$from&to=$to");
  preg_match("/<span class=bld>(.*)<\/span>/", $data, $converted);
  $converted = preg_replace("/[^0-9.]/", "", $converted[1]);
  return number_format(round($converted, 3), 2);
}
?>
<!DOCTYPE html>
<?php session_start(); ?>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1"> <!-- Ensures optimal rendering on mobile devices. -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge" /> <!-- Optimal Internet Explorer compatibility -->
  <title>Ecommerce</title>
  <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
    .right-20:hover {
      color: white;
      background-color: rgba(128, 128, 128, 0.3);
    }

    body {
      background: #eecda3;
      background: -webkit-linear-gradient(to right, #eecda3, #ef629f);
      background: linear-gradient(to right, #eecda3, #ef629f);
      min-height: 100vh;
    }
  </style>
</head>

<body style="font-family: 'Roboto', sans-serif;">
  <script src="https://www.paypal.com/sdk/js?client-id=AZ23DqM9n7Lu7fXJkfHpwjsaCmnlTQlgp7Hr3X3pjYDwW80gsn7w6c3S08I_tnr-U1jv8QlAIKZoOR3F">
    // Required. Replace SB_CLIENT_ID with your sandbox client ID.
  </script>
  <!-- Navbar -->
  <div class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="index.php">Group P2T2H</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="index.php">Home <span class="sr-only">(current)</span></a>
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

    </div>
  </div>
  <!-- Main -->
  <div class="body">

    <div class="px-4 px-lg-0">
      <!-- For demo purpose -->
      <div class="container text-white py-5 text-center">
        <h1 class="display-4"> Shopping Cart</h1>
      </div>
      <!-- End -->

      <div class="pb-5">
        <div class="container">
          <div class="row">
            <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

              <!-- Shopping cart table -->
              <div class="table-responsive">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col" class="border-0 bg-light">
                        <div class="p-2 px-3 text-uppercase">Product</div>
                      </th>
                      <th scope="col" class="border-0 bg-light">
                        <div class="py-2 text-uppercase">Price</div>
                      </th>
                      <th scope="col" class="border-0 bg-light">
                        <div class="py-2 text-uppercase">Quantity</div>
                      </th>
                      <th scope="col" class="border-0 bg-light">
                        <div class="py-2 text-uppercase">Total</div>
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $totalOrder = 0;
                    $session_name = array_keys($_SESSION['cart']);
                    for ($i = 0; $i < count($_SESSION['cart']); $i++) {
                      $name = $_SESSION['cart'][$session_name[$i]]['product_name'];
                      $image = $_SESSION['cart'][$session_name[$i]]['product_image'];
                      $count = $_SESSION['cart'][$session_name[$i]]['count'];
                      $price = $_SESSION['cart'][$session_name[$i]]['product_price'];
                      $total = $price * $count;
                      $totalOrder += $total;
                    ?>
                      <tr>
                        <th scope="row" class="border-0">
                          <div class="p-2">
                            <img src="<?php echo $image; ?>" alt="" width="70" class="img-fluid rounded shadow-sm">
                            <div class="ml-3 d-inline-block align-middle">
                              <h5 class="mb-0"> <a href="#" class="text-dark d-inline-block align-middle"><?php echo $name; ?></a></h5>
                            </div>
                          </div>
                        </th>
                        <td class="border-0 align-middle"><strong><?php echo number_format($price) . " ₫"; ?></strong></td>
                        <td class="border-0 align-middle"><strong><?php echo $count; ?></strong></td>
                        <td class="border-0 align-middle"><strong><?php echo number_format($total) . " ₫"; ?></strong></td>
                      </tr>
                    <?php } ?>
                  </tbody>
                </table>
              </div>
              <!-- End -->
            </div>
          </div>

          <div class="row py-5 p-4 bg-white rounded shadow-sm">
            <div class="col-lg-7">
              <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold" style="margin-bottom: 15px">Contact Details</div>
              <form action="" method="post" name="info">
                <div class="form-group">
                  <label for="name">Full Name</label>
                  <input type="name" name="name" id="name" class="form-control" aria-describedby="name" placeholder="Name">
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Email </label>
                  <input type="email" name="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Email">
                </div>
                <div class="form-group">
                  <label for="phone">Phone</label>
                  <input type="phone" name="phone" id="phone" class="form-control" aria-describedby="phone" placeholder="Phone">
                </div>
                <div class="form-group">
                  <label for="Address">Address</label>
                  <input type="Address" name="Address" id="Address" class="form-control" aria-describedby="Address" placeholder="Address">
                </div>
                <div class="form-group text-center ">
                  <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">Login</button>
                </div>

              </form>

            </div>
            <div class="col-lg-5">
              <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Order summary </div>
              <div class="p-4">
                <ul class="list-unstyled mb-4">
                  <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Order Subtotal </strong><strong><?php echo number_format($totalOrder) . " ₫"; ?></strong></li>
                  <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Shipping and handling</strong><strong>0 ₫</strong></li>
                  <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tax</strong><strong>0 ₫</strong></li>
                  <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total</strong>
                    <h5 class="font-weight-bold"><?php echo "$" . $totalOrder * 0.000043; ?></h5>
                  </li>
                </ul>
                <div id="paypal-button-container"></div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>

  <!-- paypal -->


  <!-- <script>
        paypal.Buttons().render('body');
        // This function displays Smart Payment Buttons on your web page.
      </script> -->

  <script>
    var values = "<?php echo $totalOrder * 0.000043; ?>";
    paypal.Buttons({
      createOrder: function(data, actions) {
        return actions.order.create({
          purchase_units: [{
            amount: {
              value: values
            }
          }]
        });
      },
      onApprove: function(data, actions) {
        return actions.order.capture().then(function(details) {
          alert('Transaction completed by ' + details.payer.name.given_name);
          // Call your server to save the transaction
          return fetch('/paypal-transaction-complete', {
            method: 'post',
            headers: {
              'content-type': 'application/json'
            },
            body: JSON.stringify({
              orderID: data.orderID
            })
          });
        });
      }
    }).render('#paypal-button-container');
  </script>
  <!-- Footer -->

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>