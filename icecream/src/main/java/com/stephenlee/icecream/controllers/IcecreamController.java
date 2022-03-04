package com.stephenlee.icecream.controllers;



import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.stephenlee.icecream.models.Cart;
import com.stephenlee.icecream.models.Flavor;
import com.stephenlee.icecream.models.Order;
import com.stephenlee.icecream.models.Topping;
import com.stephenlee.icecream.models.User;
import com.stephenlee.icecream.services.FlavorService;
import com.stephenlee.icecream.services.ToppingService;
import com.stephenlee.icecream.services.UserService;

@Controller
public class IcecreamController {

	@Autowired
	private FlavorService flavorService;

	@Autowired
	private ToppingService toppingService;
	
	@Autowired
	private UserService userService;

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
	public String oneIcecream(@PathVariable("id") Long id, Model model, @ModelAttribute("order") Order order, HttpSession session) {
		Flavor flavor = flavorService.findFlavor(id);
		if (flavor == null) {
			return "redirect:/";
		}
		Long userId = (Long) session.getAttribute("uuid");
		if (userId != null) {
			User user = userService.findUser(userId);
			model.addAttribute("user", user);
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
	public String checkout(Model model, HttpSession session, RedirectAttributes redirectAttributes) {
		if (session.getAttribute("cart") == null || ((Cart) session.getAttribute("cart")).getOrders().isEmpty()) {
			redirectAttributes.addFlashAttribute("error", "You cannot check out an empty cart!");
			return "redirect:/";
		}
		return "checkout.jsp";
	}

	@GetMapping("/flavors/new")
	public String newFlavorForm(@ModelAttribute("flavor") Flavor flavor, HttpSession session) {
		Long uuid = (long)session.getAttribute("uuid");
		if (uuid == null || userService.findUser(uuid).getAdmin() == false) {
			return "redirect:/";
		}
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
	public String newToppingForm(@ModelAttribute("topping") Topping topping, HttpSession session) {
		Long uuid = (long)session.getAttribute("uuid");
		if (uuid == null || userService.findUser(uuid).getAdmin() == false) {
			return "redirect:/";
		}
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
	
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
		Long userId = (Long) session.getAttribute("uuid");
		if (userId == null) {
			return "redirect:/";
		}
		User user = userService.findUser(userId);
		if (user.getAdmin() == true) {
			return "dashboardAdmin.jsp";
		}
		model.addAttribute("user", user);
		return "dashboard.jsp";
	}
	
	@PostMapping("/icecreams/{flavorId}/addFavorite")
	public String addFavorite(@PathVariable("flavorId") Long flavorId, HttpSession session, RedirectAttributes redirectAttributes) {
		Long userId = (Long) session.getAttribute("uuid");
		if (userId == null) {
			return "redirect:/";
		}
		User user = userService.findUser(userId);
		Flavor flavor = flavorService.findFlavor(flavorId);
		if (user != null && flavor != null) {			
			List<Flavor> favFlavors = user.getFavoriteFlavors();
			if (!favFlavors.contains(flavor)) {
				favFlavors.add(flavor);
				userService.saveUser(user);
			}
			redirectAttributes.addFlashAttribute("favoriteSuccess", flavor.getName() + " icecream has been added to your favorites!");
		}
		return "redirect:/icecreams/" + flavorId.toString();
	}
	
	@PostMapping("/icecreams/{flavorId}/removeFavorite")
	public String removeFavorite(@PathVariable("flavorId") Long flavorId, HttpSession session, RedirectAttributes redirectAttributes) {
		Long userId = (Long) session.getAttribute("uuid");
		if (userId == null) {
			return "redirect:/";
		}
		User user = userService.findUser(userId);
		Flavor flavor = flavorService.findFlavor(flavorId);
		if (user != null && flavor != null) {			
			List<Flavor> favFlavors = user.getFavoriteFlavors();
			favFlavors.remove(flavor);
			userService.saveUser(user);
			redirectAttributes.addFlashAttribute("unFavoriteSuccess", flavor.getName() + " Icecream has been removed from your favorites.");
		}
		return "redirect:/dashboard";
	}
}
