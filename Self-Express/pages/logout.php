<?php 

session_start();

if(isset($_SESSION['selfexpress_userid']))
{
	$_SESSION['selfexpress_userid'] = NULL;
	unset($_SESSION['selfexpress_userid']);

}

header("Location: login.php");
die;

?>