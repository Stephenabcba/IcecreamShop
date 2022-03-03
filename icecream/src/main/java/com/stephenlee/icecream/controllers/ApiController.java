package com.stephenlee.icecream.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.stephenlee.icecream.models.Cart;
import com.stephenlee.icecream.services.MainService;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import com.stripe.param.PaymentIntentCreateParams;

@RestController
public class ApiController {
	private static Gson gson = new Gson();
	
	@Autowired
	MainService mainService;

	static class CreatePaymentResponse {
		private String clientSecret;

		public CreatePaymentResponse(String clientSecret) {
			this.clientSecret = clientSecret;
		}
	}
	
	@PostMapping("/createPaymentIntent")
	public String createPaymentIntent(HttpSession session) {
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			return null;
		}
		Double total = cart.getTotalPrice() * 100;
		Stripe.apiKey = mainService.getApiKey("STRIPE_API_KEY");
		PaymentIntentCreateParams params = PaymentIntentCreateParams.builder().setAmount(Math.round(total))
				.setCurrency("usd").setAutomaticPaymentMethods(
						PaymentIntentCreateParams.AutomaticPaymentMethods.builder().setEnabled(true).build())
				.build();
		try {
			PaymentIntent paymentIntent = PaymentIntent.create(params);
			CreatePaymentResponse paymentResponse = new CreatePaymentResponse(paymentIntent.getClientSecret());
			return gson.toJson(paymentResponse);
		} catch (StripeException e) {

		}
		return null;
	}
}
