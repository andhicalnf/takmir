<?php
include "includes/config.php";
session_start();
if(!isset($_SESSION['nama'])){
	echo "<script>location.href='index.php'</script>";
}
$config = new Config();
$db = $config->getConnection();
?>
	<?php
		// include_once 'header_init.php';
	?>
  
	<?php
		// include_once 'header_dashboard_nav.php';
	?>
  
	<!-- 1 baris berikut ini sudah ada di index_dashboard.php -->
    <!--<div class="container">-->