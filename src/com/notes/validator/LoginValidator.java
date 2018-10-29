package com.notes.validator;

import com.notes.model.User;
import com.notes.service.UserService;
import com.notes.service.impl.UserServiceImpl;

public class LoginValidator {
    private String emailId;
    private String password;
    private UserService userService;

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public LoginValidator(String emailId, String password, UserService userService) {
        this.emailId = emailId;
        this.password = password;
        this.userService = new UserServiceImpl();
    }

    /*public boolean isAValidUser(User user) {
        if ()
    }*/
}
