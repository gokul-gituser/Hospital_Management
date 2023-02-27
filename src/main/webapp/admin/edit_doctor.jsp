<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Doctor"%>
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
<title>Edit Doctor Details</title>
<%@include file="../component/css.jsp" %>

<style type="text/css">
	.paint-card{
		box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
	}

	
	</style>
</head>
<body>
<%@include file="navbar.jsp" %>
<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card paint-card">
				<div class="card-body">
					<p class="fs-3 text-center">Update Details</p>
						<c:if test="${not empty sucMsg }">
							<p class="text-center text-success fs-3">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session"/>
						</c:if>
						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session"/> 
						</c:if>
						
						<% 
							int id = Integer.parseInt(request.getParameter("id"));
							DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
							Doctor d= dao2.getDoctorById(id);
						%>
						
						<form action="../updateDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label>
								<input type="text" required name="fullname" class="form-control" value="<%=d.getFullName() %>">
							</div>
							<div class="mb-3">
								<label class="form-label">Date of Birth</label>
								<input type="date" required name="dob" class="form-control" value="<%=d.getDob() %>">
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification</label>
								<input type="text" required name="qual" class="form-control" value="<%=d.getQualification() %>">
							</div>
							<div class="mb-3">
								<label class="form-label">Specialization</label>
								<select required name="spec" class="form-control">
									<option><%=d.getSpecialty() %></option>
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
								<input type="email" required name="email" class="form-control" value="<%=d.getEmail() %>">
							</div>
							<div class="mb-3">
								<label class="form-label">Contact Number</label>
								<input type="text"  required name="mobno" class="form-control" value="<%=d.getContactNo() %>">
							</div>
							<div class="mb-3">
								<label class="form-label">Password</label>
								<input type="text"  required name="password" class="form-control" value="<%=d.getPassword() %>">
							</div>
							
							<input type="hidden" name="id" value="<%=d.getId() %>">
							
							<Button type="submit" class="btn btn-primary col-md-12">Update</Button>
						
						</form>
				</div>
			
			</div>
		</div>
		
	</div>

</div>

</body>
</html>