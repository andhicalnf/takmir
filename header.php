<?php
	session_start();
	include_once 'include/voting-class.php';
	
	$db = new Database();
	$db->connectMySQL();	
	
	$user = new User();
	if (!$user->get_sesi()){
		header("location:index.php");
	}
	
	if($user->sesi() == 2){
		header("location:home.php");
	}
	
include "includes/config.php";
if(!isset($_SESSION['nama'])){
	echo "<script>location.href='index.php'</script>";
}
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>PILUTAMA</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/dataTables.bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  
	<nav class="navbar navbar-inverse navbar-static-top">
	  <div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
		  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </button>
		  <a class="navbar-brand" href="home.php">TAMA</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		  <ul class="nav navbar-nav">
			<li><a href="home.php">Home</a></li>
			<?php
				if($user->sesi() == 1){
			?>			
			<li><a href="nilai.php">Nilai</a></li>
			<li><a href="kriteria.php">Kriteria</a></li>
			<li><a href="kandidat.php">Kandidat Awal</a></li>
			<li><a href="rangking.php">Rangking</a></li>
			<li><a href="laporan.php">Laporan</a></li>
			<?php					
				}
				
				include "menu.php";
			?>
		  </ul>
		  <ul class="nav navbar-nav navbar-right">
			<li>
			<?php
				if($user->sesi() == 1){
			?>		
				<a href="profil.php">
			<?php
				}else{
			?>
				<a href="javascript:void(0)">
			<?php
				}
			?>
					<?php echo $_SESSION['nama'] ?>
				</a>
			</li>
			<li class="dropdown">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-cog"></span> <span class="caret"></span></a>
			  <ul class="dropdown-menu">
				<?php
					if($user->sesi() == 1){
				?>				  
				<li><a href="profil.php">Profil</a></li>
				<li><a href="user.php">Manajer Pengguna</a></li>
				<li role="separator" class="divider"></li>
				<?php
					}
				?>				
				<li><a href="logout.php">Logout</a></li>
			  </ul>
			</li>
		  </ul>
		</div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
  
    <div class="container">
<?php	
	//koneksi db dari folder gub
	$config = new Config();
	$db = $config->getConnection();	
?>