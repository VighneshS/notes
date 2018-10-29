package com.notes.service.impl;

import com.notes.dao.UserDAO;
import com.notes.dao.impl.UserDAOImpl;
import com.notes.model.User;
import com.notes.service.UserService;

import java.sql.SQLException;

public class UserServiceImpl implements UserService {
    private UserDAO userDAO;

    public UserServiceImpl() {
        this.userDAO = new UserDAOImpl();
    }

    public UserDAO getUserDAO() {
        return userDAO;
    }

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    public boolean doRegisterUser(User user) throws SQLException {
        return userDAO.checkIfUserAlreadyExists(user);
    }

    @Override
    public User doAuthenticateUser(User user) throws SQLException {
        return userDAO.authenticateUser(user);
    }

}
