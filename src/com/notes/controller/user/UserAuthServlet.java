package com.notes.controller.user;

import com.notes.model.User;
import com.notes.service.UserService;
import com.notes.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UserAuthServlet",
        urlPatterns = "/user/authenticate")
public class UserAuthServlet extends HttpServlet {
    private UserService userService;

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public void init() throws ServletException {
        this.userService = new UserServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = new User();
        user.setEmailId(req.getParameter("emailId"));
        user.setPassword(req.getParameter("password"));
        if (user.isValidUserDataForLogin()) {
            try {
                user = getUserService().doAuthenticateUser(user);
                if (user != null) {
                    req.getSession().setAttribute("user", user);
                    resp.sendRedirect("/home.jsp");
                } else {
                    resp.sendRedirect("/login.jsp");
                }
            } catch (SQLException | NullPointerException e) {
                e.printStackTrace();
                resp.sendRedirect("/login.jsp");
            }
        }
    }
}
