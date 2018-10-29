package com.notes.service;

import com.notes.model.User;

import java.sql.SQLException;

public interface UserService {
    boolean doRegisterUser(User user) throws SQLException;

    boolean doAuthenticateUser(User user) throws SQLException;
}
