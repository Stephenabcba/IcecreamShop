package com.stephenlee.icecream.controllers;

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

import com.stephenlee.icecream.models.LoginUser;
import com.stephenlee.icecream.models.User;
import com.stephenlee.icecream.services.UserService;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    
    @GetMapping("/login")
	public String loginRegister(Model model, HttpSession session) {
		if (session.getAttribute("uuid") != null) {
			return "redirect:/dashboard";
		}
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "login.jsp";
	}

	@PostMapping("/register")
	public String registerUser(Model model, @Valid @ModelAttribute("newUser") User newUser, BindingResult result,
			HttpSession session) {
		User user = userService.register(newUser, result);
		if (result.hasErrors() || user == null) {
			model.addAttribute("newLogin", new LoginUser());
			return "login.jsp";
		} else {
			session.setAttribute("uuid", user.getId());
			session.setAttribute("loggedin_name", user.getName());
			return "redirect:/";
		}
	}

	@PostMapping("/login")
	public String loginUser(Model model, @Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result,
			HttpSession session) {
		User user = userService.login(newLogin, result);
		if (result.hasErrors() || user == null) {
			model.addAttribute("newUser", new User());
			return "login.jsp";
		} else {
			session.setAttribute("uuid", user.getId());
			session.setAttribute("loggedin_name", user.getName());
			return "redirect:/";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}

