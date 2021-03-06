<%--
  Created by IntelliJ IDEA.
  User: jeeva
  Date: 27-10-2018
  Time: 3:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <header>
        <%@include file="shared/header.jsp" %>
    </header>
    <article>
        <h1>Register</h1>
        <form name="registrationForm" class="form-horizontal" action="registerUser.jsp" method="post">
            <div class="form-group">
                <label class="col-md-2 custom-control-label">User Name: </label>
                <div class="col-md-4">
                    <input type="text" class="form-control" name="userName" required="required"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 custom-control-label">Email: </label>
                <div class="col-md-4">
                    <input type="email" class="form-control" name="emailId" required="required"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2 custom-control-label">Password: </label>
                <div class="col-md-4">
                    <input type="password" class="form-control" name="password" required="required"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-4 col-md-offset-2">
                    <input type="submit" name="registerBTN" value="Register" class="btn btn-primary">
                </div>
            </div>
        </form>
    </article>

    <footer>
        <%@include file="shared/footer.jsp" %>
    </footer>
</div>
</body>
</html>
