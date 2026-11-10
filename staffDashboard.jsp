
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    String role = (String) session.getAttribute("role");
    String staffName = (String) session.getAttribute("staffName");
    String staffEmail = (String) session.getAttribute("staffEmail");

    // Prevent access without a valid staff login session
    if (!"staff".equals(role) || staffName == null) {
        response.sendRedirect(
            request.getContextPath() + "/login.jsp");
        return;
    }

    if (staffEmail == null) {
        staffEmail = "";
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Win's LearnHub - Staff Dashboard</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            min-height: 100vh;
            background: #f1f5f9;
            color: #1e293b;
        }

        /* Top navigation */
        .navbar {
            min-height: 75px;
            padding: 16px 5%;
            background: linear-gradient(
                120deg, #0f172a, #164e63, #312e81
            );
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
        }

        .brand {
            font-size: 25px;
            font-weight: bold;
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 18px;
        }

        .profile {
            font-size: 14px;
            color: #e2e8f0;
        }

        .logout-btn {
            display: inline-block;
            padding: 10px 17px;
            background: #ef4444;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: 0.3s;
        }

        .logout-btn:hover {
            background: #dc2626;
        }

        /* Main content */
        .container {
            max-width: 1250px;
            margin: 0 auto;
            padding: 35px 5%;
        }

        /* Welcome banner */
        .welcome-banner {
            background: linear-gradient(
                120deg, #164e63, #2563eb, #4338ca
            );
            color: white;
            padding: 38px;
            border-radius: 20px;
            margin-bottom: 32px;
            box-shadow: 0 10px 25px rgba(37, 99, 235, 0.18);
        }

        .welcome-banner h1 {
            font-size: clamp(27px, 4vw, 38px);
            margin-bottom: 13px;
        }

        .welcome-banner p {
            color: #e0f2fe;
            line-height: 1.7;
            font-size: 16px;
        }

        .email {
            margin-top: 12px;
            font-size: 14px;
            color: #dbeafe;
            overflow-wrap: anywhere;
        }

        /* Section title */
        .section-title {
            font-size: 25px;
            margin-bottom: 20px;
        }

        /* Dashboard cards */
        .dashboard-grid {
            display: grid;
            grid-template-columns:
                repeat(auto-fit, minmax(220px, 1fr));
            gap: 22px;
            margin-bottom: 35px;
        }

        .dashboard-card {
            background: white;
            padding: 25px;
            border-radius: 16px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 5px 18px rgba(15, 23, 42, 0.05);
            transition: transform 0.25s, box-shadow 0.25s;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(15, 23, 42, 0.1);
        }

        .card-icon {
            width: 55px;
            height: 55px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #eff6ff;
            border-radius: 14px;
            font-size: 28px;
            margin-bottom: 18px;
        }

        .dashboard-card h3 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .dashboard-card p {
            color: #64748b;
            font-size: 14px;
            line-height: 1.7;
        }

        .card-link {
            display: inline-block;
            margin-top: 17px;
            color: #2563eb;
            text-decoration: none;
            font-weight: bold;
        }

        .card-link:hover {
            text-decoration: underline;
        }

        /* Staff information */
        .staff-info {
            background: white;
            padding: 28px;
            border-radius: 16px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 5px 18px rgba(15, 23, 42, 0.05);
        }

        .staff-info h2 {
            margin-bottom: 20px;
        }

        .info-row {
            padding: 15px 0;
            border-bottom: 1px solid #e2e8f0;
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 20px;
        }

        .info-row:last-child {
            border-bottom: none;
        }

        .info-label {
            color: #64748b;
            font-weight: bold;
        }

        .info-value {
            text-align: right;
            overflow-wrap: anywhere;
        }

        /* Footer */
        footer {
            padding: 25px 15px;
            margin-top: 25px;
            text-align: center;
            color: #64748b;
            font-size: 14px;
        }

        @media (max-width: 600px) {
            .navbar {
                padding: 18px 5%;
            }

            .brand {
                font-size: 21px;
            }

            .nav-right {
                width: 100%;
                justify-content: space-between;
                flex-wrap: wrap;
            }

            .container {
                padding: 25px 4%;
            }

            .welcome-banner {
                padding: 25px;
            }

            .info-row {
                flex-direction: column;
                gap: 8px;
            }

            .info-value {
                text-align: left;
            }
        }
    </style>
</head>
<body>
    <header class="navbar">
        <div class="brand">
            🎓 Win's LearnHub
        </div>
        <div class="nav-right">
            <span class="profile">
                👤 <%= staffName %>
            </span>
            <a class="logout-btn"
               href="<%= request.getContextPath() %>/LogoutServlet">
                Logout
            </a>
        </div>
    </header>
    <main class="container">
        <section class="welcome-banner">
            <h1>
                Hello, <%= staffName %>! 👋
            </h1>
            <p>
                Welcome back to your Win's LearnHub Staff Dashboard.
            </p>
            <p>
                Manage your courses, view student information,
                and keep your educational activities organized.
            </p>
            <div class="email">
                📧 <%= staffEmail %>
            </div>
        </section>
        <h2 class="section-title">Your Workspace</h2>
        <section class="dashboard-grid">
            <article class="dashboard-card">
                <div class="card-icon">📚</div>
                <h3>Courses</h3>
                <p>
                    Access your course materials and organize
                    learning resources for students.
                </p>
                <a class="card-link"
                   href="<%= request.getContextPath() %>/courses.jsp">
                    Explore Courses →
                </a>
            </article>
            <article class="dashboard-card">
                <div class="card-icon">👨‍🎓</div>
                <h3>Students</h3>
                <p>
                    View student information and help manage
                    student learning activities.
                </p>
                <a class="card-link"
                   href="<%= request.getContextPath() %>/students.jsp">
                    View Students →
                </a>
            </article>
            <article class="dashboard-card">
                <div class="card-icon">📊</div>
                <h3>Attendance</h3>
                <p>
                    Access attendance-related activities and
                    keep student records organized.
                </p>
                <a class="card-link"
                   href="<%= request.getContextPath() %>/attendance.jsp">
                    View Attendance →
                </a>
            </article>
            <article class="dashboard-card">
                <div class="card-icon">📝</div>
                <h3>Marks & Results</h3>
                <p>
                    Access academic performance and marks
                    management features.
                </p>
                <a class="card-link"
                   href="<%= request.getContextPath() %>/marks.jsp">
                    View Results →
                </a>
            </article>
        </section>
        <section class="staff-info">
            <h2>👤 My Staff Profile</h2>
            <div class="info-row">
                <span class="info-label">Staff Name</span>
                <span class="info-value"><%= staffName %></span>
            </div>
            <div class="info-row">
                <span class="info-label">Email Address</span>
                <span class="info-value"><%= staffEmail %></span>
            </div>
            <div class="info-row">
                <span class="info-label">Account Type</span>
                <span class="info-value">Staff Member</span>
            </div>
            <div class="info-row">
                <span class="info-label">Portal</span>
                <span class="info-value">Win's LearnHub</span>
            </div>
        </section>
    </main>
    <footer>
        © 2026 Win's LearnHub. All rights reserved.
    </footer>
</body>
</html>
