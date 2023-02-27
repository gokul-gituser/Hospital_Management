<%@page import="com.entity.Specialty"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialtyDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Your Profile</title>
<%@include file="../component/css.jsp" %>
<style type="text/css">
	.paint-card{
		box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
	}
	</style>
</head>
<body>
<c:if test="${empty docObj }">
		<c:redirect url="doctor_login.jsp"></c:redirect>
	</c:if>

<%@include file="navbar.jsp" %>
 
 <div class="container p-5">
	<div class="row">
		<div class="col-md-4 ">
			<div class="card paint-card">
				<p class="text-center fs-3 mt-4">Change Password</p>
				<c:if test="${not empty sucMsg }">
						<p class="text-center text-success fs-3">${sucMsg}</p>
						<c:remove var="sucMsg" scope="session"/>
					</c:if>
					<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger fs-5">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session"/> 
				</c:if>
				
				<div class="card-body">
				<form action="../docChangePassword" method="post">
				<div class="mb-3">
						<label>Enter Current Password</label>
						<input type="text" name="curPassword" class="form-control"
						required>
						
					</div>
					<div class="mb-3">
						<label>Enter New Password</label>
						<input type="text" name="newPassword" class="form-control"
						required>
					</div>
					<input type="hidden" value="${docObj.id }" name="did">
					<button class="btn btn-success col-md-12">Confirm</button>
				</form>
				</div>
			</div>
		</div>
		<div class="col-md-8">
			<div class="card paint-card">
				<div class="card-body">
					<form action="../doctorProfileUpdate" method="post">
					<p class="text-center fs-3">Edit Profile</p>
					<c:if test="${not empty sucMssg }">
						<p class="text-center text-success fs-3">${sucMssg}</p>
						<c:remove var="sucMssg" scope="session"/>
					</c:if>
					<c:if test="${not empty errorMssg }">
						<p class="text-center text-danger fs-5">${errorMssg}</p>
						<c:remove var="errorMssg" scope="session"/> 
				</c:if>
							<div class="mb-3">
								<label class="form-label">Full Name</label>
								<input type="text" value="${docObj.fullName }" required name="fullname" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Date of Birth</label>
								<input type="date" value="${docObj.dob }" required name="dob" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label>
								<input type="text" value="${docObj.qualification }" required name="qual" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialization</label>
								<select required name="spec" class="form-control">
									<option>${docObj.specialty }</option>
									<%SpecialtyDao dao= new SpecialtyDao(DBConnect.getConn());
									List<Specialty> list = dao.getAllSpecialty();
									for(Specialty s:list){%>
										<option><%=s.getSName() %></option>
									<%}
									
									%>
									
									
								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label>
								<input type="email" value="${docObj.email }" required readonly name="email" class="bg-secondary form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Contact Number</label>
								<input type="text" value="${docObj.contactNo }"  required name="mobno" class="form-control">
							</div>
							
							<input type="hidden" name="id" value="${docObj.id }">
							<Button type="submit" class="btn btn-primary col-md-12">Update</Button>
						
						</form>
				</div>
			</div>
		
		</div>
	</div>
</div>
 
</body>
</html>