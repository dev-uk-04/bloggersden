package com.bloggersden.dao;

import java.sql.*;
import java.util.ArrayList;

import com.bloggersden.entities.Category;

public class PostDao {
	
	Connection connection;
	
	private static final String categoryQuery = "SELECT * FROM CATEGORIES";
	
	public PostDao(Connection connection) {
		this.connection = connection;
	}
	
	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> categoryList = new ArrayList<>();
		
		try {
			Statement statement = this.connection.createStatement();
			ResultSet resultSet = statement.executeQuery(categoryQuery);
			
			while(resultSet.next()) {
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
}
