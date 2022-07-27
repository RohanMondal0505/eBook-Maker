<%@include file="files/head.jsp"%>

<title>eBook Maker : Register</title>

<%@include file="files/navBar.jsp"%>

<%@include file="files/message.jsp"%>
<!-- Content Start -->

<div class="content col-xl-6 col-md-8 col-sm-12 register-container mx-auto mt-4 p-4">
	
	<form action="RegisterServlet" method="post">
		<div class="form-group">
			<label for="name">Name</label> <input type="text"
				class="form-control" id="name" placeholder="Enter Your Name"
				name="user_name" required autocomplete="off">
		</div>
		<div class="form-group">
			<label for="type">User Type</label> <select class="form-control"
				name="user_type" id="type">
				<option value="user" selected>User</option>
				<option value="author">Author</option>
			</select>
		</div>
		<div class="form-group">
			<label for="userId">User Id</label> <input type="text"
				class="form-control" id="userId" placeholder="Enter User Id"
				name="user_id_string" required autocomplete="off">
		</div>
		<div class="form-group">
			<label for="password">Password</label> <input type="password"
				class="form-control" id="password" placeholder="Password"
				name="user_password" required>
		</div>
		<div class="form-group">
			<label for="email">Email</label> <input type="email"
				class="form-control" id="email" placeholder="Enter Your Email"
				name="user_email" required autocomplete="off">
		</div>
		<div class="form-group">
			<label for="number">Number</label> <input type="number"
				class="form-control" id="number" placeholder="Enter Your Number"
				name="user_number" required autocomplete="off">
		</div>
		<div class="form-group">
			<label for="address">Address</label> <input type="text"
				class="form-control" id="address" placeholder="Enter Your Address"
				name="user_address" required autocomplete="off">
		</div>
		<div class="form-check text-center mt-4">
			<button type="submit" class="btn btn-outline-primary px-5">Register</button>
		</div>
	</form>
</div>

<!-- Content End -->


<%@include file="files/footer.jsp"%>
