
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

@WebServlet("/RegisterStaffServlet")
public class RegisterStaffServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String department = request.getParameter("department");
        String password = request.getParameter("password");
        String confirmPassword =
                request.getParameter("confirmPassword");

        // 1. Validate required fields
        if (isBlank(name) || isBlank(email) || isBlank(phone)
                || isBlank(department) || isBlank(password)
                || isBlank(confirmPassword)) {

            redirectWithError(request, response, "missing");
            return;
        }

        name = name.trim();
        email = email.trim();
        phone = phone.trim();
        department = department.trim();

        // 2. Validate phone number
        if (!phone.matches("[0-9]{10}")) {
            redirectWithError(request, response, "phone");
            return;
        }

        // 3. Check password confirmation
        if (!password.equals(confirmPassword)) {
            redirectWithError(request, response, "password");
            return;
        }

        // 4. Insert staff details into MySQL
        String sql = "INSERT INTO staff "
                + "(name, email, password, phone, department) "
                + "VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, phone);
            ps.setString(5, department);

            int rowsInserted = ps.executeUpdate();

            // 5. Redirect only after successful insertion
            if (rowsInserted == 1) {
                response.sendRedirect(
                    request.getContextPath()
                    + "/staffRegistrationSuccess.jsp"
                );
                return;
            }

            redirectWithError(request, response, "insert");

        } catch (SQLException e) {

            // Print the actual database error in NetBeans Output
            getServletContext().log(
                "Error registering staff", e
            );

            if ("23000".equals(e.getSQLState())) {
                redirectWithError(request, response, "duplicate");
            } else {
                redirectWithError(request, response, "database");
            }

        } catch (Exception e) {

            getServletContext().log(
                "Unexpected staff registration error", e
            );

            redirectWithError(request, response, "server");
        }
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }

    private void redirectWithError(
            HttpServletRequest request,
            HttpServletResponse response,
            String error) throws IOException {

        response.sendRedirect(
            request.getContextPath()
            + "/staffRegister.html?error=" + error
        );
    }
}
