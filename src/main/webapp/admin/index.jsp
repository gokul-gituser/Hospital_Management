<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<%@include file="../component/css.jsp" %>

<style type="text/css">
	.paint-card{
		box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
	}
	</style>
</head>
<body>

<%@include file="navbar.jsp" %>

<c:if test="${empty adminObj }">
	<c:redirect url="../admin_login.jsp"></c:redirect>
</c:if>
<div class="container p-5">
	<p class="text-center fs-3">Admin Dashboard</p>
	<c:if test="${not empty sucMsg }">
						<p class="text-center text-success fs-3">${sucMsg}</p>
						<c:remove var="sucMsg" scope="session"/>
					</c:if>
					<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger fs-5">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session"/>
					</c:if>
					
	<% DoctorDao dao = new DoctorDao(DBConnect.getConn()); %>
	
		<div class="row">
			<div class="col-md-4">
						<div class="card paint-card">
							<div class="card-body text-center text-success">
							<i class="fa-solid fa-user-doctor"></i><br>
								<p class="fs-4 text-center">Doctors<br><%=dao.countDoctor() %> </p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card paint-card">
							<div class="card-body text-center text-success">
							<i class="fa-solid fa-circle-user"></i><br>
								<p class="fs-4 text-center">Patients<br><%=dao.countUser() %> </p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card paint-card">
							<div class="card-body text-center text-success">
							<i class="fa-solid fa-clipboard-user"></i><br>
								<p class="fs-4 text-center">Total Appointments<br><%=dao.countAppointment() %> </p>
							</div>
						</div>
					</div>
					<div class="col-md-4 mt-2">
						<div class="card paint-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
							<div class="card-body text-center text-success">
							<i class="fa-solid fa-hospital-user"></i><br>
								<p class="fs-4 text-center">Specialties<br><%=dao.countSpecialty() %> </p>
							</div>
						</div>
					</div>
			</div>
			<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Enter New Specialty</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form  action="../addSpecialty" method="post">
        	<div class="form-group">
        		
        		<input type="text" name="specName" class = "form-control">
        	</div>
        	<div class="text-center mt-3">
        		<button type="submit" class="btn btn-primary">Add</button> 
        	</div>
        	
        </form>
      </div>
      
    </div>
  </div>
</div>
	
		</div>
</div>

</body>
</html>