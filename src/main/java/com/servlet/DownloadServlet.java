package com.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import com.entities.Book;
import com.entities.User;
import com.helper.CreatePDF;
import com.helper.FactoryProvider;

@WebServlet("/DownloadServlet")
public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DownloadServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			int id = Integer.parseInt(request.getParameter("id").trim());

			Session session = FactoryProvider.getFactory().openSession();

			Book book = (Book) session.get(Book.class, id);
			User user = (User) session.get(User.class, book.getBookAuthorId());
			@SuppressWarnings("deprecation")
			String path = request.getRealPath("pdf_file") + File.separator;

			PrintWriter o = response.getWriter();

			String filename = CreatePDF.create(book, user, path);

			response.setContentType("text/html");
			response.setContentType("APPLICATION/OCTET-STREAM");
			response.setHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");
			FileInputStream fileInputStream = new FileInputStream(path + filename);
			
			int i;
			while ((i = fileInputStream.read()) != -1) {
				o.write(i);
			}
			fileInputStream.close();
			
			new File(path+filename).delete();
			
			         

			o.close();
			session.close();

		} catch (

		Exception e) {
			e.printStackTrace();
		}

	}

}
