package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.entities.User;
import com.helper.FactoryProvider;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			String userIdString = request.getParameter("user_id_string");
			String userPassword = request.getParameter("uer_password");

			UserDao userDao = new UserDao(FactoryProvider.getFactory());
			User user = userDao.getUserByUserIdAndPassword(userIdString, userPassword);

			HttpSession httpSession = request.getSession();

			if (user == null) {
				httpSession.setAttribute("message", "Invalid Details !!");
				httpSession.setAttribute("type", "alert-danger");
				response.sendRedirect("login.jsp");
				return;

			} else {
				if (user.getUserIdString().equals(userIdString) & user.getUserPaswored().equals(userPassword)) {

					httpSession.setAttribute("current-user", user);

					if (user.getUserType().equals("admin")) {
						response.sendRedirect("admin.jsp");
					} else if (user.getUserType().equals("author")) {

						if (user.isUserApprove()) {
							response.sendRedirect("author.jsp");
						} else {
							httpSession.setAttribute("message", "Please wait some time, You are not Approved yet !!");
							httpSession.setAttribute("type", "alert-primary");
							response.sendRedirect("login.jsp");
						}

					} else if (user.getUserType().equals("user")) {
						response.sendRedirect("user.jsp");
					}

				}else {
					httpSession.setAttribute("message", "Invalid User Details !!");
					httpSession.setAttribute("type", "alert-danger");
					response.sendRedirect("login.jsp");
					return;
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
