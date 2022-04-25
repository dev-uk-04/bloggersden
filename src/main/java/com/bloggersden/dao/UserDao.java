package com.bloggersden.dao;

import java.sql.*;

import com.bloggersden.entities.User;

public class UserDao {

	private Connection connection;

	private static final String userInsertQuery = "INSERT INTO USER (NAME, EMAIL, PASSWORD, GENDER)"
			+ "VALUES (?, ?, ?, ?)";

	private static final String findUserQuery = "SELECT * FROM USER WHERE EMAIL = ? AND PASSWORD = ?";
	
	private static final String userExistQuery = "SELECT COUNT(*) FROM USER WHERE EMAIL = ?";

	private static final String updateUserQuery = "UPDATE USER SET NAME=?, EMAIL=?, PASSWORD=?, PROFILE=? WHERE ID=?";
	
	private static final String userDetailsQuery = "SELECT * FROM USER WHERE ID = ?";

	public UserDao(Connection connection) {
		this.connection = connection;
	}

	public boolean saveUser(User user) {

		boolean opFlag = false;

		try {

			PreparedStatement prepStatement = this.connection.prepareStatement(userInsertQuery);
			prepStatement.setString(1, user.getUserName());
			prepStatement.setString(2, user.getUserEmail());
			prepStatement.setString(3, user.getUserPassword());
			prepStatement.setString(4, user.getUserGender());

			prepStatement.executeUpdate();
			opFlag = true;

		} catch (Exception e) {
			System.out.println("Failed to save user in database ! " + e.getMessage());
			e.printStackTrace();
		}

		return opFlag;
	}

	public boolean getUserAvailability(String email) {

		boolean userAvailable = false;

		try {
			PreparedStatement prepStatement = this.connection.prepareStatement(userExistQuery);
			prepStatement.setString(1, email);
			ResultSet resultSet = prepStatement.executeQuery();

			if (resultSet.next()) {
				userAvailable = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return userAvailable;
	}

	public User getUserByEmailPassword(String email, String password) {
		User user = null;

		try {

			PreparedStatement prepStatement = this.connection.prepareStatement(findUserQuery);
			prepStatement.setString(1, email);
			prepStatement.setString(2, password);
			ResultSet resultSet = prepStatement.executeQuery();

			if (resultSet.next()) {
				user = new User();
				user.setUserId(resultSet.getInt("id"));
				user.setUserName(resultSet.getString("name"));
				user.setUserEmail(resultSet.getString("email"));
				user.setUserPassword(resultSet.getString("password"));
				user.setUserGender(resultSet.getString("gender"));
				user.setUserProfile(resultSet.getString("profile"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	public boolean updateUser(User user) {

		boolean updateFlag = false;

		try {

			PreparedStatement psmt = this.connection.prepareStatement(updateUserQuery);
			psmt.setString(1, user.getUserName());
			psmt.setString(2, user.getUserEmail());
			psmt.setString(3, user.getUserPassword());
			psmt.setString(4, user.getUserProfile());
			psmt.setInt(5, user.getUserId());

			psmt.executeUpdate();
			updateFlag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return updateFlag;
	}
	
	public User getUserByUserId(int userId) {
		
		User user = null;
		
		try {
			PreparedStatement prepStatement = this.connection.prepareStatement(userDetailsQuery);
			prepStatement.setInt(1, userId);
			ResultSet resultSet = prepStatement.executeQuery();
			
			if (resultSet.next()) {
				user = new User();
				user.setUserId(resultSet.getInt("id"));
				user.setUserName(resultSet.getString("name"));
				user.setUserEmail(resultSet.getString("email"));
				user.setUserPassword(resultSet.getString("password"));
				user.setUserGender(resultSet.getString("gender"));
				user.setUserProfile(resultSet.getString("profile"));
			}
		} catch (Exception e) {
			e.printStackTrace();			
		}
		
		return user;
	}

}
