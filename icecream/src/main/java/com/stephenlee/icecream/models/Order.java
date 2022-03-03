package com.stephenlee.icecream.models;

import java.util.ArrayList;

public class Order {
	private Long id;
	private Flavor flavor;
	private ArrayList<Topping> toppings;
	private Double price;
	
	public Order() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Flavor getFlavor() {
		return flavor;
	}

	public void setFlavor(Flavor flavor) {
		this.flavor = flavor;
	}

	public ArrayList<Topping> getToppings() {
		return toppings;
	}

	public void setToppings(ArrayList<Topping> toppings) {
		this.toppings = toppings;
	};
	
	public Double getPrice() {
		Double price = 0.0;
		price += flavor.getPrice();
		for (Topping topping:this.toppings) {
			price += topping.getPrice();
		}
		return price;
	}
	
	
	
}
