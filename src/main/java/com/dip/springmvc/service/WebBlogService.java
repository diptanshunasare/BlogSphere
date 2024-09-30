package com.dip.springmvc.service;

import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dip.springmvc.dao.UserDAO;
import com.dip.springmvc.dao.WebBlogDAO;
import com.dip.springmvc.dto.User;
import com.dip.springmvc.dto.WebBlogDTO;

@Component
public class WebBlogService {
	
	@Autowired
	private WebBlogDAO webBlogDAO;
	@Autowired
	private UserDAO userDAO;
	
	
	public WebBlogDTO addBlog(String title, String content, String author, User user) {
		WebBlogDTO webBlogDTO = new WebBlogDTO();
		webBlogDTO.setTitle(title);
		webBlogDTO.setContent(content);
		webBlogDTO.setAuthor(author);
		webBlogDTO.setDate(new Date((System.currentTimeMillis())));
		webBlogDTO.setUserId(user.getId());
		try {
			WebBlogDTO blog = webBlogDAO.addBlog(webBlogDTO);
			userDAO.mapBlogToUser(blog.getId(), user.getId());
			return blog;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}


	public List<WebBlogDTO> getAllBlogs() {
		
		List<WebBlogDTO> blogs = webBlogDAO.getAllBlogs();
		if(blogs!=null) {
			return blogs;
		}else {
			return null;
		}
	}


	public List<WebBlogDTO> getMyBlogs(long userId) {
		List<WebBlogDTO> blogs = webBlogDAO.getMyBlogs(userId);
		if(blogs.size()>0) {
			return blogs;
		}else {
		return null;
		}
	}


	public WebBlogDTO deleteMyBlog(int blogId, long userId) {
		
		try {
			
			return webBlogDAO.deleteMyBlog(blogId, userId);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			return null;
		}
	}


	public WebBlogDTO getSingleBlog(int blogId) {
		try{
		return webBlogDAO.getSingleBlog(blogId);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}


	public WebBlogDTO editBlog(int blogId, String title, String content, String author) {
		try{
			return webBlogDAO.editBlog(blogId, title, content, author);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}


	public List<WebBlogDTO> sortBlogs(int index) {
		List<WebBlogDTO> blogs = webBlogDAO.getAllBlogs();
		Collections.sort(blogs);
		if(index==1) {
			Collections.reverse(blogs);
			return blogs;
		}
		return blogs;
	}


	public List<WebBlogDTO> searchBlogs(String query) {
		List<WebBlogDTO> blogs = webBlogDAO.searchBlogs(query);
		if (blogs.size() > 0) {
			return blogs;
		} else {
			return null;
		}
	}

}
