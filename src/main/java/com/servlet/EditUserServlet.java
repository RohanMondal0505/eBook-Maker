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

import com.entities.User;
import com.helper.FactoryProvider;

@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditUserServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			int userId = Integer.parseInt(request.getParameter("user_id"));
			String userName = request.getParameter("user_name");
			String userIdString = request.getParameter("user_id_string");
			String userPassword = request.getParameter("user_password");
			String userEmail = request.getParameter("user_email");
			String userNumber = request.getParameter("user_number");
			String userAddress = request.getParameter("user_address");

			Session session = FactoryProvider.getFactory().openSession();
			Transaction tx = session.beginTransaction();

			User user = session.get(User.class, userId);
			user.setUserName(userName);
			user.setUserIdString(userIdString);
			user.setUserPaswored(userPassword);
			user.setUserEmail(userEmail);
			user.setUserNumber(userNumber);
			user.setUserAddress(userAddress);

			tx.commit();
			
			// Creating message
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "User Edited Succesfully");
			httpSession.setAttribute("type", "alert-success");

			response.sendRedirect("showUserDetails.jsp");

			session.close();
			return;

		} catch (Exception e) {
			e.printStackTrace();

			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Somthing Went Wrong !");
			httpSession.setAttribute("type", "alert-warning");
			response.sendRedirect("editUser.jsp");
			return;
		}

	}

}