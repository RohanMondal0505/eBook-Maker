<%@page import="com.entities.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDao"%>
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

	if (user.getUserType().equals("author") || user.getUserType().equals("user")) {
		session.setAttribute("message", "You are not  authorised to access this page");
		session.setAttribute("type", "alert-danger");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>




<%@include file="files/head.jsp"%>

<title>Ebook Maker : Admin Panel</title>

<%@include file="files/navBar.jsp"%>


<!-- Content Start -->


<div
	class="content text-center col-xl-8 col-lg-10 col-sm-12 mx-auto my-5 py-5 px-md-5">

	<div class="row">

		<%
		UserDao userDao = new UserDao(FactoryProvider.getFactory());
		BookDao bookDao = new BookDao(FactoryProvider.getFactory());

		List<User> athorList = userDao.allUsers("author");
		List<User> userList = userDao.allUsers("user");
		List<Book> bookList = bookDao.allBooks("admin");

		int authorCount = 0;
		int unapprovedAuthorCount = 0;
		for (User author : athorList) {
			if (author.isUserApprove())
				authorCount++;
			else
				unapprovedAuthorCount++;
		}

		int userCount = 0;
		for (User user2 : userList) {
			userCount++;
		}

		int bookCount = 0;
		int unpublishedBookCount = 0;
		int unapprovedBookCount = 0;
		for (Book book : bookList) {
			if (!book.isBookPublish())
				unpublishedBookCount++;
			if (!book.isBookUser())
				unapprovedBookCount++;
			bookCount++;
		}
		%>



		<div class="col-lg-4 col-sm-6">
			<div class="card mb-3">
				<a href="acceptAuthorRegistration.jsp"
					style="text-decoration: none;">
					<div class="card-header text-white bg-primary h2">Approved
						Authors</div>
					<div class="card-body text-white bg-info">
						<h5 class="card-title display-4 font-weight-bold"><%=authorCount%></h5>
					</div>
				</a>
			</div>
		</div>

		<div class="col-lg-4 col-sm-6">
			<div class="card mb-3">
				<a href="acceptAuthorRegistration.jsp"
					style="text-decoration: none;">
					<div class="card-header text-white bg-primary h2">Unapproved
						Authors</div>
					<div class="card-body text-white bg-info">
						<h5 class="card-title display-4 font-weight-bold"><%=unapprovedAuthorCount%></h5>
					</div>
				</a>
			</div>
		</div>
		
		<div class="col-lg-4 col-sm-6">
			<div class="card mb-3">
				<a href="allUsers.jsp" style="text-decoration: none;">
					<div class="card-header text-white bg-primary h2">Total Users</div>
					<div class="card-body text-white bg-info">
						<h5 class="card-title display-4 font-weight-bold"><%=userCount%></h5>
					</div>
				</a>
			</div>
		</div>
		
		<div class="col-lg-4 col-sm-6">
			<div class="card mb-3">
				<a href="bookDetails.jsp" style="text-decoration: none;">
					<div class="card-header text-white bg-primary h2">Total Books</div>
					<div class="card-body text-white bg-info">
						<h5 class="card-title display-4 font-weight-bold"><%=bookCount%></h5>
					</div>
				</a>
			</div>
		</div>
		
		<div class="col-lg-4 col-sm-6">
			<div class="card mb-3">
				<a href="bookDetails.jsp" style="text-decoration: none;">
					<div class="card-header text-white bg-primary h2">Unpublished
						Books</div>
					<div class="card-body text-white bg-info">
						<h5 class="card-title display-4 font-weight-bold"><%=unpublishedBookCount%></h5>
					</div>
				</a>
			</div>
		</div>
		
		<div class="col-lg-4 col-sm-6">
			<div class="card mb-3">
				<a href="bookDetails.jsp" style="text-decoration: none;">
					<div class="card-header text-white bg-primary h2">User
						Restricted Books</div>
					<div class="card-body text-white bg-info">
						<h5 class="card-title display-4 font-weight-bold"><%=unapprovedBookCount%></h5>
					</div>
				</a>
			</div>
		</div>
		
	</div>

</div>


<!-- Content End -->


<%@include file="files/footer.jsp"%>