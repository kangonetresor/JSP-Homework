package com.lakop225.servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String login = request.getParameter("login");
	    String password = request.getParameter("password");
	    String name = request.getParameter("name");

	    if ("Lakop21".equals(login) && "SITW".equals(password)) {
	        request.setAttribute("name", name);
	        request.getRequestDispatcher("game.jsp").forward(request, response);
	    } else {
	        response.sendRedirect("login.jsp?error=invalid");
	    }
	}

}
