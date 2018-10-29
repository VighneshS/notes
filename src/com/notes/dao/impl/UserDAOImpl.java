package com.notes.dao.impl;

import com.notes.dao.UserDAO;
import com.notes.model.User;

import javax.servlet.ServletConfig;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAOImpl implements UserDAO {

    private Connection connection;
    private ServletConfig config;
    private String driverClass = "com.mysql.cj.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/notes";
    private String dbUserName = "root";
    private String dbPassword = "pass123$";

    public UserDAOImpl() {
        try {
            Class.forName(driverClass).newInstance();
            this.connection = DriverManager.getConnection(url, dbUserName, dbPassword);
        } catch (SQLException | IllegalAccessException | InstantiationException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    @Override
    public boolean checkIfUserAlreadyExists(User user) throws SQLException {
        String query = "select if (EXISTS(select u.ID from users u where u.EMAIL_ID=?),1 ,0)";
        PreparedStatement preparedStatement = getConnection().prepareStatement(query);
        preparedStatement.setString(1, user.getEmailId());
        ResultSet result = preparedStatement.executeQuery();
        result.first();
        return result.getBoolean(1);
    }

    @Override
    public boolean registerUser(User user) throws SQLException {
        String query = "insert into users (USER_NAME, EMAIL_ID, PASSWORD) values (?,?,?)";
        PreparedStatement preparedStatement = getConnection().prepareStatement(query);
        preparedStatement.setString(1, user.getUserName());
        preparedStatement.setString(2, user.getEmailId());
        preparedStatement.setString(3, user.getPassword());
        return preparedStatement.executeUpdate() > 0;
    }

    @Override
    public boolean authenticateUser(User user) throws SQLException {
        String query = "select if (EXISTS(select u.ID from users u where u.EMAIL_ID=? and u.PASSWORD=?),1 ,0)";
        PreparedStatement preparedStatement = getConnection().prepareStatement(query);
        preparedStatement.setString(1, user.getUserName());
        preparedStatement.setString(2, user.getPassword());
        ResultSet result = preparedStatement.executeQuery();
        result.first();
        return result.getBoolean(1);
    }
}
