/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.learnhub;

/**
 *
 * @author ashwi
 */


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        if (email == null || password == null || role == null
                || email.trim().isEmpty()
                || password.isEmpty()
                || role.trim().isEmpty()) {

            response.sendRedirect(
                request.getContextPath() + "/login.jsp?error=missing");
            return;
        }

        String table;

        if ("staff".equalsIgnoreCase(role)) {
            table = "staff";
        } else if ("student".equalsIgnoreCase(role)) {
            table = "students";
        } else {
            response.sendRedirect(
                request.getContextPath() + "/login.jsp?error=invalid");
            return;
        }

        String sql = "SELECT name, email FROM " + table
                   + " WHERE email = ? AND password = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email.trim());
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    HttpSession session = request.getSession();
                    session.setAttribute("userEmail", rs.getString("email"));
                    session.setAttribute("userRole", role.toLowerCase());

                    if ("staff".equalsIgnoreCase(role)) {

                        session.setAttribute(
                            "staffName", rs.getString("name"));

                        response.sendRedirect(
                            request.getContextPath()
                            + "/staffDashboard.jsp");

                    } else {

                        session.setAttribute(
                            "studentName", rs.getString("name"));

                        response.sendRedirect(
                            request.getContextPath()
                            + "/studentDashboard.jsp");
                    }

                } else {
                    response.sendRedirect(
                        request.getContextPath()
                        + "/login.jsp?error=invalid");
                }
            }

        } catch (Exception e) {
            log("Login failed", e);

            response.sendRedirect(
                request.getContextPath() + "/login.jsp?error=server");
        }
    }
}
