<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.UserDao"%>
<%@page import="com.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");

if (user == null) {
	session.setAttribute("message", "You are not logged in !! Login First");
	session.setAttribute("type", "alert-danger");
	response.sendRedirect("login.jsp");
	return;
}
%>

<%@include file="files/head.jsp"%>

<title>eBook Maker : Edit User</title>

<%@include file="files/navBar.jsp"%>

<%@include file="files/message.jsp"%>

<!-- Content Start -->

<%
UserDao userDao = new UserDao(FactoryProvider.getFactory());
User user2 = userDao.oneUser(user.getUserId());
%>

<div
	class="content col-xl-6 col-md-8 col-sm-12 register-container mx-auto mt-4 p-4">

	<form action="EditUserServlet" method="post" class="border border-light px-5">
		<h1 class="text-center mb-5">Edit User</h1>

		<input type="hidden" value="<%=user2.getUserId()%>" name="user_id">
		
		<div class="form-group">
			<label for="name">Name</label> 
			<input type="text" value="<%=user2.getUserName()%>" class="form-control" id="name" placeholder="Enter Your Name"
				name="user_name" required autocomplete="off">
		</div>

		<div class="form-group">
			<label for="userId">User Id</label> 
			<input type="text" value="<%=user2.getUserIdString()%>" class="form-control" id="userId" placeholder="Enter User Id"
				name="user_id_string" required autocomplete="off">
		</div>

		<div class="form-group">
			<label for="password">Password</label> 
			<input type="text" value="<%=user2.getUserPaswored()%>" class="form-control" id="password" placeholder="Password"
				name="user_password" required>
		</div>

		<div class="form-group">
			<label for="email">Email</label> 
			<input type="email" value="<%=user2.getUserEmail()%>" class="form-control" id="email" placeholder="Enter Your Email"
				name="user_email" required autocomplete="off">
		</div>

		<div class="form-group">
			<label for="number">Number</label> 
			<input type="number" value="<%=user2.getUserNumber()%>" class="form-control" id="number" placeholder="Enter Your Number"
				name="user_number" required autocomplete="off">
		</div>

		<div class="form-group">
			<label for="address">Address</label> 
			<input type="text" value="<%=user2.getUserAddress()%>" class="form-control" id="address" placeholder="Enter Your Address"
				name="user_address" required autocomplete="off">
		</div>

		<div class="form-check text-center mt-4">
			<button type="submit" class="btn btn-outline-primary px-5">Save</button>
		</div>

	</form>

</div>


<!-- Content End -->


<%@include file="files/footer.jsp"%>