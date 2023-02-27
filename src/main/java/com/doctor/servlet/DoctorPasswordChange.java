package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.dao.UserDao;
import com.db.DBConnect;

@WebServlet("/docChangePassword")
public class DoctorPasswordChange extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int did = Integer.parseInt(req.getParameter("did"));
		String oldPassword = req.getParameter("curPassword");
		String newPassword = req.getParameter("newPassword");
		
		DoctorDao dao= new DoctorDao(DBConnect.getConn());
		HttpSession session = req.getSession();
		
		if(dao.checkOldPassword(did, oldPassword)) {
			if(dao.changePassword(did, newPassword)) {
				session.setAttribute("sucMsg", "Password Changed");
				resp.sendRedirect("doctor/edit_profile.jsp");
			}else {
				session.setAttribute("errorMsg", "Something Went Wrong");
				resp.sendRedirect("doctor/edit_profile.jsp");
			}
		}else {
			session.setAttribute("errorMsg", "Current Password Incorrect");
			resp.sendRedirect("doctor/edit_profile.jsp");
		}
		
	}
}
