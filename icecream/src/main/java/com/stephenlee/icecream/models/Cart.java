package com.stephenlee.icecream.models;

import java.util.ArrayList;

public class Cart {
	private ArrayList<Order> orders;
	private Double subTotal;
	private Double tax;
	private Double deliveryFee;
	private Double totalPrice;
	
	public Cart() {
		this.orders = new ArrayList<Order>();
		this.deliveryFee = 1.0;
	}

	public ArrayList<Order> getOrders() {
		return orders;
	}

	public void setOrders(ArrayList<Order> orders) {
		this.orders = orders;
	}
	
	public Double getSubTotal() {
		Double subTotal = 0.0;
		for (Order order:this.orders) {
			subTotal += order.getPrice();
		}
		return subTotal;
	}
	
	public Double getTax() {
		return this.getSubTotal() * 0.1;
	}

	public Double getDeliveryFee() {
		return deliveryFee;
	}

	public void setDeliveryFee(Double deliveryFee) {
		this.deliveryFee = deliveryFee;
	}
	
	public Double getTotalPrice() {
		return this.getSubTotal() + this.getTax() + this.getDeliveryFee();
	}
	
	
}
