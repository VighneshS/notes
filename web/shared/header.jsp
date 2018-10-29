<%@ page import="com.notes.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user != null) {
        response.sendRedirect("home.jsp");
    }
%>

<div class="navbar">
    NOTES
</div>