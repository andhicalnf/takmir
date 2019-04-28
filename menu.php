<!--
<ul class="nav">
-->
<?php
include_once 'include/voting-class.php';
$user = new User();
$kandidat = new DataKandidat();

$session = $_SESSION['id'];
$valpil = $kandidat->validasiPilihKandidat($session);
if($user->sesi()==1){ ?>
	<li><a href="home.php?mod=datapemilih"><i class="icon-book icon-white"></i> Pemilih Tetap</a></li>
	<li><a href="home.php?mod=kandidatcalon"><i class="icon-book icon-white"></i> Kandidat Voting</a></li>
	<li><a href="home.php?mod=perolehansuara"><i class="icon-book icon-white"></i> Hasil Perolehan Suara</a></li>
	<!--<li><a href="?mod=logout"><i class="icon-off icon-white"></i> Logout</a></li>-->
<?php }elseif($user->sesi()==2){
    if ($valpil < 0) {
        $pemilu = "home.php#";
        $profil = "home.php#";
        $logout = "home.php#";
    } else {
        $pemilu = "home.php?mod=pemilu";
        $profil = "home.php?mod=profil";
        $logout = "home.php?mod=logout";
    }

	echo "<li><a href=\"$pemilu\"><i class=\"icon-th-large icon-white\"></i> Pemilu</a></li>";
	// echo "<li><a href=\"$logout\"><i class=\"icon-off icon-white\"></i> Logout</a></li>";
}
?>
</ul>
<!--
<div class="btn-group pull-right">
	<button class="btn btn-primary"><i class="icon-user icon-white"></i> <?php echo $_SESSION['nama']; ?></button>
</div>
-->
