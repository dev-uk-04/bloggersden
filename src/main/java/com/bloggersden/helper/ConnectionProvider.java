package com.bloggersden.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

	private static Connection conn;
	
	public static void main(String[] args) {
		Connection c = getConnection();
		System.out.println(c);
	} 

	public static Connection getConnection() {

		if (conn == null) {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bloggersden", "root", "root");

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return conn;

	}
}
