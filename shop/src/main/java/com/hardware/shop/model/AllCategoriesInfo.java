package com.hardware.shop.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="allCategoriesInfo")
public class AllCategoriesInfo {

	private int subCategoryId;
	private String subCategoryName;
	private String categoryName;
	private String imagePath;
	private int categoryId;
	
	public AllCategoriesInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AllCategoriesInfo(int subCategoryId, String subCategoryName, String categoryName, String imagePath,
			int categoryId) {
		super();
		this.subCategoryId = subCategoryId;
		this.subCategoryName = subCategoryName;
		this.categoryName = categoryName;
		this.imagePath = imagePath;
		this.categoryId = categoryId;
	}
	
	@Id
	public int getSubCategoryId() {
		return subCategoryId;
	}
	
	public void setSubCategoryId(int subCategoryId) {
		this.subCategoryId = subCategoryId;
	}
	
	public String getSubCategoryName() {
		return subCategoryName;
	}
	
	public void setSubCategoryName(String subCategoryName) {
		this.subCategoryName = subCategoryName;
	}
	
	public String getCategoryName() {
		return categoryName;
	}
	
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	public int getCategoryId() {
		return categoryId;
	}
	
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	
	@Override
	public String toString() {
		return "AllCategoriesInfo [subCategoryId=" + subCategoryId + ", subCategoryName=" + subCategoryName
				+ ", categoryName=" + categoryName + ", imagePath=" + imagePath + ", categoryId=" + categoryId + "]";
	}
}
