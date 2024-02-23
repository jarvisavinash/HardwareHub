package com.hardware.shop.dao;

import com.hardware.shop.model.*;

import java.time.LocalDate;
import java.util.Collection;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class OrdersDAO {
	
	static String ordId;

	@Autowired
	EntityManager entityManager;
	
	public Collection<Orders> getAllOrderDetails(){
		
		try {
			
			return entityManager.createQuery("From Orders", Orders.class).getResultList();
			
		} catch(Exception e) {
			
			throw new RuntimeException(e);
		}
	}
	
	@Transactional
	public void saveOrdersDetails(Orders orders){
		try {

			
			Counters counterOrderId = entityManager.find(Counters.class, "order");
			 
			String OrderId = counterOrderId.getIntitialValue() + counterOrderId.nextValue();
			ordId = OrderId;
			
			LocalDate today = LocalDate.now();
			LocalDate orderDate = today.plusDays(+0);
			LocalDate DeliveryDate = today.plusDays(+10);
			
			
			orders.setOrderId(OrderId);
			orders.setOrderDate(orderDate);
			orders.setDeliveryDate(DeliveryDate);
			orders.setCustomerId(orders.getCustomerId());
			orders.setQuantity(orders.getQuantity());
			
			System.out.println("Order = [orderId = " + OrderId + " orderDate = " + orderDate + " deliveryDate = " + DeliveryDate + 
			" customerId = " + orders.getCustomerId() + " productId = " + orders.getProductId() + " quantity =" + orders.getQuantity() + "]");
			
			entityManager.persist(orders);
			
		}
		catch (Exception e) 
		{
			throw new RuntimeException(e);
		}
	}
	
}
