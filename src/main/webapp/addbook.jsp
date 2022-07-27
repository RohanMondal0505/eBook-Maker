<%@page import="com.entities.Book"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.dao.BookDao"%>
<%@page import="java.util.List"%>
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

<title>eBook Maker : Add Books</title>

<%@include file="files/navBar.jsp"%>

<%@include file="files/message.jsp"%>

<!-- Content Start -->



<div class="content col-xl-6  col-md-8 col-sm-12 mx-auto text-center mt-5 p-0">

	<form action="AddBookServlet" method="post" class="border border-light px-5">
		<h1 class="text-center mb-5">Create a eBook</h1>

		<input type="hidden" value="<%=user.getUserId() %>" name="book_author_id">

		<input type="text" id="book_title" name="book_title" class="form-control mb-4" placeholder="Enter Your Title">

		<input type="text" id="boook_subject" name="boook_subject" class="form-control mb-4"
			placeholder="Enter Your Subject">

		<select class="form-control mb-4" name="book_user" id="book_user" required>
			<option value="" disabled selected>For User ?</option>
			<option value="true">True</option>
			<option value="false">False</option>
		</select>

		<textarea name="book_content" id="book_content" class="form-control mb-4" rows="15"></textarea>

		<button class="btn btn-success btn-block my-4" style="height: 60px;" type="submit">Create Now</button>

	</form>

</div>


<!-- Content End -->


<%@include file="files/footer.jsp"%>