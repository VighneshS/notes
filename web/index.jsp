<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Notes</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <header>
        <%@include file="shared/header.jsp" %>
    </header>

    <div>
        <%--<h5>No notes available. Try to <a href="login.jsp">Log In</a>
            to retrieve your notes or <a href="register.jsp">Register</a> to create your own account</h5>--%>
        <a href="login.jsp">Log In</a>
        <br>
        <a href="register.jsp">Register</a>
    </div>

    <%!
        Connection connection;
    %>
    <%
        String driverClass = application.getInitParameter("dbDriver");
        String url = application.getInitParameter("dbUrl");
        String dbUserName = application.getInitParameter("dbUserName");
        String dbPassword = application.getInitParameter("dbPassword");

        try {
            Class.forName(driverClass).newInstance();
            if (connection == null) {
                connection = DriverManager.getConnection(url, dbUserName, dbPassword);
            }

            if (!connection.isClosed()) {
    %>
    <span style="font-size: 172%; color: green; ">
    <%
        out.println("Successfully Connected with DB");
    %>

</span>
    <%
        }
    } catch (Exception e) {
    %>
    <span style="font-size: 172%; color: red; ">
    <%
        e.printStackTrace();
        out.println("Failed to connect with DB");
    %>
</span>
    <%
        }
        application.setAttribute("connection", connection);

    %>

    <footer>
        <%@include file="shared/footer.jsp" %>
    </footer>
</div>
</body>
</html>
