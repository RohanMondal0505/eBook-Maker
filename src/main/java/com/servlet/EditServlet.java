package com.servlet;

import java.io.IOException;
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

@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			
			int bookId = Integer.parseInt(request.getParameter("book_id").trim());
			String bookTitle = request.getParameter("book_title");
			String bookSubject = request.getParameter("boook_subject");
			String bookContent = request.getParameter("book_content");
			boolean bookUser;
			if (request.getParameter("book_user").equals("true")) {
				bookUser = true;
			} else {
				bookUser = false;
			}


			Session session = FactoryProvider.getFactory().openSession();
			Transaction tx = session.beginTransaction();
			
			Book book = session.get(Book.class, bookId);
			book.setBookTitle(bookTitle);
			book.setBookSubject(bookSubject);
			book.setBookContent(bookContent);
			book.setBookUser(bookUser);
			
			tx.commit();

			// Creating message
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Book Edited Succesfully");
			httpSession.setAttribute("type", "alert-success");

			response.sendRedirect("bookDetails.jsp");
			
			session.close();
			return;

		} catch (Exception e) {
			e.printStackTrace();

			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Somthing Went Wrong !");
			httpSession.setAttribute("type", "alert-warning");
			response.sendRedirect("bookDetails.jsp");
			return;
		}

	}

}
