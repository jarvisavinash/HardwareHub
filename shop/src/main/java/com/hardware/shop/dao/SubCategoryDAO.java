package com.hardware.shop.dao;

import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

import com.hardware.shop.model.SubCategory;

@Repository
public class SubCategoryDAO {

	@PersistenceContext
	EntityManager entityManager;
	
	public Collection<SubCategory> getAllSubCategories(){
		
		try {
			
			return entityManager.createQuery("From SubCategory", SubCategory.class).getResultList();
			
		} catch (Exception e) {
			
			throw new RuntimeException(e);
		}
		
	}
	
	@Transactional
	public void addSubCategory(SubCategory subCategory){
		try {
			entityManager.persist(subCategory);
		}
		catch (Exception e) 
		{
			throw new RuntimeException(e);
		}
	}
}
