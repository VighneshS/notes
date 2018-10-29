<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%--
  Created by IntelliJ IDEA.
  User: jeeva
  Date: 27-10-2018
  Time: 3:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    private boolean checkIfEmailIdAlreadyExists(String emailId) {
        try {
            String query = "select if (EXISTS(select u.ID from users u where u.EMAIL_ID=?),1 ,0)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, emailId);
            ResultSet result = preparedStatement.executeQuery();
            result.first();
            return result.getBoolean(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private boolean registerUser(String userName, String password, String emailId) {
        return !checkIfEmailIdAlreadyExists(emailId) && createUser(userName, password, emailId);
    }

    Connection connection;
    private boolean createUser(String userName, String password, String emailId) {
        try {
            String query = "insert into users (USER_NAME, EMAIL_ID, PASSWORD) values (?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, emailId);
            preparedStatement.setString(3, password);
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

%>

<%
    String userName = request.getParameter("userName");
    String emailId = request.getParameter("emailId");
    String password = request.getParameter("password");

    try {
        connection = (Connection) application.getAttribute("connection");

        if (!connection.isClosed()) {
%>

<%
            boolean isRegistered = registerUser(userName, password, emailId);

            if (isRegistered) {

%>
<span style="font-size: 172%; color: green; ">
<%
    out.println("Successfully Saved User you can ");
%>
</span>
<%
            } else {
                %>
<span style="font-size: 172%; color: red; ">
<%
    out.println("Problem creating user. User may already be registered with us.");

            }
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
