<%@page import="com.helper.FactoryProvider"%>

<%@include file="files/head.jsp"%>

<title>eBook Maker : Home</title>

<%@include file="files/navBar.jsp"%>


<!-- Content Start -->

<div
	class="content col-xl-6 col-md-8 col-sm-12 mx-auto text-center my-5 p-5">
	<h6>
		<%
		out.print(FactoryProvider.getFactory());
		%>
	</h6>
	<h1 class="text-capitalize">welcome to Online Ebook Maker</h1>
	<h2>Get started with Ebook Making</h2>
	<a href="./login.jsp" class="btn btn-outline-primary btn-lg mt-5 w-50">Click
		Here</a>
</div>


<!-- Content End -->


<%@include file="files/footer.jsp"%>