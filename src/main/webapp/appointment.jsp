<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
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
<title>New Appointment</title>
<%@include file="../component/css.jsp" %>

<style type="text/css">
	.paint-card{
		box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
	}
	</style>
</head>
<body>
 <%@include file="component/navbar.jsp" %>

<div class="container p-3">
	<div class="row">
		<div class="col-md-6 offset-md-3">
			<div class="card paint-card">
				<div class="card-body">
					<p class="text-center fs-3">New Appointment</p>
					<c:if test="${not empty sucMsg }">
						<p class="text-center text-success fs-4">${sucMsg}</p>
						<c:remove var="sucMsg" scope="session"/>
					</c:if>
					<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger fs-4">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session"/>
					</c:if>
					
					<form class="row g-3" action="newAppointment" method="post">
						<input type="hidden" name="userid" value="${userObj.id }"> 
						<div class="col-md-6">
							<label for="inputEmail4" class="form-label">Full Name</label>
							<input required type="text" class="form-control" name="fullname">
						</div>
						<div class="col-md-6">
							<label class="mb-2">Gender</label><select class="form-control" name="gender" required>
							<option value="">  </option>
							<option value="male" > Male</option>
							<option value="female">Female</option>
							</select>
						</div>
						<div class="col-md-6">
							<label for="inputEmail4" class="form-label">Age</label>
							<input required type="number" class="form-control" name="age">
						</div>
						<div class="col-md-6">
							<label for="inputEmail4" class="form-label">Appointment Date</label>
							<input required type="date" class="form-control" name="appoint_date">
						</div>
						<div class="col-md-6">
							<label for="inputEmail4" class="form-label">Email</label>
							<input required type="email" class="form-control" name="email">
						</div>
						<div class="col-md-6">
							<label for="inputEmail4" class="form-label">Phone number</label>
							<input maxlength="10" required type="number" class="form-control" name="phone">
						</div>
						<div class="col-md-6">
							<label for="inputEmail4" class="form-label">Diseases</label>
							<input required type="text" class="form-control" name="diseases">
						</div>
						
						<div class="col-md-6">
							<label for="inputPassword4" class="form-label">Doctor</label>
							<select required class="form-control" name="doct">
								<option value="">--select--</option>
								
								<% DoctorDao dao= new DoctorDao(DBConnect.getConn());
									List<Doctor> list =dao.getAllDoctor();
									for(Doctor d:list){
										%>
											<option value="<%=d.getId()%>"><%=d.getFullName()  %>(<%=d.getSpecialty() %>)</option>
										<% 
									}
								%>
								
							</select>
						</div>
						
						<div class="col-md-12">
							<label>Full Address</label>
							<textarea required name="address" class="form-control" rows="3" cols=></textarea>
						</div>
						
						<c:if test="${empty userObj }">
							<a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
						</c:if>
						<c:if test="${not empty userObj }">
							<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
						</c:if>
					</form>
				</div>
			
			</div>
		</div>
	
	 </div>
</div>
</body>
</html>