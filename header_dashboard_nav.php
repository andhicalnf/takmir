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
			<?php
				if($user->sesi() == 1){
			?>
				<li><a href="home.php">Home</a></li>
				<li><a href="nilai.php">Nilai</a></li>
				<li><a href="kriteria.php">Kriteria</a></li>
				<li><a href="kandidat.php">Kandidat Awal</a></li>
				<li><a href="rangking.php">Rangking</a></li>
				<li><a href="laporan.php">Laporan</a></li>				
			<?php					
				}
				
				include "menu_dashboard.php";
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
			<?php
				if($user->sesi() == 1){
			?>				
			<li class="dropdown">
			  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-cog"></span> <span class="caret"></span></a>
			  <ul class="dropdown-menu">		  
				<li><a href="profil.php">Profil</a></li>
				<li><a href="user.php">Manajer Pengguna</a></li>
				<li role="separator" class="divider"></li>
				
				<li><a href="logout.php">Logout</a></li>
			  </ul>
			</li>
			<?php
				}
			?>			
		  </ul>
		</div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>