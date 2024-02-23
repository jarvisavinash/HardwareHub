package com.hardware.shop.model;

import java.time.LocalDate;
import java.util.Date;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="paymentInfo")
public class PaymentInfo {
	
	@Id
	private String paymentId;
	private LocalDate paymentDate;
	private String orderId;
	private long cardNumber;
	private Date cardExpiryDate;
	private int cardCVV;
	private String cardHolderName;
	private int amount;
	
	public PaymentInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PaymentInfo(String paymentId, LocalDate paymentDate, String orderId, long cardNumber, Date cardExpiryDate, 
			int cardCVV, String cardHolderName, int amount) {
		super();
		this.paymentId = paymentId;
		this.paymentDate = paymentDate;
		this.orderId = orderId;
		this.cardNumber = cardNumber;
		this.cardExpiryDate = cardExpiryDate;
		this.cardCVV = cardCVV;
		this.cardHolderName = cardHolderName;
		this.amount = amount;
	}

	public String getPaymentId() {
		return paymentId;
	}

	public void setPaymentId(String paymentId) {
		this.paymentId = paymentId;
	}

	public LocalDate getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(LocalDate paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public long getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(long cardNumber) {
		this.cardNumber = cardNumber;
	}

	public Date getCardExpiryDate() {
		return cardExpiryDate;
	}

	public void setCardExpiryDate(Date cardExpiryDate) {
		this.cardExpiryDate = cardExpiryDate;
	}

	public int getCardCVV() {
		return cardCVV;
	}

	public void setCardCVV(int cardCVV) {
		this.cardCVV = cardCVV;
	}

	public String getCardHolderName() {
		return cardHolderName;
	}

	public void setCardHolderName(String cardHolderName) {
		this.cardHolderName = cardHolderName;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "Payment [paymentId=" + paymentId + ", cardNumber=" + cardNumber + ", cardExpiryDate=" + cardExpiryDate
				+ ", cardCVV=" + cardCVV + ", cardHolderName=" + cardHolderName + "]";
	}
	
}
