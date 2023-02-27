package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialtyDao;
import com.db.DBConnect;
import com.entity.User;

@WebServlet("/addSpecialty")
public class AddSpecialty extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String specName = req.getParameter("specName");
		
		SpecialtyDao dao = new SpecialtyDao(DBConnect.getConn());
		boolean f= dao.addSpecialty(specName);
		
		HttpSession session  = req.getSession();
		if(f) {
			session.setAttribute("sucMsg", "Specialty Added");
			resp.sendRedirect("admin/index.jsp");
		} else {
			session.setAttribute("errorMsg", "Something Went Wrong");
			resp.sendRedirect("admin/index.jsp");
		}
	}

}
