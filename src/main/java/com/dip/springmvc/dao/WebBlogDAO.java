package com.dip.springmvc.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Component;

import com.dip.springmvc.dto.User;
import com.dip.springmvc.dto.WebBlogDTO;


@Component
public class WebBlogDAO {
	
	private EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;
	private EntityTransaction entityTransaction;
	
	public WebBlogDTO addBlog(WebBlogDTO webBlogDTO) {
		
		openConnection();
		entityTransaction.begin();
		entityManager.persist(webBlogDTO);
		entityTransaction.commit();
		closeConnection();
		return webBlogDTO;
	}
	
	
	private void openConnection() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		entityManagerFactory = Persistence.createEntityManagerFactory("springmvc");
		entityManager = entityManagerFactory.createEntityManager();
		entityTransaction = entityManager.getTransaction();
		
	}
	
	private void closeConnection() {
		if(entityManager!=null) {
			entityManager.close();
		}
		if(entityManagerFactory!=null) {
			entityManagerFactory.close();
		}
		if(entityTransaction!=null) {
			if(entityTransaction.isActive()) {
				entityTransaction.rollback();
			}
		}
	}


	public List<WebBlogDTO> getAllBlogs() {
		
		openConnection();
		Query query = entityManager.createQuery("SELECT blogs FROM WebBlogDTO blogs");
		@SuppressWarnings("unchecked")
		List<WebBlogDTO> blogs = query.getResultList();
		closeConnection();
		return blogs;
	}


	public List<WebBlogDTO> getMyBlogs(long userId) {
		openConnection();
		User user = (User) entityManager.find(User.class, userId);
		List<WebBlogDTO> blogs = user.getWebBlogs();
		closeConnection();
		return blogs;
	}


	public WebBlogDTO deleteMyBlog(int blogId, long userId) {
		
		openConnection();
		WebBlogDTO blog = entityManager.find(WebBlogDTO.class, blogId);
		User user = entityManager.find(User.class, userId);
		List<WebBlogDTO> blogs = user.getWebBlogs();
		WebBlogDTO blogToBeDeleted = null;
		for (WebBlogDTO b : blogs) {
			if(b.getId()==blogId) {
				blogToBeDeleted = b;
				break;
			}
		}
		blogs.remove(blogToBeDeleted);
		user.setWebBlogs(blogs);
		entityTransaction.begin();
		entityManager.persist(user);
		entityManager.remove(blog);
		entityTransaction.commit();
		closeConnection();
		
		return blog;
	}


	public WebBlogDTO getSingleBlog(int blogId) {
		openConnection();
		WebBlogDTO blog = entityManager.find(WebBlogDTO.class, blogId);
		closeConnection();
		return blog;
	}


	public WebBlogDTO editBlog(int blogId, String title, String content, String author) {
		openConnection();
		WebBlogDTO blog = entityManager.find(WebBlogDTO.class, blogId);
		blog.setTitle(title);
		blog.setAuthor(author);
		blog.setDate(new Date(System.currentTimeMillis()));
		blog.setContent(content);
		entityTransaction.begin();
		entityManager.persist(blog);
		entityTransaction.commit();
		closeConnection();
		
		return blog;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<WebBlogDTO> searchBlogs(String query) {
		openConnection();
		Query query2 = entityManager.createQuery("SELECT blogs FROM WebBlogDTO blogs WHERE blogs.title LIKE '%" + query
				+ "%' OR blogs.content LIKE '%" + query + "%' OR blogs.author LIKE '%" + query + "%'");
		List<WebBlogDTO> blogs = query2.getResultList();
		closeConnection();
		return blogs;
	}

	
	

}
