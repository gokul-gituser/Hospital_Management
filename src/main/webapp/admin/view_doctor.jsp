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
<title>View All Doctors</title>
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
		
		<div class="col-md-12">
			<div class="card paint-card">
				<div class="card-body">
					<p class="fs-3 text-center">Doctor Details</p>
					
				<c:if test="${not empty sucMsg }">
							<p class="text-center text-success fs-3">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session"/>
				</c:if>
				<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session"/> 
				</c:if>
						
						
					<table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">Date of Birth</th>
							<th scope="col">Qualification</th>
							<th scope="col">Specialty</th>
							<th scope="col">Email</th>
							<th scope="col">Contact No</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
							<%
							DoctorDao dao2=new DoctorDao(DBConnect.getConn());
							List<Doctor> list2 = dao2.getAllDoctor();
							for(Doctor d:list2)
							{%>
							<tr>
								<td><%=d.getFullName() %></td>
								<td><%=d.getDob() %></td>
								<td><%=d.getQualification() %></td>
								<td><%=d.getSpecialty() %></td>
								<td><%=d.getEmail() %></td>
								<td><%=d.getContactNo() %></td>
								<td>
									<a href="edit_doctor.jsp?id=<%=d.getId() %>" class="btn btn-sm btn-primary">Edit</a>
									<a href="../deleteDoctor?id=<%=d.getId() %>" class="btn btn-sm btn-danger">Delete</a>
								</td>
							</tr>
							<%}
						%>
					</tbody>
					</table>
				</div>
			
			</div>
		
		</div>
	</div>

</div>

</body>
</html>