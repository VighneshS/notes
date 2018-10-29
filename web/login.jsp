<%--
  Created by IntelliJ IDEA.
  User: jeeva
  Date: 29-10-2018
  Time: 0:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<header>
    <%@include file="shared/header.jsp"%>
</header>

<article>
    <h1>Register</h1>
    <form name="registrationForm" class="form-horizontal" action="registerUser.jsp" method="post">
        <div class="form-group">
            <label class="col-md-2 custom-control-label">Email: </label>
            <div class="col-md-4">
                <input type="email" placeholder="Enter your email" class="form-control" name="emailId" required="required"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-2 custom-control-label">Password: </label>
            <div class="col-md-4">
                <input type="password" placeholder="Enter your password" class="form-control" name="password" required="required"/>
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-4 col-md-offset-2">
                <input type="submit" title="Click here to Log In" name="loginBTN" value="Log In" class="btn btn-primary">
            </div>
        </div>
    </form>
</article>

<footer>
    <%@include file="shared/footer.jsp"%>
</footer>
</body>
</html>
