package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Book;
import com.entities.User;
import com.helper.FactoryProvider;

@WebServlet("/ApproveServlet")
public class ApproveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ApproveServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String btnType = request.getParameter("btn_type");
			int id = Integer.parseInt(request.getParameter("id").trim());

			Session session = FactoryProvider.getFactory().openSession();
			Transaction tx = session.beginTransaction();

			if (btnType.equals("author")) {

				User user = (User) session.get(User.class, id);

				if (user.isUserApprove())
					user.setUserApprove(false);
				else
					user.setUserApprove(true);

				session.save(user);

				if (request.getParameter("p").equals("a"))
					response.sendRedirect("acceptAuthorRegistration.jsp");
				else if (request.getParameter("p").equals("u"))
					response.sendRedirect("allUsers.jsp");

			} else if (btnType.equals("book")) {

				Book book = (Book) session.get(Book.class, id);

				if (book.isBookUser())
					book.setBookUser(false);
				else
					book.setBookUser(true);

				session.save(book);
				response.sendRedirect("bookDetails.jsp");

			} else if (btnType.equals("publish")) {

				Book book = (Book) session.get(Book.class, id);

				if (book.isBookPublish())
					book.setBookPublish(false);
				else
					book.setBookPublish(true);

				session.save(book);
				response.sendRedirect("bookDetails.jsp");

			} else if (btnType.equals("delete")) {
				User user = (User) session.get(User.class, id);
				
				session.delete(user);
				
				if (request.getParameter("p").equals("a"))
					response.sendRedirect("acceptAuthorRegistration.jsp");
				else if (request.getParameter("p").equals("u"))
					response.sendRedirect("allUsers.jsp");

			}else if (btnType.equals("bookDelete")) {
				Book book = (Book) session.get(Book.class, id);
				
				session.delete(book);
				
					response.sendRedirect("bookDetails.jsp");

			}
			
			tx.commit();
			session.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
