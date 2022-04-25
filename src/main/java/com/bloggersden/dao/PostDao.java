package com.bloggersden.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.bloggersden.entities.Category;
import com.bloggersden.entities.Post;

public class PostDao {

	Connection connection;

	private static final String categoryQuery = "SELECT * FROM CATEGORIES";
	private static final String insertPostQuery = "INSERT INTO POSTS (POST_TITLE, POST_CONTENT, POST_CODE, POST_PIC, CATEGORY_ID, USER_ID) "
			+ "VALUES (?, ?, ?, ?, ?, ?)";
	private static final String allPostQuery = "SELECT * FROM POSTS";
	private static final String postByCategoryQuery = "SELECT * FROM POSTS WHERE CATEGORY_ID = ?";
	private static final String postByPostIdQuery = "SELECT * FROM POSTS WHERE POST_ID = ?";

	public PostDao(Connection connection) {
		this.connection = connection;
	}

	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> categoryList = new ArrayList<>();

		try {
			Statement statement = this.connection.createStatement();
			ResultSet resultSet = statement.executeQuery(categoryQuery);

			while (resultSet.next()) {
				int catId = resultSet.getInt("category_id");
				String catName = resultSet.getString("category_name");
				String catDesc = resultSet.getString("description");

				Category category = new Category(catId, catName, catDesc);
				categoryList.add(category);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return categoryList;
	}

	public boolean savePost(Post post) {

		boolean posted = false;

		try {

			PreparedStatement prepStatement = connection.prepareStatement(insertPostQuery);
			prepStatement.setString(1, post.getPostTitle());
			prepStatement.setString(2, post.getPostContent());
			prepStatement.setString(3, post.getPostCode());
			prepStatement.setString(4, post.getPostPic());
			prepStatement.setInt(5, post.getCategoryId());
			prepStatement.setInt(6, post.getUserId());

			prepStatement.executeUpdate();
			posted = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return posted;
	}

	public List<Post> getAllPosts() {

		List<Post> posts = new ArrayList<>();

		// Fetch all posts
		try {

			PreparedStatement prepStatement = connection.prepareStatement(allPostQuery);
			ResultSet resultSet = prepStatement.executeQuery();

			while (resultSet.next()) {

				int postId = resultSet.getInt("post_id");
				String postTitle = resultSet.getString("post_title");
				String postContent = resultSet.getString("post_content");
				String postCode = resultSet.getString("post_code");
				String postPic = resultSet.getString("post_pic");
				Timestamp postdate = resultSet.getTimestamp("post_date");
				int cId = resultSet.getInt("category_id");
				int uId = resultSet.getInt("user_id");

				Post post = new Post(postId, postTitle, postContent, postCode, postPic, postdate, cId, uId);
				posts.add(post);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return posts;
	}

	public List<Post> getPostByCategory(int catId) {

		List<Post> postByCatId = new ArrayList<>();

		// Fetch posts by Category ID
		try {

			PreparedStatement prepStatement = connection.prepareStatement(postByCategoryQuery);
			prepStatement.setInt(1, catId);
			ResultSet resultSet = prepStatement.executeQuery();

			while (resultSet.next()) {

				int postId = resultSet.getInt("post_id");
				String postTitle = resultSet.getString("post_title");
				String postContent = resultSet.getString("post_content");
				String postCode = resultSet.getString("post_code");
				String postPic = resultSet.getString("post_pic");
				Timestamp postdate = resultSet.getTimestamp("post_date");
				int cId = resultSet.getInt("category_id");
				int uId = resultSet.getInt("user_id");

				Post post = new Post(postId, postTitle, postContent, postCode, postPic, postdate, cId, uId);
				postByCatId.add(post);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return postByCatId;
	}
	
	public Post getPostByPostId(int postId) {
		
		Post post = null;
		
		try {
			PreparedStatement prepStatement = this.connection.prepareStatement(postByPostIdQuery);
			prepStatement.setInt(1, postId);
			ResultSet resultSet = prepStatement.executeQuery();
			
			if (resultSet.next()) {
				int pId = resultSet.getInt("post_id");
				String postTitle = resultSet.getString("post_title");
				String postContent = resultSet.getString("post_content");
				String postCode = resultSet.getString("post_code");
				String postPic = resultSet.getString("post_pic");
				Timestamp postdate = resultSet.getTimestamp("post_date");
				int cId = resultSet.getInt("category_id");
				int uId = resultSet.getInt("user_id");
				
				post = new Post(pId, postTitle, postContent, postCode, postPic, postdate, cId, uId);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return post;
	}
}
