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

	if (user.getUserType().equals("author") || user.getUserType().equals("user")) {
		session.setAttribute("message", "You are not  authorised to access this page");
		session.setAttribute("type", "alert-danger");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>

<%@include file="files/head.jsp"%>

<title>eBook Maker : All Users</title>

<%@include file="files/navBar.jsp"%>


<!-- Content Start -->




<div class="content col-md-8 col-sm-12 mx-auto text-center my-5 p-0">

	<table class="table table-striped table-bordered">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">User Id</th>
				<th scope="col">User Name</th>
				<th scope="col">User Email</th>
				<th scope="col">User Number</th>
				<th scope="col">User Address</th>
				<th scope="col">Status</th>
				<th scope="col">Approve</th>
				<th scope="col">Delete</th>
			</tr>
		</thead>
		<tbody>
			<%
			UserDao userDao = new UserDao(FactoryProvider.getFactory());
			List<User> userList = userDao.allUsers("user");
			int userCount = 0;
			for (User element : userList) {
				userCount++;
			%>

			<tr>
				<th><%=userCount%></th>
				<th scope="row">@<%=element.getUserIdString()%></th>
				<td><%=element.getUserName()%></td>
				<td><%=element.getUserEmail()%></td>
				<td><%=element.getUserNumber()%></td>
				<td><%=element.getUserAddress()%></td>

				<%
				String approveValue;
				String btnStyle;
				if (element.isUserApprove()) {
				%>
				<td class="text-success">
					<%
					out.print("Approved");
					approveValue = "Unapprove";
					btnStyle = "btn-success";
					} else {
					%>
				<td class="text-danger">
					<%
					out.print("Not Approved");
					approveValue = "Approve";
					btnStyle = "btn-danger";
					}
					%>
				</td>
				<td><a
					href="ApproveServlet?id=<%=element.getUserId()%>&btn_type=author&p=u"
					class="btn <%=btnStyle%> px-4 click"><%=approveValue%></a></td>
				<td><a
					href="ApproveServlet?id=<%=element.getUserId()%>&btn_type=delete&p=u"
					class="btn btn-danger px-4 click"><i class="fas fa-trash-alt"></i></a>
				</td>
			</tr>

			<%
			}
			%>

		</tbody>
	</table>

</div>



<!-- Content End -->


<%@include file="files/footer.jsp"%>