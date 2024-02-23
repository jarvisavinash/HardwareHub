package com.hardware.shop.dao;

import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.hardware.shop.model.AllCategoriesInfo;


@Repository
public class AllCategoriesInfoDAO {
	
	@PersistenceContext
	EntityManager entityManager;
	
	public Collection<AllCategoriesInfo> getAllCategoriesInfo(){
		
		try {
			
			return entityManager.createQuery("From AllCategoriesInfo", AllCategoriesInfo.class).getResultList();
			
		} catch (Exception e) {
			
			throw new RuntimeException(e);
		}
		
	}
	

}
