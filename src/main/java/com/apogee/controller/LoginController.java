/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.apogee.controller;

import com.apogee.EntityModel.User;
import com.apogee.payload.LoginRequest;
import com.apogee.services.UserService;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author lENOVO
 */
@Controller
public class LoginController {

	@Autowired
	private UserService userService;

	@GetMapping("/")
	public String redirectToLogin() {
		return "redirect:/loginpage";
	}

	@GetMapping("/dashboard")
	public String Dashboard(HttpSession session) {
		if (session.getAttribute("username") == null) {
			return "redirect:/loginpage";
		} else {
			return "dashboard";
		}
	}

	@GetMapping("/loginpage")
	public String showLoginPage(HttpSession session) {
		if (session != null) {
			session.removeAttribute("username");
			session.removeAttribute("email");
		}
		return "loginpage";
	}

	@PostMapping("/login")
//    public String authenticateUser(@RequestBody LoginRequest loginRequest, Model model) {
	public String authenticateUser(@RequestParam String username, @RequestParam String password, Model model,
			HttpSession session) {
		User user = userService.validateUser(username, password);
		if (user != null) {
			session.setAttribute("email", user.getEmail());
			session.setAttribute("username", user.getName());
			session.setAttribute("role", "Admin");

			int sessionTimeoutInSeconds = 300; // 5 minutes
			session.setMaxInactiveInterval(sessionTimeoutInSeconds);

			return "redirect:/dashboard";
		} else {
			model.addAttribute("error", "Invalid username or password");
			return "loginpage";
		}
	}

	@GetMapping("/user")
	public String showUserPage(HttpSession session) {
		if (session.getAttribute("username") == null) {
			return "redirect:/loginpage";
		} else {
			return "user";
		}
	}

	@GetMapping("/product")
	public String showProductPage(HttpSession session) {
		if (session.getAttribute("username") == null) {
			return "redirect:/loginpage";
		} else {
			return "product";
		}
	}

	@GetMapping("/order")
	public String showOrderPage(HttpSession session) {
		if (session.getAttribute("username") == null) {
			return "redirect:/loginpage";
		} else {
			return "order";
		}

	}

	@GetMapping("/header")
	public String HeaderTesting() {
		return "header";
	}

	@GetMapping("/shopingcart")
	public String Shopingcart(HttpSession session) {
		if (session.getAttribute("username") == null) {
			return "redirect:/loginpage";
		} else {
			return "shopingcart";
		}
	}

	@GetMapping("/chart")
	public String Chart() {
		return "chart";
	}

	@GetMapping("/about")
	public String About() {
		return "about";
	}

	@GetMapping("/signup")
	public String Signup() {
		return "signup";
	}

	@GetMapping("/category")
	public String Category(HttpSession session) {
		if (session.getAttribute("username") == null) {
			return "redirect:/loginpage";
		} else {
			return "category";
		}
	}

}
