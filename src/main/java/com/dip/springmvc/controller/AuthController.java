package com.dip.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dip.springmvc.dto.User;
import com.dip.springmvc.service.UserService;

@Controller
public class AuthController {

	@Autowired
	private UserService service;

	@RequestMapping(value="/login", method = RequestMethod.GET)
	protected String getLoginPage() {
		return "login";
	}

	@RequestMapping(value = "/sign-up", method = RequestMethod.GET)
	protected String getSignUpPage() {
		return "sign-up";
	
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	protected String getHomePage(HttpSession httpSession) {
		
		if(httpSession.getAttribute("singleUser")!= null) {
			return "home";
		}else {
			return "login";
		}
		
	}
	
	@RequestMapping(value = "/reset", method = RequestMethod.GET)
	protected String getResetPage() {
		return "reset";
	}

	@RequestMapping(value = "/users", method = RequestMethod.POST)
	protected String addUser(@RequestParam(name = "username") String userName,
			@RequestParam(name = "email") String email, @RequestParam(name = "mobile") long mobile,
			@RequestParam(name = "password") String password, ModelMap modelMap,@RequestParam(name = "role") String role) {

		User addedUser = service.addUser(userName, email, mobile, password,role);
		if (addedUser != null) {

			modelMap.addAttribute("message", "User Added Successfully!");
			return "login";

		} else {
			modelMap.addAttribute("message", "Something Went Wrong");
			return "sign-up";
		}

	}
	
	@RequestMapping(value = "/newPassword", method = RequestMethod.POST)
	protected String resetPass(@RequestParam (name="email") String email,@RequestParam(name="newpassword") String newPassword, @RequestParam(name="oldpassword") String oldPassword, ModelMap modelMap) {
		User user = service.resetPass(email,newPassword, oldPassword);
		if(user!=null) {
			modelMap.addAttribute("message", "password updated Successfully!");
			return "login";
		}else {
			modelMap.addAttribute("message", "Invalid email or old password!");
			return "reset";
		}
		
		
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	protected String login(@RequestParam(name = "email") String email, @RequestParam(name="password") String password, ModelMap modelMap, HttpSession httpSession) {
			
		User user = service.login(email,password);
		
		if(user!=null) {
			if(!user.isBlocked()) {
			httpSession.setAttribute("singleUser", user);
			modelMap.addAttribute("message","User logged in successfully!");
			//httpSession.setMaxInactiveInterval(10);
			return "home";
		}
			else {
				modelMap.addAttribute("blocked", "You are blocked by admin!!");
				return "login";
			}
		}else {
			modelMap.addAttribute("message", "Invalid email or password!!");
			return "login";
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	protected String logout(HttpSession httpSession) {
		httpSession.invalidate();
		return "login";
		
	}
	
	@RequestMapping(value = "/edit-user", method = RequestMethod.GET)
	protected String  getEditPage(HttpSession httpSession, ModelMap map) {
		
		User user = (User) httpSession.getAttribute("singleUser");
		if(user!=null) {
			map.addAttribute("user",user);
			return "edit";
		}else {
			return "login";
		}
		
	}
	
	@RequestMapping(value = "/update-user", method = RequestMethod.POST)
	protected String updateUser(@RequestParam(name = "id") long id, @RequestParam(name = "username") String userName,
			@RequestParam(name = "email") String email, @RequestParam(name = "mobile") long mobile,
			@RequestParam(name = "password") String password, ModelMap modelMap) {
		
		User updatedUser = service.updateUser(id, userName,email,mobile,password);
		if(updatedUser!=null) {
			modelMap.addAttribute("message", "User updated successfully");
		}else {
			modelMap.addAttribute("message","Something went wrong");
			
		}
		
		return "home";
	}
	
	
	@RequestMapping(value = "/delete-user",method = RequestMethod.GET)
	protected String deleteUser(HttpSession httpSession, ModelMap map) {
		
		User user = (User) httpSession.getAttribute("singleUser");
		
		if(user!=null) {
			service.deleteUser(user.getId());
			map.addAttribute("message", "User Deleted!!");
			
		}
		httpSession.invalidate();
		return "login";
		
	}
	
	@RequestMapping(value = "/get-users", method = RequestMethod.GET)
	protected String getAllUsers(ModelMap map, HttpSession httpSession) {
		User user = (User) httpSession.getAttribute("singleUser");
		
		if(user!=null) {
			 List<User> users =  service.getAllUsers();
			 map.addAttribute("users", users);
			 return "users";
		}else {
			return "login";
		}
	}
	
	@RequestMapping(value = "/unblock-user", method = RequestMethod.GET)
	protected String unblockUser(@RequestParam(name = "id") long id, ModelMap map, HttpSession httpSession) {
		User user = (User) httpSession.getAttribute("singleUser");
		if(user != null) {
			User blockedUser = service.unblockUser(id);
			if(blockedUser!=null) {
				List<User> users =  service.getAllUsers();
				map.addAttribute("users", users);
				
			}
			return "users";
			
		}else {
			return "login";
		}
	}
	
	@RequestMapping(value = "/block-user", method =  RequestMethod.GET)
	protected String blockUser(@RequestParam(name = "id") long id, ModelMap map, HttpSession httpSession ) {
		User user = (User) httpSession.getAttribute("singleUser");
		if(user != null) {
			User unblockedUser = service.blockUser(id);
			if(unblockedUser!=null) {
				List<User> users =  service.getAllUsers();
				map.addAttribute("users", users);
				
			}
			return "users";
			
		}else {
			return "login";
		}
	}
	
	
	
	
}



















