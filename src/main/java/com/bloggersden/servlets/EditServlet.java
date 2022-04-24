package com.bloggersden.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.bloggersden.dao.UserDao;
import com.bloggersden.entities.Message;
import com.bloggersden.entities.User;
import com.bloggersden.helper.ConnectionProvider;
import com.bloggersden.helper.Helper;

@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		String editName = request.getParameter("editName");
		String editEmail = request.getParameter("editEmail");
		String editPassword = request.getParameter("editPassword");
		Part part = request.getPart("image");
		String imageName = part.getSubmittedFileName();

		// get user from session

		HttpSession session = request.getSession();
		User loggedUser = (User) session.getAttribute("currentUser");
		loggedUser.setUserName(editName);
		loggedUser.setUserEmail(editEmail);
		loggedUser.setUserPassword(editPassword);
		
		if (imageName.equals("")) {
			loggedUser.setUserProfile(loggedUser.getUserProfile());
		} else {
			loggedUser.setUserProfile(imageName);
		}
		

		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
		boolean userUpdate = userDao.updateUser(loggedUser);

		if (userUpdate) {

			String path = request.getRealPath("/") + "pics" + File.separator + loggedUser.getUserProfile();
			
//			Helper.deleteFile(path);

			if (Helper.saveFile(part.getInputStream(), path)) {
				Message message = new Message("Profile Updated.", "success", "alert-success");
				session.setAttribute("message", message);
			} else {
				Message message = new Message("Something went wrong!", "error", "alert-danger");
				session.setAttribute("message", message);
			}
			
			response.sendRedirect("index.jsp");

		} else {
			out.println("Not updated...");
		}

	}

}
