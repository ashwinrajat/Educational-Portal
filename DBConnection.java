/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


/**
 *
 * @author ashwi
 */
package com.learnhub;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/learnhub";

    private static final String USER =
            "root";

    private static final String PASSWORD =
            "Mysql@123";

    public static Connection getConnection() {

        Connection con = null;

        try {

            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Create database connection
            con = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

            System.out.println("Database connected successfully!");

        } catch (ClassNotFoundException e) {

            System.out.println("MySQL Driver not found!");

        } catch (SQLException e) {

            System.out.println("Database connection failed!");
        }

        return con;
    }
}
