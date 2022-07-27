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

<title>eBook Maker : Home</title>

<%@include file="files/navBar.jsp"%>


<!-- Content Start -->

<div
	class="content col-xl-6 col-md-8 col-sm-12 mx-auto text-center my-5 p-5">
	<h1>Hi <%=user.getUserName()%></h1>
</div>


<!-- Content End -->


<%@include file="files/footer.jsp"%>