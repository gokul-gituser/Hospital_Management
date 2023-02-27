<%@page import="com.db.DBConnect"  %>
<%@page import="java.sql.Connection" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
 <%@include file="component/css.jsp" %> 
<style type="text/css">
	.paint-card{
		box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
	}
	.picc{
	display: inline;
  max-width:300px;
  max-height:300px;
  width: 100%;
  height: 100%;
	}
	#pic{
	  display: block;
  max-width:400px;
  max-height:400px;
  width: auto;
  height: auto;
	
	}
</style>
</head>
<body>

 <%@include file="component/navbar.jsp" %>
 

 
<div id="carouselExample" class="carousel slide">
  <div class="carousel-inner">
    <div class="carousel-item active ">
      <img src="images/2.jpeg" class="d-block w-100 " alt="..."  >
    </div>
    <div class="carousel-item">
      <img src="images/6.jpg
      " class="d-block w-100 " alt="..." >
    </div>
    <div class="carousel-item">
      <img src="images/7.jpeg" class="d-block w-100 " alt="..." >
    </div>
    <div class="carousel-item">
      <img src="images/4.jpg" class="d-block w-100" alt="..." >
    </div>
    <div class="carousel-item">
      <img src="images/5.jpg" class="d-block w-100" alt="..." >
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<div class="container p-3">
	<p class="text-center fs-2">Key Features of our Hospital</p>
		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>lorem adkv dfkf adskdm d adjis trhe ndfif safdf cdfe xosd i ifmieg dmdfedsff idfd sd fdd porgorpg</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Clean Environment</p>
								<p>lorem adkv dfkf adskdm d adjis trhe ndfif safdf cdfe xosd i ifmieg dmdfedsff idfd sd fdd porgorpg</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2 ">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Friendly Staff</p>
								<p>lorem adkv dfkf adskdm d adjis trhe ndfif safdf cdfe xosd i ifmieg dmdfedsff idfd sd fdd porgorpg</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Medical Research</p>
								<p>lorem adkv dfkf adskdm d adjis trhe ndfif safdf cdfe xosd i ifmieg dmdfedsff idfd sd fdd porgorpg</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		<div class="col-md-4 ">
			<img id="pic" src="images/doc.jpg">
		</div>
		</div>
</div>
<hr>

<div class="container p-2">
	<p class="text-center fs-2">Our Team</p>
	<div class="row">
		<div class="col-md-3">
			<div class="card paint-card">
				<div class="card-body text-center">
							<img class="picc" src="images/new1.jpg">							
							<p class="fw-bold fs-5">Dr.Samantha P</p>
							<p class="fs-7">Chairman & Medical Director</p>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="card paint-card">
				<div class="card-body text-center">
							<img class="picc" src="images/new2.jpg">							
							<p class="fw-bold fs-5">Dr.John Doe</p>
							<p class="fs-7">Junior Resident</p>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="card paint-card">
				<div class="card-body text-center">
							<img class="picc" src="images/new3.jpg">							
							<p class="fw-bold fs-5">Dr.George Paul</p>
							<p class="fs-7">Chief Resident</p>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="card paint-card">
				<div class="card-body text-center">
							<img class="picc" src="images/new4.jpg">							
							<p class="fw-bold fs-5">Dr.Lily Manuel</p>
							<p class="fs-7">Senior Resident</p>
				</div>
			</div>
		</div>
	</div>
</div>


<%@include file="component/footer.jsp" %>
</body>
</html>