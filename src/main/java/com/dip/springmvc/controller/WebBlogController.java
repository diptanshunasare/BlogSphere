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
import com.dip.springmvc.dto.WebBlogDTO;
import com.dip.springmvc.service.WebBlogService;

@Controller
public class WebBlogController {
	
	@Autowired
	private WebBlogService blogService;
	
	@RequestMapping(value="/add-blog-page", method = RequestMethod.GET)
	protected String getAddBlogPage() {
		return "add_blog";
	}
	
	@RequestMapping(value = "/add-blog", method = RequestMethod.POST)
	protected String addBlog(@RequestParam(name = "title") String title, @RequestParam(name = "content") String content, @RequestParam(name = "author") String author, ModelMap map, HttpSession httpSession){
		User user = (User) httpSession.getAttribute("singleUser");
		WebBlogDTO addedBlog = blogService.addBlog(title, content, author,user);
		if(addedBlog!=null) {
			List<WebBlogDTO> blogs = blogService.getMyBlogs(user.getId());
			map.addAttribute("blogs", blogs);
			return "my-blogs";
		}else {
			map.addAttribute("message", "Something went wrong!!");
			return "add_blog";
		}
	}
	
	
	@RequestMapping(value = "/blogs", method = RequestMethod.GET)
	protected String getAllBlogs(ModelMap map, HttpSession httpSession) {
		User user = (User) httpSession.getAttribute("singleUser");
		
		if(user!=null) {
			
			List<WebBlogDTO> blogs = blogService.getAllBlogs();
			if(blogs!=null) {
				map.addAttribute("blogs", blogs);
				
			}else {
				map.addAttribute("message","Blogs not found..");
			}
			map.addAttribute("role", user.getRole());
			
			return "blogs";
			
			
		}else {
			return "login";
		}
	}
	
	@RequestMapping(value = "/my-blogs", method = RequestMethod.GET)
	protected String findMyBlogs(HttpSession httpSession, ModelMap map) {
		User user = (User) httpSession.getAttribute("singleUser");
		if(user!=null) {
			List<WebBlogDTO> blogs = blogService.getMyBlogs(user.getId());
			if(blogs!=null) {
			map.addAttribute("blogs", blogs);
			}else {
				map.addAttribute("message","Blogs not found..");
			}
			return "my-blogs";
		}else {
			return "login";
		}
	}
	
	
	@RequestMapping(value = "/delete-blog", method = RequestMethod.GET)
	protected String deleteMyBlog(@RequestParam(name = "blog-id") int blogId, @RequestParam(name = "user-id") long userId, ModelMap map, HttpSession httpSession) {
		
		User user = (User) httpSession.getAttribute("singleUser");
		
		if(user!=null) {
			WebBlogDTO deletedBlog = blogService.deleteMyBlog(blogId,userId);
			if(deletedBlog==null) {
				map.addAttribute("message", "Something went wrong");
			}
			List<WebBlogDTO> blogs = blogService.getMyBlogs(user.getId());
			if(blogs!=null) {
				map.addAttribute("blogs", blogs);
			}else {
				map.addAttribute("message", "No blogs Found..");
			}
			return "my-blogs";
		} else {
			return "login";
		}
		
	}
	
	@RequestMapping(value = "/update-blog", method = RequestMethod.GET)
	protected String getEditBlogPage(@RequestParam(name = "blog-id") int blogId, @RequestParam(name = "user-id") long userId, ModelMap map, HttpSession httpSession) {
		
		User user = (User) httpSession.getAttribute("singleUser");
		if(user!=null) {
			WebBlogDTO blog  = blogService.getSingleBlog(blogId);
			if(blog!=null) {
			map.addAttribute("blog", blog);
			return "edit-blog";
			}else {
				map.addAttribute("message", "Something went wrong");
				return "my-blogs";
			}
		}else {
			return "login";
		}
	}
	
	@RequestMapping(value = "/edit-blog", method = RequestMethod.POST)
	protected String editBlog(@RequestParam(name="id") int blogId,@RequestParam(name="title") String title, @RequestParam(name="content") String content, @RequestParam(name="author") String author, ModelMap map) {
		
		WebBlogDTO editedBlog = blogService.editBlog( blogId,  title,  content,  author);
		
		if(editedBlog != null) {
			map.addAttribute("message", "Blog updated successfully");
			return "my-blogs";
		}else {
			map.addAttribute("message", "Something went wrong");
			return "edit-blog";
		}
	}
	
	@RequestMapping(value = "/sort", method = RequestMethod.GET)
	protected String sort(@RequestParam(name="index") int index, ModelMap map, HttpSession httpSession) {
		User user =(User) httpSession.getAttribute("singleUser");
		if(user!=null) {
			List<WebBlogDTO> blogs = blogService.sortBlogs(index);
			map.addAttribute("blogs", blogs);
			map.addAttribute("role", user.getRole());
			return "blogs";
		}else {
			return "login";
		}
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	protected String searchBlogs(@RequestParam(name = "query") String query, HttpSession httpSession,
			ModelMap modelMap) {
		User user = (User) httpSession.getAttribute("singleUser");
		if (user != null) {
			List<WebBlogDTO> blogs = blogService.searchBlogs(query);
			if (blogs != null) {
				modelMap.addAttribute("blogs", blogs);
			} else {
				modelMap.addAttribute("message", "Blogs not found..");
			}
			modelMap.addAttribute("role", user.getRole());
			return "blogs";
		} else {
			return "login";
		}
	}
	
	

}
