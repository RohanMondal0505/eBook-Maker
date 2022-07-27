<%@page import="com.entities.User"%>
</head>

<body>
	<div class="container-fluid p-0 m-0">

		<!-- NavBar Start -->
		<%
		User user1 = (User) session.getAttribute("current-user");
		%>

		<nav
			class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top py-2">
			<%
			if (user1 == null) {
			%>
			<a href="./index.jsp"
				class="navbar-brand text-primary text-justify mr-5">eBook <i
				class="fas fa-book"></i></a>
			<%
			} else if (user1.getUserType().equals("admin")) {
			%>
			<a href="./admin.jsp"
				class="navbar-brand text-primary text-justify mr-5">eBook <i
				class="fas fa-book"></i></a>
			<%
			} else if (user1.getUserType().equals("author")) {
			%>
			<a href="./author.jsp"
				class="navbar-brand text-primary text-justify mr-5">eBook <i
				class="fas fa-book"></i></a>
			<%
			} else if (user1.getUserType().equals("user")) {
			%><a href="./user.jsp"
				class="navbar-brand text-primary text-justify mr-5">eBook <i
				class="fas fa-book"></i></a>
			<%
			}
			%>
			<button class="navbar-toggler" data-target="#my-nav"
				data-toggle="collapse" aria-controls="my-nav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div id="my-nav" class="collapse navbar-collapse position-relative">



				<ul class="nav-edit navbar-nav mr-auto">
					<%
					if (user1 == null) {
					%>

					<li class="nav-item"><a class="nav-link" href="./index.jsp">
							<i class="fas fa-home"></i> Home
					</a></li>
					<%
					} else if (user1.getUserType().equals("admin")) {
					%>
					<li class="nav-item"><a class="nav-link" href="./admin.jsp"><i
							class="fas fa-home"></i> Home</a></li>

					<li class="nav-item" style="width: 250px;"><a class="nav-link"
						href="./acceptAuthorRegistration.jsp"><i
							class="fas fa-check-square"></i> Accept Author Registration</a></li>

					<li class="nav-item" style="width: 120px;"><a class="nav-link"
						href="./allUsers.jsp"><i class="fas fa-user-alt"></i> All
							Users</a></li>

					<li class="nav-item" style="width: 150px;"><a class="nav-link"
						href="./bookDetails.jsp"><i class="fas fa-book-open"></i>
							Books Details</a></li>

					<li class="nav-item" style="width: 150px;"><a class="nav-link"
						href="./addbook.jsp"><i class="fas fa-book-open"></i> Add Book</a></li>

					<%
					} else if (user1.getUserType().equals("author")) {
					%>
					<li class="nav-item"><a class="nav-link" href="./author.jsp"><i
							class="fas fa-home"></i> Home</a></li>

					<li class="nav-item" style="width: 150px;"><a class="nav-link"
						href="./bookDetails.jsp">Books Details</a></li>


					<li class="nav-item" style="width: 150px;"><a class="nav-link"
						href="./addbook.jsp">Add Book</a></li>

					<%
					} else if (user1.getUserType().equals("user")) {
					%>
					<li class="nav-item"><a class="nav-link" href="./user.jsp"><i
							class="fas fa-home"></i> Home</a></li>

					<li class="nav-item" style="width: 120px;"><a class="nav-link"
						href="./bookDetails.jsp">All Books</a></li>


					<li class="nav-item" style="width: 170px;"><a class="nav-link"
						href="./bokRequest.jsp">Request a Book</a></li>

					<%
					}
					%>

				</ul>


				<ul class="nav-edit navbar-nav absolute-end">

					<%
					if (user1 == null) {
					%>

					<li class="nav-item"><a class="nav-link" href="./register.jsp">
							<i class="fas fa-address-book"></i> Register
					</a></li>

					<li class="nav-item"><a class="nav-link" href="./login.jsp">
							<i class="fas fa-sign-in-alt"></i> Login
					</a></li>

					<%
					} else {
					%>
					<li class="nav-item"><a class="nav-link"
						href="./showUserDetails.jsp"><i
							class="fas fa-user-circle"></i> <%=user1.getUserName().split(" ")[0]%>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="LogoutServlet">
							<i class="fas fa-sign-in-alt"></i> Logout
					</a></li>

					<%
					}
					%>

				</ul>


			</div>
		</nav>


		<script>
			let path = window.location.pathname;
			path = path.split("/")[2];
			path = path.split(".")[0];
			for (i = 0; i < 5; i++) {
				if (path.slice(0, 3) == document
						.querySelectorAll(".nav-edit li")[i].innerText
						.toLowerCase().trim().slice(0, 3)) {
					document.querySelectorAll(".nav-edit li")[i].classList
							.add("active");
				} else if (path == "index") {
					document.querySelectorAll(".nav-edit li")[0].classList
							.add("active");
				} else if (path == "admin") {
					document.querySelectorAll(".nav-edit li")[0].classList
							.add("active");
				} else if (path == "author") {
					document.querySelectorAll(".nav-edit li")[0].classList
							.add("active");
				} else if (path == "user") {
					document.querySelectorAll(".nav-edit li")[0].classList
							.add("active");
				} else if (document.querySelectorAll(".nav-edit li")[i].innerText
						.toLowerCase().trim() == "all books") {
					document.querySelectorAll(".nav-edit li")[1].classList
							.add("active");
				}
			}
		</script>
		<!-- NavBar End -->



		<!-- Container Start -->
		<div class="container-fluid p-0">