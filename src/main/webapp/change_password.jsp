<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Set New Password</title>
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
<div class="container p-5">
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card paint-card">
				<p class="text-center fs-3">Change Password</p>
				<c:if test="${not empty sucMsg }">
						<p class="text-center text-success fs-3">${sucMsg}</p>
						<c:remove var="sucMsg" scope="session"/>
					</c:if>
					<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger fs-5">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session"/> 
				</c:if>
				
				<div class="card-body">
				<form action="userChangePassword" method="post">
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
					<input type="hidden" value="${userObj.id }" name="uid">
					<button class="btn btn-success col-md-12">Confirm</button>
				</form>
				</div>
			</div>
		</div>
	</div>
</div>
				
</body>
</html>