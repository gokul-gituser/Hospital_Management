<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<nav class="navbar navbar-expand-lg bg-warning-subtle">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-hospital"></i>ABC HEALTHCARE</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
       <c:if test="${empty userObj }">
       	 <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="admin_login.jsp">Admin</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="doctor_login.jsp">Doctor</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="appointment.jsp">Appointment</a>
        </li>
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="user_login.jsp">Patient</a>
        </li>
       </c:if>
        
        <c:if test="${not empty userObj }">
        	 <li class="nav-item">
         	 <a class="nav-link active" aria-current="page" href="appointment.jsp">New Appointment</a>
        	</li>
        
        	 <li class="nav-item">
         	 <a class="nav-link active" aria-current="page" href="view_appointment.jsp">View Appointment</a>
        	</li>
        	
        	<div class="dropdown">
  				<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
    				<i class="fa-solid fa-circle-user"></i> ${userObj.fullName}
  				</button>
				  <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
				    <li><a class="dropdown-item" href="change_password.jsp">Change Password</a></li>
				    <li><a class="dropdown-item" href="userLogout">Log Out</a></li>
				   
				  </ul>
			</div>
        
        	
        
        </c:if>
      
        
      </ul>
      
    </div>
  </div>
</nav>