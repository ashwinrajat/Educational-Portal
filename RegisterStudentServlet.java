package com.learnhub;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/RegisterStudentServlet")
public class RegisterStudentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        // Get values from HTML form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String course = request.getParameter("course");

        // Remove spaces
        if (name != null) {
            name = name.trim();
        }

        if (email != null) {
            email = email.trim();
        }

        if (password != null) {
            password = password.trim();
        }

        if (phone != null) {
            phone = phone.trim();
        }

        if (course != null) {
            course = course.trim();
        }

        // Check required fields
        if (name == null || name.isEmpty()
                || email == null || email.isEmpty()
                || password == null || password.isEmpty()
                || course == null || course.isEmpty()) {

            response.sendRedirect("studentRegister.html");
            return;
        }

        String sql =
                "INSERT INTO students "
                + "(name, email, password, phone, course) "
                + "VALUES (?, ?, ?, ?, ?)";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            // Check database connection
            if (con == null) {
                response.setContentType("text/html;charset=UTF-8");

                response.getWriter().println(
                    "<h2>Database connection failed!</h2>"
                );

                return;
            }

            // Set values
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, phone);
            ps.setString(5, course);

            // Execute INSERT
            int result = ps.executeUpdate();

            if (result > 0) {

                // Create session
                HttpSession session = request.getSession();

                // Store registered student's name
                session.setAttribute(
                    "registeredStudentName",
                    name
                );

                // Store email also
                session.setAttribute(
                    "registeredStudentEmail",
                    email
                );

                // Open success JSP
                response.sendRedirect(
                    "registrationSuccess.jsp"
                );

            } else {

                response.setContentType(
                    "text/html;charset=UTF-8"
                );

                response.getWriter().println(
                    "<h2>Registration Failed!</h2>"
                );

                response.getWriter().println(
                    "<a href='studentRegister.html'>Try Again</a>"
                );
            }

        } catch (SQLException e) {

            e.printStackTrace();

            response.setContentType(
                "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                "<h2>Registration Error</h2>"
            );

            // Duplicate email
            if (e.getMessage() != null
                    && e.getMessage().contains("Duplicate")) {

                response.getWriter().println(
                    "<p>Email already registered.</p>"
                );

            } else {

                response.getWriter().println(
                    "<p>" + e.getMessage() + "</p>"
                );
            }

            response.getWriter().println(
                "<br>"
                + "<a href='studentRegister.html'>"
                + "Go Back"
                + "</a>"
            );
        }
    }
}