package com.hardware.shop.dao;

import java.util.Collection;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.hardware.shop.model.Product;

@Repository
public class ProductDAO {
	
	@PersistenceContext
	EntityManager entityManager;
	
	public Collection<Product> getAllProduct(){
		
		try {
			
			return entityManager.createQuery("From Product", Product.class).getResultList();
			
		} catch(Exception e) {
			
			throw new RuntimeException(e);
		}
	}

}
