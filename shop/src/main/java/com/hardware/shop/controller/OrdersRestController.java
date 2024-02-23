package com.hardware.shop.controller;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hardware.shop.dao.OrdersDAO;
import com.hardware.shop.model.Orders;


@RestController
@CrossOrigin
@RequestMapping("/order")
public class OrdersRestController {

	@Autowired
	OrdersDAO ordersDAO;
	
	@GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
	public Collection<Orders> getAllOrderDetails(){
		
		return ordersDAO.getAllOrderDetails();
		
	}
	
	@PostMapping(value="/save", consumes = MediaType.APPLICATION_JSON_VALUE)
	public void saveOrdersDetails(@RequestBody Orders orders) {
		
//		System.out.println(orders);
		ordersDAO.saveOrdersDetails(orders);
	}
}
