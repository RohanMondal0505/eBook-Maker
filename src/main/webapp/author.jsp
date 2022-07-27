<%@page import="com.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");

if (user == null) {
	session.setAttribute("message", "You are not logged in !! Login First");
	session.setAttribute("type", "alert-danger");
	response.sendRedirect("login.jsp");
	return;
} else {

	if (user.getUserType().equals("user")) {
		session.setAttribute("message", "You are not  authorised to access this page");
		session.setAttribute("type", "alert-danger");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>


<%@include file="files/head.jsp"%>

<title>eBook Maker : Author Home</title>

<%@include file="files/navBar.jsp"%>


<!-- Content Start -->

<div
	class="content col-xl-6 col-md-8 col-sm-12 mx-auto text-center my-5 p-5">

	<h1 class="pt-5">Welcome <%=user.getUserName()%></h1>

</div>


<!-- Content End -->


<%@include file="files/footer.jsp"%>