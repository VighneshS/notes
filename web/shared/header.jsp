<%@ page import="com.notes.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user != null && !request.getRequestURI().equalsIgnoreCase("/home.jsp")) {
        response.sendRedirect("home.jsp");
    }
%>

<div class="navbar">
    NOTES
</div>
<%
    if (user != null) {
%>
<form action="${pageContext.request.contextPath}/user/logout" method="post">
    <input class="btn btn-link btn-logout" type="submit" value="Logout"/>
</form>
<%
    }
%>