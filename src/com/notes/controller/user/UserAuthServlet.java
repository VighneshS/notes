package com.notes.controller.user;

import com.google.gson.Gson;
import com.notes.model.User;
import com.notes.service.UserService;
import com.notes.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserAuthServlet",
            urlPatterns = "/user/authenticate")
public class UserAuthServlet extends HttpServlet{
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
        Gson gson = new Gson();
        User user = gson.fromJson(req.getReader(), User.class);
        System.out.println(user.toString());
        resp.setStatus(200);
    }
}
