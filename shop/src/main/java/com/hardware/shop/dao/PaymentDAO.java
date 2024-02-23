package com.hardware.shop.dao;

import java.time.LocalDate;

import java.util.Collection;


import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hardware.shop.model.Counters;
import com.hardware.shop.model.PaymentInfo;

@Repository
public class PaymentDAO {

	@Autowired
	EntityManager entityManager;
	
	public Collection<PaymentInfo> getAllPaymentDetails(){
		
		try {
			
			return entityManager.createQuery("From Payment", PaymentInfo.class).getResultList();
			
		} catch(Exception e) {
			
			throw new RuntimeException(e);
		}
	}
	
	@Transactional
	public void savePaymentDetails(PaymentInfo payment){
		try {
			
			Counters counterPaymentId = entityManager.find(Counters.class,"payment");			
			 
			String PaymentId = counterPaymentId.getIntitialValue() + counterPaymentId.nextValue();	
			
			LocalDate today = LocalDate.now();
			LocalDate paymentDate = today.plusDays(+0);
			
			OrdersDAO ordersDAO = new OrdersDAO();
			
		
			payment.setPaymentId(PaymentId);
			payment.setPaymentDate(paymentDate);
			payment.setOrderId(OrdersDAO.ordId);
			payment.setCardCVV(payment.getCardCVV());
			payment.setCardExpiryDate(payment.getCardExpiryDate());
			payment.setCardHolderName(payment.getCardHolderName());
			payment.setCardNumber(payment.getCardNumber());
			payment.setAmount(payment.getAmount());

			System.out.println("PaymentInfo = [paymentId = " + PaymentId + " cardNumber = " + payment.getCardNumber() + 
			" cardCVV = " +  payment.getCardCVV() + " cardExpiryDate = " + payment.getCardExpiryDate() +
			" cardHolderName = " + payment.getCardHolderName() + "]");
			
			entityManager.persist(payment);

		}
		catch (Exception e) 
		{
			throw new RuntimeException(e);
		}
	}
	
}
