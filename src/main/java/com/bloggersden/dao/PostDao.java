package com.bloggersden.dao;

import java.sql.*;
import java.util.ArrayList;

import com.bloggersden.entities.Category;
import com.bloggersden.entities.Post;

public class PostDao {

	Connection connection;

	private static final String categoryQuery = "SELECT * FROM CATEGORIES";
	private static final String insertPostQuery = "INSERT INTO POSTS (POST_TITLE, POST_CONTENT, POST_CODE, POST_PIC, CATEGORY_ID, USER_ID) "
												+ "VALUES (?, ?, ?, ?, ?, ?)";

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

		}
		return posted;
	}
}
