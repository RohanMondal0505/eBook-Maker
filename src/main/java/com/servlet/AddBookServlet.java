package com.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Book;
import com.helper.FactoryProvider;

@WebServlet("/AddBookServlet")
public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddBookServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			int bookAuthorId = Integer.parseInt(request.getParameter("book_author_id").trim());
			String bookTitle = request.getParameter("book_title");
			String bookSubject = request.getParameter("boook_subject");
			String bookContent = request.getParameter("book_content");
			boolean bookPublish = false;
			boolean bookUser;
			if (request.getParameter("book_user").equals("true")) {
				bookUser = true;
			} else {
				bookUser = false;
			}
			Date bookCreateDate = new Date();

//			 Creating Book object to store data
			Book book = new Book(bookTitle, bookSubject, bookContent, bookAuthorId, bookPublish, bookUser,
					bookCreateDate);

			Session session = FactoryProvider.getFactory().openSession();
			Transaction tx = session.beginTransaction();
			session.save(book);
			tx.commit();

			// Creating message
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Book Added Succesfully");
			httpSession.setAttribute("type", "alert-success");

			response.sendRedirect("bookDetails.jsp");

			session.close();
			return;

		} catch (Exception e) {
			e.printStackTrace();

			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Somthing Went Wrong !");
			httpSession.setAttribute("type", "alert-warning");
			response.sendRedirect("addbook.jsp");
			return;
		}

	}

}
