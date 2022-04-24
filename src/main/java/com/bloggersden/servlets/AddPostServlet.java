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

import com.bloggersden.dao.PostDao;
import com.bloggersden.entities.Post;
import com.bloggersden.entities.User;
import com.bloggersden.helper.ConnectionProvider;
import com.bloggersden.helper.Helper;

@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
//		System.out.println(Integer.parseInt(request.getParameter("catId")));
		int catId = Integer.parseInt(request.getParameter("catId"));
		String postTitle = request.getParameter("postTitle");
//		System.out.println(postTitle);
		String postContent = request.getParameter("postContent");
//		System.out.println(postContent);
		String postCode = request.getParameter("postCode");
//		System.out.println(postCode);
		Part part = request.getPart("postPic");
		
		User user = (User) session.getAttribute("currentUser");
		
		Post post = new Post(postTitle, postContent, postCode, part.getSubmittedFileName(), null, catId, user.getUserId());
		
		PostDao postDao = new PostDao(ConnectionProvider.getConnection());
		
		if (postDao.savePost(post)) {
			String path = request.getRealPath("/") + "blogpics" + File.separator + part.getSubmittedFileName();
			Helper.saveFile(part.getInputStream(), path);
			out.println("saved");
		} else {
			out.println("not saved");
		}
	}

}
