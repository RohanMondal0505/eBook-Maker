package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BookDao;
import com.entities.Book;
import com.helper.FactoryProvider;

@WebServlet("/BookServlet")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BookServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int bookId = Integer.parseInt(request.getParameter("id").trim());

		BookDao bookDao = new BookDao(FactoryProvider.getFactory());
		Book book = bookDao.oneBook(bookId);

		PrintWriter out = response.getWriter();
		out.println(book.getBookTitle());
		out.println();
		out.println(book.getBookSubject());
		out.println();
		out.println("Create Date : " + book.getBookCreateDate());
		out.println();
		out.println(book.getBookContent());
		out.println();

	}

}
