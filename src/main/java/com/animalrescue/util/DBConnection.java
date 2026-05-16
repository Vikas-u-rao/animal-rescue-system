
package com.animalrescue.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // Make sure to match this with your local MySQL setup
    private static final String URL = "jdbc:mysql://localhost:3306/animal_rescue?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "password"; // Change this to your local MySQL password

    public static Connection getConnection() throws SQLException {
        try {
            // Load the MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver completely missing.", e);
        }
        
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
