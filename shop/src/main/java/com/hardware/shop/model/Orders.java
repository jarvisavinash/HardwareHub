package com.hardware.shop.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SecondaryTable;
import javax.persistence.Table;



@Entity
@Table(name="orders")
@SecondaryTable(name = "orderDetails", pkJoinColumns = @PrimaryKeyJoinColumn(name = "orderId"))
public class Orders {

	@Id
	@Column(name = "orderId")
	private String orderId;
	
	@Column(name = "orderDate")
	private LocalDate orderDate;
	
	@Column(name = "deliveryDate")
	private  LocalDate deliveryDate;
	
	@Column(name = "customerId")
	private String customerId;
	
	@Column(name = "productId",  table = "orderDetails")
	private String productId;
	
	@Column(name = "quantity", table = "orderDetails")
	private int quantity;

	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Orders(String orderId, LocalDate orderDate, LocalDate deliveryDate, String customerId, String productId,
			int quantity) {
		super();
		this.orderId = orderId;
		this.orderDate = orderDate;
		this.deliveryDate = deliveryDate;
		this.customerId = customerId;
		this.productId = productId;
		this.quantity = quantity;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public LocalDate getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(LocalDate today) {
		this.orderDate = today;
	}

	public LocalDate getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(LocalDate deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "Orders [orderId=" + orderId + ", orderDate=" + orderDate + ", deliveryDate=" + deliveryDate
				+ ", customerId=" + customerId + ", productId=" + productId + ", quantity=" + quantity + "]";
	}
	
}
