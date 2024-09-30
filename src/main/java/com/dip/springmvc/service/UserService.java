package com.dip.springmvc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dip.springmvc.dao.UserDAO;
import com.dip.springmvc.dto.Role;
import com.dip.springmvc.dto.User;
import com.dip.springmvc.dto.WebBlogDTO;

@Component
public class UserService {

	@Autowired
	private UserDAO userDAO;

	public User addUser(String userName, String email, long mobile, String password, String role) {
		if (role.equals("ADMIN")) {
			boolean flag = false;
			List<User> users = userDAO.findAllUsers();
			for (User user : users) {
				if (user.getRole().equals(Role.ADMIN)) {
					flag = true;
					break;
				}
			}
			if (flag) {
				return null;
			}
		}
		User user = new User();
		user.setUserName(userName);
		user.setEmail(email);
		user.setMobile(mobile);
		user.setPassword(password);
		if(role.equals("USER")) {
			user.setRole(Role.USER);
		}else {
			user.setRole(Role.ADMIN);
		}
		user.setBlocked(false);
		user.setWebBlogs(new ArrayList<WebBlogDTO>());
		try {
		return userDAO.addUser(user);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}	
	}

	public User login(String email, String password) {
		try {
			return userDAO.login(email,password);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public User resetPass(String email,String newPassword, String oldPassword) {
		
		try {
			return userDAO.resetPass(email,newPassword, oldPassword);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public User updateUser(long id, String userName, String email, long mobile, String password) {
		try {
			return userDAO.updateUser(id, userName, email, mobile, password);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	public void deleteUser(long id) {
		
		userDAO.deleteUser(id);
		
	}

	public List<User> getAllUsers() {
		
		return userDAO.findAllUsers();
		
	}

	public User unblockUser(long id) {
		try {
		return userDAO.unblockUser(id);
		} catch(Exception e) {
			return null;
		}
	}

	public User blockUser(long id) {
		try {
			return userDAO.blockUser(id);
			} catch(Exception e) {
				return null;
			}
	}

}
