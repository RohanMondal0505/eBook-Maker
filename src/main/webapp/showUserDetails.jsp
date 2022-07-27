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

<title>eBook Maker : User Details</title>

<%@include file="files/navBar.jsp"%>

<%@include file="files/message.jsp"%>

<!-- Content Start -->

<%
UserDao userDao = new UserDao(FactoryProvider.getFactory());
User user2 = userDao.oneUser(user.getUserId());
%>

<div class="content col-xl-6 col-lg-7 col-md-9 col-sm-12 mx-auto mt-5 pt-5">

	<div class="row">
		<div class="col pl-xl-5" style="overflow-y:auto">
		
			<h3 class="mb-4">Name : <%=user2.getUserName()%></h3>
			<h3 class="mb-4">User Id : <%=user2.getUserIdString()%></h3>
			<h3 class="mb-4">Email id : <%=user2.getUserEmail()%></h3>
			<h3 class="mb-4">Number : <%=user2.getUserNumber()%></h3>
			<h3 class="mb-2">Address : <%=user2.getUserAddress()%></h3>

			<p class="text-right"><a href="./editUser.jsp" class="btn btn-info mt-4"><i class="fas fa-user-edit"></i> Edit Details</a></p>	
		
		</div>		
	</div>
	
</div>


<!-- Content End -->


<%@include file="files/footer.jsp"%>