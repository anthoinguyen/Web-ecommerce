<?php
// Start the session
session_start();
?>
<!DOCTYPE html>
<html>
<body>

<?php
// Set session variables
session_unset();

// destroy the session
session_destroy();
?>

</body>
</html>