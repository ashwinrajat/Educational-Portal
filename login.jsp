
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.learnhub.DBConnection" %>

<%
    String errorMessage = "";

    String selectedRole = request.getParameter("role");

    if (!"staff".equals(selectedRole)
            && !"student".equals(selectedRole)) {
        selectedRole = "student";
    }

    if ("POST".equalsIgnoreCase(request.getMethod())) {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        if (email == null || password == null || role == null
                || email.trim().isEmpty()
                || password.isEmpty()
                || (!"student".equals(role)
                    && !"staff".equals(role))) {

            errorMessage =
                "Please enter your email, password, and login type.";

        } else {

            String sql;

            if ("staff".equals(role)) {
                sql = "SELECT staff_id, name, email FROM staff "
                    + "WHERE email = ? AND password = ?";
            } else {
                sql = "SELECT student_id, name, email FROM students "
                    + "WHERE email = ? AND password = ?";
            }

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {

                if (con == null) {
                    throw new Exception("Database connection is unavailable.");
                }

                ps.setString(1, email.trim());
                ps.setString(2, password);

                try (ResultSet rs = ps.executeQuery()) {

                    if (rs.next()) {

                        // Create a session for the logged-in user
                        HttpSession userSession =
                            request.getSession(true);

                        userSession.setAttribute("role", role);
                        userSession.setAttribute(
                            "userEmail", rs.getString("email"));
                        userSession.setAttribute(
                            "userName", rs.getString("name"));

                        if ("staff".equals(role)) {

                            userSession.setAttribute(
                                "staffName", rs.getString("name"));
                            userSession.setAttribute(
                                "staffEmail", rs.getString("email"));
                            userSession.setAttribute(
                                "staffId", rs.getInt("staff_id"));

                            response.sendRedirect(
                                request.getContextPath()
                                + "/staffDashboard.jsp");
                            return;

                        } else {

                            userSession.setAttribute(
                                "studentName", rs.getString("name"));
                            userSession.setAttribute(
                                "studentEmail", rs.getString("email"));
                            userSession.setAttribute(
                                "studentId", rs.getInt("student_id"));

                            response.sendRedirect(
                                request.getContextPath()
                                + "/studentDashboard.jsp");
                            return;
                        }

                    } else {
                        errorMessage =
                            "Invalid email or password. "
                            + "Please check your login details.";
                    }
                }

            } catch (Exception e) {

                application.log("LearnHub login error", e);

                errorMessage =
                    "Login failed due to a server or database error. "
                    + "Please check the NetBeans Output window.";
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Win's LearnHub - Login</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 25px;
            background: linear-gradient(
                135deg, #0f2027, #203a43, #2c5364
            );
        }

        .login-container {
            width: 100%;
            max-width: 430px;
            background: white;
            padding: 35px;
            border-radius: 18px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.3);
            animation: appear 0.6s ease;
        }

        @keyframes appear {
            from {
                opacity: 0;
                transform: translateY(20px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .logo {
            text-align: center;
            font-size: 29px;
            font-weight: bold;
            color: #203a43;
            margin-bottom: 10px;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
            margin-bottom: 25px;
        }

        label {
            display: block;
            margin: 16px 0 8px;
            font-weight: bold;
            color: #334155;
        }

        input, select {
            width: 100%;
            padding: 13px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 15px;
            outline: none;
        }

        input:focus, select:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 3px
                rgba(37, 99, 235, 0.12);
        }

        .login-button {
            width: 100%;
            margin-top: 24px;
            padding: 14px;
            border: none;
            border-radius: 8px;
            color: white;
            background: #2563eb;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .login-button:hover {
            background: #1d4ed8;
            transform: translateY(-2px);
        }

        .error {
            margin-bottom: 15px;
            padding: 12px;
            background: #fee2e2;
            color: #b91c1c;
            border-radius: 8px;
            font-size: 14px;
            line-height: 1.5;
        }

        .links {
            margin-top: 22px;
            text-align: center;
            line-height: 2;
            color: #475569;
            font-size: 14px;
        }

        .links a {
            color: #2563eb;
            text-decoration: none;
        }

        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

<div class="login-container">

    <div class="logo">🎓 Win's LearnHub</div>

    <p class="subtitle">Welcome back! Please log in.</p>

    <% if (!errorMessage.isEmpty()) { %>
        <div class="error" role="alert">
            <%= errorMessage %>
        </div>
    <% } %>

    <form action="<%= request.getContextPath() %>/login.jsp"
          method="post">

        <label for="role">Login As</label>

        <select name="role" id="role" required>
            <option value="student"
                <%= "student".equals(selectedRole)
                    ? "selected" : "" %>>
                Student Login
            </option>

            <option value="staff"
                <%= "staff".equals(selectedRole)
                    ? "selected" : "" %>>
                Staff Login
            </option>
        </select>

        <label for="email">Email Address</label>

        <input type="email"
               id="email"
               name="email"
               placeholder="Enter your registered email"
               autocomplete="username"
               required>

        <label for="password">Password</label>

        <input type="password"
               id="password"
               name="password"
               placeholder="Enter your password"
               autocomplete="current-password"
               required>

        <button type="submit" class="login-button">
            Login Now
        </button>

    </form>

    <div class="links">

        <p>New student?
            <a href="studentRegister.html">Register here</a>
        </p>

        <p>New staff member?
            <a href="staffRegister.html">Register here</a>
        </p>

        <p>
            <a href="index.html">← Back to Home</a>
        </p>

    </div>

</div>

</body>
</html>
