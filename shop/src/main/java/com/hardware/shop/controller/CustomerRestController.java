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
import com.hardware.shop.dao.CustomerDAO;
import com.hardware.shop.model.Customer;



@RestController
@CrossOrigin
@RequestMapping("/customer")
public class CustomerRestController {

	@Autowired
	CustomerDAO customerDAO;
	
	@GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
	public Collection<Customer> getAllCustomers(){
		
		return customerDAO.getAllCustomers();
		
	}
	
	@PostMapping(value="/save", consumes = MediaType.APPLICATION_JSON_VALUE)
	public void registerCustomer(@RequestBody Customer customer) {
		
		System.out.println(customer);
		customerDAO.registerCustomer(customer);
	}
	
	@PostMapping(value="/login", consumes = MediaType.APPLICATION_JSON_VALUE)
	public  Collection<Customer> loginCustomer(@RequestBody Customer cust)
	{
		
		System.out.println(cust);
		 return customerDAO.loginCustomer(cust);
	}

	
}
