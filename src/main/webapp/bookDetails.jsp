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
}
%>

<%@include file="files/head.jsp"%>

<title>eBook Maker : Book Details</title>

<%@include file="files/navBar.jsp"%>

<%@include file="files/message.jsp"%>

<!-- Content Start -->




<div
	class="content table-cont col-xl-9 col-lg-10 col-sm-12 mx-auto text-center my-5 p-0">

	<table class="table table-striped table-bordered">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Title</th>
				<th scope="col">Author Name</th>
				<%
				if (!user.getUserType().equals("user")) {
				%>
				<th scope="col">Author Id</th>
				<%
				}
				%>
				<th scope="col">Creating Date</th>
				<%
				if (!user.getUserType().equals("user")) {
				%>
				<th scope="col">User</th>
				<%
				}
				if (user.getUserType().equals("admin")) {
				%>
				<th scope="col">Publish</th>
				<%
				}
				%>
				<th scope="col">Action</th>
				<th scope="col">Download</th>
			</tr>
		</thead>
		<tbody>

			<%
			BookDao bookDao = new BookDao(FactoryProvider.getFactory());
			List<Book> bookList = bookDao.allBooks(user.getUserType());
			UserDao userDao = new UserDao(FactoryProvider.getFactory());
			User authorUser;

			if (bookList == null) {
			%>
			<tr>
				<th scope="row">No Records Found</th>
			</tr>

			<%
			} else {
			int idCount = 1;
			for (Book book : bookList) {

				authorUser = userDao.oneUser(book.getBookAuthorId());
			%>
			<tr>
				<th scope="row"><%=idCount%></th>
				<td><%=book.getBookTitle()%></td>
				<td><%=authorUser.getUserName()%></td>
				<%
				if (!user.getUserType().equals("user")) {
				%>
				<td><%=authorUser.getUserIdString()%></td>
				<%
				}
				%>
				<td>
					<%
					int d = book.getBookCreateDate().getDate();
					int m = book.getBookCreateDate().getMonth();
					int y = book.getBookCreateDate().getYear() + 1900;

					String date = "";

					if (d <= 9)
						date = "0" + d;
					else
						date = String.valueOf(d);
					if (m <= 9)
						date = date + "-" + "0" + m;
					else
						date = date + "-" + m;

					date = date + "-" + y;
					out.print(date);
					%>
				</td>

				<%
				String btnValue1;
				String btnStyle1;
				if (book.isBookUser()) {
					btnValue1 = "Unapprove";
					btnStyle1 = "info";
				} else {
					btnValue1 = "Approve";
					btnStyle1 = "danger";
				}

				if (!user.getUserType().equals("user")) {
				%>

				<td>
					<%
					if(user.getUserType().equals("author") & user.getUserId()==book.getBookAuthorId()){
					%>
						<a href="ApproveServlet?id=<%=book.getBookId()%>&btn_type=book" class="btn btn-<%=btnStyle1%>"><%=btnValue1%></a>
					<%
					}else if(user.getUserType().equals("admin")){
					%>
						<a href="ApproveServlet?id=<%=book.getBookId()%>&btn_type=book" class="btn btn-<%=btnStyle1%>"><%=btnValue1%></a>		
					<%
					}else{
					%>
						<a href="ApproveServlet?id=<%=book.getBookId()%>&btn_type=book" class="btn btn-secondary disabled"><%=btnValue1%></a>
					<%
					}
					%>
				</td>

				<%
				}
				String btnValue2;
				String btnStyle2;
				if (book.isBookPublish()) {
				btnValue2 = "Unapprove";
				btnStyle2 = "success";
				} else {
				btnValue2 = "Approve";
				btnStyle2 = "danger";
				}

				if (user.getUserType().equals("admin")) {
				%>
				<td><a
					href="ApproveServlet?id=<%=book.getBookId()%>&btn_type=publish"
					class="btn btn-<%=btnStyle2%>"><%=btnValue2%></a></td>
				<%
				}
				%>
				
				<td>
					<a href="BookServlet?id=<%=book.getBookId()%>" class="btn btn-primary"><i class="fas fa-eye"></i></a>
					<%
					if(user.getUserType().equals("author") & user.getUserId()==book.getBookAuthorId()){
					%>
						<a href="editBook.jsp?id=<%=book.getBookId()%>" class="btn btn-success"><i class="fas fa-edit"></i></a>
						<a href="ApproveServlet?id=<%=book.getBookId()%>&btn_type=bookDelete" class="btn btn-danger"><i class="far fa-trash-alt"></i></a>
					<%
					}else if(user.getUserType().equals("admin")){
					%>
						<a href="editBook.jsp?id=<%=book.getBookId()%>" class="btn btn-success"><i class="fas fa-edit"></i></a>
						<a href="ApproveServlet?id=<%=book.getBookId()%>&btn_type=bookDelete" class="btn btn-danger"><i class="far fa-trash-alt"></i></a>		
					<%
					}
					%>
					
				</td>
				
				<td><a href="DownloadServlet?id=<%=book.getBookId()%>"
					class="btn btn-primary"><i class="fas fa-file-download"></i></a></td>
			</tr>
			<%
			idCount++;
			}
			}
			%>
		</tbody>
	</table>

</div>


<!-- Content End -->


<%@include file="files/footer.jsp"%>