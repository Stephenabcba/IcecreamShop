package com.stephenlee.icecream.controllers;



import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.stephenlee.icecream.models.Cart;
import com.stephenlee.icecream.models.Flavor;
import com.stephenlee.icecream.models.Order;
import com.stephenlee.icecream.models.Topping;
import com.stephenlee.icecream.services.FlavorService;
import com.stephenlee.icecream.services.MainService;
import com.stephenlee.icecream.services.ToppingService;

@Controller
public class IcecreamController {

	@Autowired
	private FlavorService flavorService;

	@Autowired
	private ToppingService toppingService;
	
	@Autowired
	private MainService mainService;

	@GetMapping("/")
	public String allIcecreams(Model model) {
		model.addAttribute("flavors", flavorService.allFlavors());
		return "allIcecreams.jsp";
	}

	@GetMapping("/prototype")
	public String allIcecreamsPrototype() {
		return "allIcecreamsPrototype.jsp";
	}

	@GetMapping("/boot")
	public String allIcecreamsBoot() {
		return "allIcecreamsBootstrap.jsp";
	}

	@GetMapping("/icecreams/{id}")
	public String oneIcecream(@PathVariable("id") Long id, Model model, @ModelAttribute("order") Order order) {
		Flavor flavor = flavorService.findFlavor(id);
		if (flavor == null) {
			return "redirect:/";
		}
		model.addAttribute("flavor", flavor);
		model.addAttribute("allToppings", toppingService.allToppings());
		return "oneIcecream.jsp";
	}

	@PostMapping("/icecreams/addToCartNB")
	public String addToCart(@RequestParam("flavor") Long flavorId, HttpSession session) {
		Flavor flavor = flavorService.findFlavor(flavorId);
		if (flavor == null) {
			return "redirect:/icecreams/" + flavorId.toString();
		}
		Order order = new Order();
		order.setFlavor(flavor);
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
		}
		cart.getOrders().add(order);
		session.setAttribute("cart", cart);
		return "redirect:/";
	}

	@PostMapping("/icecreams/addToCart")
	public String addToCart(HttpSession session, @ModelAttribute("order") Order order) {
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
		}
		ArrayList<Order> cartOrders = cart.getOrders();
		if (cartOrders.isEmpty()) {
			order.setId(Long.valueOf(0));
		} else {
			Long orderId = cartOrders.get(cartOrders.size() - 1).getId() + 1;
			order.setId(orderId);
		}
		cart.getOrders().add(order);
		session.setAttribute("cart", cart);
		return "redirect:/";
	}

	@GetMapping("/icecreams/showOnePrototype")
	public String oneIcecreamPrototype() {
		return "oneIcecreamPrototype.jsp";
	}

	@GetMapping("/cart")
	public String cart() {
		return "cart.jsp";
	}

	@GetMapping("/checkout")
	public String checkout(Model model) {
		return "checkout.jsp";
	}

	@GetMapping("/flavors/new")
	public String newFlavorForm(@ModelAttribute("flavor") Flavor flavor) {
		return "newFlavor.jsp";
	}

	@PostMapping("/flavors/new")
	public String createFlavor(@RequestParam("image") MultipartFile multipartFile,
			@Valid @ModelAttribute("flavor") Flavor flavor, BindingResult result) {
		flavorService.createFlavor(flavor, multipartFile, result);
		if (result.hasErrors()) {
			return "newFlavor.jsp";
		}
		return "redirect:/flavors/new";
	}

	@GetMapping("/toppings/new")
	public String newToppingForm(@ModelAttribute("topping") Topping topping) {
		return "newTopping.jsp";
	}

	@PostMapping("/toppings/new")
	public String createTopping(@Valid @ModelAttribute("topping") Topping topping, BindingResult result) {
		if (result.hasErrors()) {
			return "newTopping.jsp";
		}
		toppingService.createTopping(topping);
		return "redirect:/toppings/new";
	}

	@PostMapping("removeFromCart")
	public String removeFromCart(@RequestParam("orderId") Long orderId, HttpSession session) {
		Cart cart = (Cart) session.getAttribute("cart");
		ArrayList<Order> orders = cart.getOrders();
		for (Order order : orders) {
			if (order.getId() == orderId) {
				orders.remove(order);
				break;
			}
		}
		return "redirect:/cart";
	}
}
