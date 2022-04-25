package com.bloggersden.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bloggersden.dao.UserDao;
import com.bloggersden.entities.Message;
import com.bloggersden.entities.User;
import com.bloggersden.helper.ConnectionProvider;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		String userEmail = request.getParameter("loginEmail");
		String userPassword = request.getParameter("loginPassword");

		UserDao userDao = new UserDao(ConnectionProvider.getConnection());

		User user = userDao.getUserByEmailPassword(userEmail, userPassword);

		if (user == null) {
			Message message = new Message("Invalid email or password! Try again...", "error", "alert-danger");
			response.sendRedirect("loginpage.jsp");
			session.setAttribute("message", message);
		} else {
			System.out.println(user.getUserEmail());
			session.setAttribute("currentUser", user);
			response.sendRedirect("profile.jsp");
		}
	}

}
