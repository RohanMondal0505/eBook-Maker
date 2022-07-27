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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at===: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			String userName = request.getParameter("user_name");
			String userIdString = request.getParameter("user_id_string");
			String userType = request.getParameter("user_type");
			String userPassword = request.getParameter("user_password");
			String userEmail = request.getParameter("user_email");
			String userNumber = request.getParameter("user_number");
			String userAddress = request.getParameter("user_address");
			boolean userApprove;

			if (userType.equals("author")) {
				userApprove = false;
			} else {
				userApprove = true;
			}

			// Creating user object to store data
			User user = new User(userName, userIdString, userType, userPassword, userEmail, userNumber, userAddress,
					userApprove);

			Session hibernateSession = FactoryProvider.getFactory().openSession();
			Transaction tx = hibernateSession.beginTransaction();
			hibernateSession.save(user);
			tx.commit();
			hibernateSession.close();;

			//Creating message
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Registration Successful !!");
			httpSession.setAttribute("type", "alert-success");
			response.sendRedirect("login.jsp");
			return;

		} catch (Exception e) {
			e.printStackTrace();

			// unique userIdString
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "This User Id Already Present !");
			httpSession.setAttribute("type", "alert-warning");
			response.sendRedirect("register.jsp");
			return;
			
			

		}
	}

}
