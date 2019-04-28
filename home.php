<?php
error_reporting(0);
session_start();
include_once 'include/voting-class.php';

$db = new Database();
$db->connectMySQL();

$user = new User();
$iduser = $_SESSION['id'];
if (!$user->get_sesi()){
  header("location:index.php");
}
if ($_GET['mod'] == 'logout'){
$user->logout();
  header("location:index.php");
}
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>PILUTAMA</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!--<link href="asset/css/bootstrap.min.css" rel="stylesheet">-->
    <!-- <link href="asset/css/bootstrap-responsive.min.css" rel="stylesheet"> -->
    <link href="asset/css/docs.css" rel="stylesheet">
    <link rel="stylesheet" href="datatables/jquery.dataTables.css">

	<!--
    <script src="asset/js/jquery-latest.js"></script>
    <script src="asset/js/bootstrap.min.js"></script>
	-->
	
    <script src="js/jquery-1.11.3.min.js"></script>	
	<script src="js/bootstrap.min.js"></script>
	
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
  
  <body style="padding-top:0 !important">  
	<?php
		// include 'home_nav.php';		
		include 'header_dashboard_nav.php';
	?>
	
    <div class="container">
    <?php include 'isi.php'; ?>
    <footer class="well">
      <p>&copy; <?php echo date("Y");?> Pemilihan Calon Ketua Takmir Masjid Baitul Muttaqien<br/>
      </p>
    </footer>

    </div> <!-- /container -->
<script src="datatables/jquery-1.10.2.min.js"></script> <!-- Memasukkan plugin jQuery -->
<script src="datatables/jquery.dataTables.js"></script> <!-- Memasukkan file jquery.dataTables.js -->
<script>
$(document).ready(function() {
    $('#datatable').dataTable( {
        "pagingType": "full_numbers"
    } ); // Menjalankan plugin DataTables pada id contoh. id contoh merupakan tabel yang kita gunakan untuk menampilkan data
} );
</script>
  </body>
</html>
