<%--
  Created by IntelliJ IDEA.
  User: jeeva
  Date: 30-10-2018
  Time: 0:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<%@include file="shared/header.jsp" %>
<h1>My Name is <%= user != null ? user.getUserName() : "User doesn't exist" %>
</h1>
<%@include file="shared/footer.jsp" %>
</body>
</html>
