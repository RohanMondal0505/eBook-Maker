package com.dao;

import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.entities.Book;

public class BookDao {
	private SessionFactory factory;

	public BookDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	@SuppressWarnings("unchecked")
	public List<Book> allBooks(String userType) {

		List<Book> list = null;

		try {

			Session session = this.factory.openSession();
			String query = null;
			
			if (userType.equals("user"))
				query = "from Book where bookUser = true and bookPublish = true order by book_id desc";
			else
				query = "from Book order by book_id desc";
			
			@SuppressWarnings("rawtypes")
			Query q = session.createQuery(query);

			list = q.list();

			session.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}


	public Book oneBook(int id) {

		Book book = null;

		try {

			Session session = this.factory.openSession();
			String query = "from Book where book_id =: i";
			
			@SuppressWarnings("rawtypes")
			Query q = session.createQuery(query);
			q.setParameter("i", id);
			
			book = (Book) q.uniqueResult();

			session.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return book;
	}


}
