<?php
session_start();
$_SESSION["user"]=null;
echo $_SESSION["user"];//TODO この行は消しましょう。
header('Location: login.php');
session_destroy();