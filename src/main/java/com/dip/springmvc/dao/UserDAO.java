package com.dip.springmvc.dao;

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
public class UserDAO {
	
	private EntityManagerFactory entityManagerFactory;
	private EntityManager entityManager;
	private EntityTransaction entityTransaction;

	public User addUser(User user) {
		openConnection();
		entityTransaction.begin();
		entityManager.persist(user);
		entityTransaction.commit();
		closeConnection();
		return user;
	}
	
	private void openConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		entityManagerFactory = Persistence.createEntityManagerFactory("springmvc");
		entityManager = entityManagerFactory.createEntityManager();
		entityTransaction = entityManager.getTransaction();
	}

	private void closeConnection() {
		if (entityManagerFactory != null) {
			entityManagerFactory.close();
		}
		if (entityManager != null) {
			entityManager.close();
		}
		if (entityTransaction != null) {
			if (entityTransaction.isActive()) {
				entityTransaction.rollback();
			}
		}
	}

	public User login(String email, String password) {
		openConnection();
		String query = "SELECT user FROM User user WHERE user.email = ?1 AND user.password = ?2";
		 Query query2 = entityManager.createQuery(query);
		 query2.setParameter(1, email);
		 query2.setParameter(2, password);
		 User user1 = (User) query2.getSingleResult();
		 closeConnection();
		return user1;
	}
	
	
	public User resetPass(String email,String newPassword, String oldPassword) {
		openConnection();
		String query = "SELECT user FROM User user WHERE user.email = ?1 AND user.password = ?2";
		Query query2 = entityManager.createQuery(query);
		 query2.setParameter(1, email);
		 query2.setParameter(2, oldPassword);
		 User user = (User) query2.getSingleResult();
		 if(user!=null) {
			 user.setPassword(newPassword);
			 entityTransaction.begin();
			 entityManager.persist(user);
			 entityTransaction.commit();
			 return user;
		 }
		 closeConnection();
		 
		return null;
	}

	public User updateUser(long id,String userName, String email, long mobile, String password) {
		openConnection();
		User user = entityManager.find(User.class, id);
		user.setUserName(userName);
		user.setEmail(email);
		user.setMobile(mobile);
		user.setPassword(password);
		entityTransaction.begin();
		entityManager.persist(user);
		entityTransaction.commit();
		closeConnection();
		return user;
	}

	public void deleteUser(long id) {
		
		openConnection();
		User user = entityManager.find(User.class, id);
		entityTransaction.begin();
		entityManager.remove(user);
		entityTransaction.commit();
		closeConnection();
	}
	
	@SuppressWarnings("unchecked")
	public List<User> findAllUsers() {
		openConnection();
		Query query = entityManager.createQuery("SELECT users FROM User users");
		List<User> users = query.getResultList();
		closeConnection();
		return users;
	}
	
	public void mapBlogToUser(int blogid, long userid) {
		openConnection();
		User user = entityManager.find(User.class, userid);
		WebBlogDTO webBlog = entityManager.find(WebBlogDTO.class, blogid);
		List<WebBlogDTO> webBlogs = user.getWebBlogs();
		webBlogs.add(webBlog);
		user.setWebBlogs(webBlogs);
		entityTransaction.begin();
		entityManager.persist(user);
		entityTransaction.commit();
		closeConnection();
	}

	public User unblockUser(long id) {
		openConnection();
		User user = entityManager.find(User.class, id);
		user.setBlocked(false);
		entityTransaction.begin();
		entityManager.persist(user);
		entityTransaction.commit();
		closeConnection();		
		return user;
	}

	public User blockUser(long id) {
		openConnection();
		User user = entityManager.find(User.class, id);
		user.setBlocked(true);
		entityTransaction.begin();
		entityManager.persist(user);
		entityTransaction.commit();
		closeConnection();		
		return user;
	}



}
