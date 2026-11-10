<%-- 
    Document   : students
    Created on : Oct 3, 2026, 12:22:57 PM
    Author     : ashwi
--%>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    // =========================
    // STUDENT DATA
    // =========================

    String[] studentIds = {
        "STU001",
        "STU002",
        "STU003",
        "STU004",
        "STU005",
        "STU006"
    };

    String[] studentNames = {
        "Ashwin",
        "Arun",
        "Priya",
        "Karthik",
        "Divya",
        "Rahul"
    };

    String[] departments = {
        "Computer Science",
        "Computer Science",
        "Information Technology",
        "Computer Science",
        "Information Technology",
        "Computer Science"
    };

    String[] years = {
        "Final Year",
        "Final Year",
        "Third Year",
        "Final Year",
        "Third Year",
        "Second Year"
    };

    int[] attendance = {
        87,
        92,
        78,
        95,
        68,
        82
    };

    String[] emails = {
        "ashwin@gmail.com",
        "arun@gmail.com",
        "priya@gmail.com",
        "karthik@gmail.com",
        "divya@gmail.com",
        "rahul@gmail.com"
    };
%>


<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Win's LearnHub - Students</title>


    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }


        body {

            font-family: Arial, sans-serif;

            min-height: 100vh;

            color: white;

            background:
                linear-gradient(
                    135deg,
                    #0f2027,
                    #203a43,
                    #2c5364
                );
        }


        /* =========================
           NAVBAR
           ========================= */

        .navbar {

            height: 70px;

            display: flex;

            align-items: center;

            justify-content: space-between;

            padding: 0 50px;

            background:
                rgba(0,0,0,0.35);

            backdrop-filter: blur(15px);

            border-bottom:
                1px solid
                rgba(255,255,255,0.15);

            position: sticky;

            top: 0;

            z-index: 100;
        }


        .logo {

            font-size: 25px;

            font-weight: bold;

            color: #00f2ff;

            text-shadow:
                0 0 12px #00f2ff;
        }


        .nav-links {

            display: flex;

            gap: 25px;

            list-style: none;
        }


        .nav-links a {

            color: white;

            text-decoration: none;

            transition: 0.3s;

            font-size: 15px;
        }


        .nav-links a:hover {

            color: #00f2ff;

            text-shadow:
                0 0 10px #00f2ff;
        }


        .logout {

            background: #ff4757;

            padding: 9px 18px;

            border-radius: 20px;
        }


        .logout:hover {

            color: white !important;

            background: #ff6b81;

            box-shadow:
                0 0 15px #ff4757;
        }


        /* =========================
           MAIN
           ========================= */

        .container {

            width: 92%;

            max-width: 1250px;

            margin: 40px auto;
        }


        .heading {

            text-align: center;

            margin-bottom: 35px;
        }


        .heading h1 {

            font-size: 38px;

            color: #00f2ff;

            text-shadow:
                0 0 15px #00f2ff;
        }


        .heading p {

            margin-top: 10px;

            color: #d7e9ed;
        }


        /* =========================
           SUMMARY
           ========================= */

        .summary {

            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 20px;

            margin-bottom: 35px;
        }


        .summary-card {

            padding: 25px;

            text-align: center;

            border-radius: 18px;

            background:
                rgba(255,255,255,0.08);

            border:
                1px solid
                rgba(255,255,255,0.15);

            backdrop-filter: blur(15px);

            transition: 0.4s;
        }


        .summary-card:hover {

            transform:
                translateY(-7px)
                scale(1.02);

            box-shadow:
                0 0 25px
                rgba(0,242,255,0.3);
        }


        .summary-card h2 {

            color: #00f2ff;

            font-size: 32px;

            margin-bottom: 8px;
        }


        .summary-card p {

            color: #ddd;
        }


        /* =========================
           STUDENT TABLE
           ========================= */

        .table-container {

            background:
                rgba(255,255,255,0.08);

            padding: 25px;

            border-radius: 20px;

            border:
                1px solid
                rgba(255,255,255,0.15);

            backdrop-filter: blur(15px);

            overflow-x: auto;
        }


        .table-container h2 {

            text-align: center;

            color: #00f2ff;

            margin-bottom: 20px;
        }


        table {

            width: 100%;

            min-width: 950px;

            border-collapse: collapse;
        }


        th {

            padding: 15px;

            background:
                rgba(0,242,255,0.15);

            color: #00f2ff;
        }


        td {

            padding: 15px;

            text-align: center;

            border-bottom:
                1px solid
                rgba(255,255,255,0.1);
        }


        tr {

            transition: 0.3s;
        }


        tr:hover {

            background:
                rgba(0,242,255,0.08);

            transform: scale(1.01);
        }


        .name {

            font-weight: bold;

            color: white;
        }


        .email {

            color: #bdeff4;
        }


        /* =========================
           ATTENDANCE
           ========================= */

        .attendance {

            font-weight: bold;
        }


        .good {

            color: #00ff88;
        }


        .warning {

            color: #ffc107;
        }


        .danger {

            color: #ff4757;
        }


        /* =========================
           STATUS
           ========================= */

        .status {

            display: inline-block;

            padding: 6px 14px;

            border-radius: 20px;

            font-size: 13px;

            font-weight: bold;
        }


        .active {

            background:
                rgba(0,255,136,0.15);

            color: #00ff88;

            box-shadow:
                0 0 8px
                rgba(0,255,136,0.3);
        }


        /* =========================
           BUTTON
           ========================= */

        .view-btn {

            padding: 7px 14px;

            border: none;

            border-radius: 15px;

            background: #00bcd4;

            color: white;

            cursor: pointer;

            transition: 0.3s;
        }


        .view-btn:hover {

            background: #00f2ff;

            color: #102027;

            box-shadow:
                0 0 15px #00f2ff;

            transform: scale(1.05);
        }


        /* =========================
           FOOTER
           ========================= */

        footer {

            margin-top: 50px;

            padding: 20px;

            text-align: center;

            background:
                rgba(0,0,0,0.3);

            color: #ccc;
        }


        /* =========================
           RESPONSIVE
           ========================= */

        @media(max-width: 800px) {

            .navbar {

                padding: 0 20px;
            }


            .nav-links {

                gap: 10px;
            }


            .summary {

                grid-template-columns: 1fr;
            }


            .heading h1 {

                font-size: 30px;
            }
        }


        @media(max-width: 600px) {

            .nav-links {

                display: none;
            }

            .container {

                width: 95%;
            }
        }

    </style>

</head>


<body>

<nav class="navbar">

    <div class="logo">
        🎓 Win's  LearnHub
    </div>


    <ul class="nav-links">

        <li>
            <a href="staffDashboard.jsp">
                Dashboard
            </a>
        </li>

        <li>
            <a href="students.jsp">
                Students
            </a>
        </li>

        <li>
            <a href="courses.jsp">
                Courses
            </a>
        </li>

        <li>
            <a href="attendance.jsp">
                Attendance
            </a>
        </li>

        <li>
            <a href="marks.jsp">
                Marks
            </a>
        </li>

        <li>
            <a href="login.html" class="logout">
                Logout
            </a>
        </li>

    </ul>

</nav>


<!-- =========================
     MAIN CONTAINER
     ========================= -->

<div class="container">


    <div class="heading">

        <h1>👨‍🎓 Student Management</h1>

        <p>
            View and manage registered students
        </p>

    </div>


    <!-- =========================
         SUMMARY CARDS
         ========================= -->

    <div class="summary">


        <div class="summary-card">

            <h2>
                <%= studentNames.length %>
            </h2>

            <p>
                Total Students
            </p>

        </div>


        <div class="summary-card">

            <h2>
                4
            </h2>

            <p>
                Final Year Students
            </p>

        </div>


        <div class="summary-card">

            <h2>
                83%
            </h2>

            <p>
                Average Attendance
            </p>

        </div>


    </div>


    <!-- =========================
         STUDENT TABLE
         ========================= -->

    <div class="table-container">

        <h2>
            📋 Registered Students
        </h2>


        <table>

            <tr>

                <th>
                    S.No
                </th>

                <th>
                    Student ID
                </th>

                <th>
                    Student Name
                </th>

                <th>
                    Department
                </th>

                <th>
                    Year
                </th>

                <th>
                    Email
                </th>

                <th>
                    Attendance
                </th>

                <th>
                    Status
                </th>

                <th>
                    Action
                </th>

            </tr>


            <!-- =========================
                 JSP FOR LOOP
                 ========================= -->

            <%
                for (int i = 0;
                     i < studentNames.length;
                     i++) {
            %>


            <tr>

                <td>
                    <%= i + 1 %>
                </td>


                <td>
                    <%= studentIds[i] %>
                </td>


                <td class="name">
                    👤 <%= studentNames[i] %>
                </td>


                <td>
                    <%= departments[i] %>
                </td>


                <td>
                    <%= years[i] %>
                </td>


                <td class="email">
                    <%= emails[i] %>
                </td>


                <!-- ATTENDANCE -->

                <td class="attendance">


                    <%
                        if (attendance[i] >= 75) {
                    %>

                        <span class="good">
                            <%= attendance[i] %>%
                        </span>

                    <%
                        } else if (attendance[i] >= 60) {
                    %>

                        <span class="warning">
                            <%= attendance[i] %>%
                        </span>

                    <%
                        } else {
                    %>

                        <span class="danger">
                            <%= attendance[i] %>%
                        </span>

                    <%
                        }
                    %>


                </td>


                <!-- STATUS -->

                <td>

                    <span class="status active">
                        Active
                    </span>

                </td>


                <!-- ACTION -->

                <td>

                    <button
                        class="view-btn"
                        onclick="alert('Student: <%= studentNames[i] %>')">

                        View

                    </button>

                </td>

            </tr>


            <%
                }
            %>


        </table>

    </div>


</div>


<!-- =========================
     FOOTER
     ========================= -->

<footer>

    © 2026 Win's LearnHub Educational Portal
    |
    Staff Student Management

</footer>


</body>

</html>
