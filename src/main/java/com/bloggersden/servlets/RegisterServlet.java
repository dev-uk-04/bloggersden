package com.bloggersden.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bloggersden.dao.UserDao;
import com.bloggersden.entities.Message;
import com.bloggersden.entities.User;
import com.bloggersden.helper.ConnectionProvider;

@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String checked = request.getParameter("checkBox");

		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		if (checked == null) {

			out.println("Error: Checkbox is not checked");

		} else {

			// Fetch details from Register form
			String name = request.getParameter("userName");
			String email = request.getParameter("userEmail");
			String password = request.getParameter("userPassword");
			String gender = request.getParameter("userGender");

			// Pass the data to UserDao

			User user = new User(name, email, password, gender);
			
			UserDao userDao = new UserDao(ConnectionProvider.getConnection());
			
			if (userDao.getUserAvailability(email))
			{
				out.println("Email ID already exists! Please use different one");
			} else {
				if (userDao.saveUser(user)) {
					out.println("User Saved");
				} else {
					out.println("User not saved");
				}
			}
			
		}
	}

}
