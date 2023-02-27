
<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Your Appointments</title>
<%@include file="../component/css.jsp" %>
<style type="text/css">
	.paint-card{
		box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
	}
	</style>
</head>
<body>
<c:if test="${empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>

 <%@include file="component/navbar.jsp" %>
 
 <div class="container p-3">
 	<div class="row">
 		<div class="col-md-8 offset-md-2">
 			<div class="card paint-card">
 				<p class="fs-4 fw-bold text-center text-success">Your Appointments</p>
 				<table class="table">
 					<thead>
 						<tr>
 							<th scope="col">Name</th>
 							<th scope="col">Age</th>
 							<th scope="col">Gender</th>
 							<th scope="col">Appointment Date</th>
 							<th scope="col">Reason for the Visit</th>
 							<th scope="col">Doctor</th>
 							<th scope="col">Status</th>
 						</tr>
 					</thead>
 					<tbody> <%
 						User user = (User) session.getAttribute("userObj");
 						AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
 						DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
 						List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
 						for(Appointment ap:list){
 						Doctor d = dao2.getDoctorById(ap.getDoctorId());
 							%>
 								<tr>
 									<th><%=ap.getFullName() %></th>
 									<td><%=ap.getAge() %></td>
 									<td><%=ap.getGender() %></td>
 									<td><%=ap.getAppointDate() %></td>
 									<td><%=ap.getDiseases() %></td>
 									<td><%=d.getFullName() %></td>
 									<td>
										<%if("Pending".equals(ap.getStatus())){%>
											<a href="" class="btn btn-sm btn-warning">Pending</a>
										<%
											
										}else{ %>
											
										<% 
											
										} %>
									</td>
 								</tr>
 							<%
 						}
 						%>
 					
 					
 						
 					</tbody>
 				</table>
 			</div>
 		</div>
 	
 	</div>
 
 </div>
</body>
</html>