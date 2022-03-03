package com.stephenlee.icecream;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.stripe.Stripe;

@SpringBootApplication
public class IcecreamApplication {

	public static void main(String[] args) {
		SpringApplication.run(IcecreamApplication.class, args);
	}
}
