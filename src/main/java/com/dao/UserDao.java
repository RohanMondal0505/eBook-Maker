package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.entities.User;

public class UserDao {
	private SessionFactory factory;

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	// get user by userId and password

	public User getUserByUserIdAndPassword(String userId, String userPassword) {

		User user = null;

		try {

			String query = "from User where userIdString =: i and userPaswored =: p";
			Session session = this.factory.openSession();
			@SuppressWarnings("rawtypes")
			Query q = session.createQuery(query);
			q.setParameter("i", userId);
			q.setParameter("p", userPassword);

			user = (User) q.uniqueResult();

			session.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	@SuppressWarnings("unchecked")
	public List<User> allUsers(String userType) {

		List<User> list = null;
		
		try {
			
			String query = "from User where userType =: t";
			Session session = this.factory.openSession();
			@SuppressWarnings("rawtypes")
			Query q2 = session.createQuery(query);
			q2.setParameter("t", userType);
			
			list = q2.list();
			
			session.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}


	public User oneUser(int userId) {

		User user = null;
		
		try {
			
			String query = "from User where userId =: i";
			Session session = this.factory.openSession();
			@SuppressWarnings("rawtypes")
			Query q = session.createQuery(query);
			q.setParameter("i", userId);
			
			user = (User) q.uniqueResult();
			
			session.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}
	
	
}
