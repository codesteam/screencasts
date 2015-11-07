<?php
    if (!empty($_POST)) {
        echo "Login Success {$_POST['username']}!";
        die;
    }
?>

<h1>Login</h1>
<form action="" method="post">
  <input type="text" name="username">
  <input type="submit" value="Submit">
</form>