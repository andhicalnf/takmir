<?php
include_once 'include/voting-class.php';
$user = new User();
if (!$user->get_sesi()){
	header("location:index.php");
}
	$mod=htmlentities(@$_GET['mod']);
	$halaman="./app/$mod/$mod.php";

if(!file_exists($halaman) || empty($mod)){
		if($user->sesi() == 2)
			include "utama.php";
		
		if($user->sesi() == 1)
			include "index_dashboard.php";
	}else{
		include "$halaman";
}
?>