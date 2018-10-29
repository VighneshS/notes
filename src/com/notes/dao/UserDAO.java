package com.notes.dao;

import com.notes.model.User;

import java.sql.SQLException;

public interface UserDAO {
    boolean checkIfUserAlreadyExists(User user) throws SQLException;

    boolean registerUser(User user) throws SQLException;

    User authenticateUser(User user) throws SQLException;
}
