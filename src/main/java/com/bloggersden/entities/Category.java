package com.bloggersden.entities;

public class Category {

	private int categoryId;
	private String categoryName;
	private String categoryDesciption;

	public Category() {

	}

	public Category(String categoryName, String categoryDesciption) {
		this.categoryName = categoryName;
		this.categoryDesciption = categoryDesciption;
	}

	public Category(int categoryId, String categoryName, String categoryDesciption) {
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.categoryDesciption = categoryDesciption;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryDesciption() {
		return categoryDesciption;
	}

	public void setCategoryDesciption(String categoryDesciption) {
		this.categoryDesciption = categoryDesciption;
	}

}
