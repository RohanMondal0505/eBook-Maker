<%@include file="files/head.jsp"%>

<title>eBook Maker : Login</title>

<%@include file="files/navBar.jsp"%>

<%@include file="files/message.jsp"%>
<!-- Content Start -->

<div class="content col-xl-6 col-md-8 col-sm-12 login-container mx-auto my-5 p-4">
	<form action="LoginServlet" method="post">
		<div class="form-group">
			<label for="userId">User Id</label> <input type="text"
				class="form-control" id="userId" placeholder="Enter User Id"
				name="user_id_string" required autocomplete="off">
		</div>
		<div class="form-group">
			<label for="password">Password</label> <input type="password"
				class="form-control" id="password" placeholder="Password"
				name="uer_password" required autocomplete="off">
		</div>
		<div class="form-group text-center">
			<a href="register.jsp">If not register click here</a>
		</div>
		<div class="form-check text-center mt-4">
			<button type="submit" class="btn btn-outline-primary px-5">Login</button>
		</div>
	</form>
</div>

<!-- Content End -->


<%@include file="files/footer.jsp"%>