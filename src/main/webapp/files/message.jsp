
<%
String message = (String) session.getAttribute("message");
String type = (String) session.getAttribute("type");
if (message != null) {
%>

<div
	class="alert <%=type %> alert-dismissible fade show col-3 position-absolute"
	role="alert" style="right: 0; top: 10px;z-index:2;">
	<strong><%= message %></strong>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>

<%
session.removeAttribute("message");
}
%>