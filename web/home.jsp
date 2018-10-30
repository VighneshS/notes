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
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.min.js"></script>
    <title>Home</title>
</head>
<body>
<%@include file="shared/header.jsp" %>
<%
    if (user == null) {
        response.sendRedirect("login.jsp");
}
%>
<h1>Welcome <%= user != null ? user.getUserName() : "User doesn't exist" %>
</h1>
<%@include file="shared/footer.jsp" %>
</body>
</html>
