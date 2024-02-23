package com.hardware.shop.dao;

import java.util.Collection;



import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import org.springframework.stereotype.Repository;

import com.hardware.shop.model.Category;


@Repository
public class CategoryDAO {

	@PersistenceContext
	EntityManager entityManager;
	
	public Collection<Category> getAllCategories(){
		
		try {
			
			return entityManager.createQuery("From Category", Category.class).getResultList();
			
		} catch (Exception e) {
			
			throw new RuntimeException(e);
		}
		
	}
	
	@Transactional
	public void addCategory(Category category){
		try {
			entityManager.persist(category);
		}
		catch (Exception e) 
		{
			throw new RuntimeException(e);
		}
	}
	
}
