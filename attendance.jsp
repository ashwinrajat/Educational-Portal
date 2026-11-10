<%-- 
    Document   : attendance
    Created on : Oct 3, 2026, 12:19:42 PM
    Author     : ashwi
--%>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    // ==============================
    // ATTENDANCE DATA
    // ==============================

    String[] subjects = {
        "Java Programming",
        "Web Development",
        "Database Management",
        "Python Programming",
        "Data Structures",
        "Spring Boot"
    };

    int[] totalClasses = {
        40,
        35,
        30,
        32,
        38,
        25
    };

    int[] attendedClasses = {
        36,
        30,
        27,
        28,
        32,
        21
    };

    // Calculate total attendance
    int total = 0;
    int attended = 0;

    for (int i = 0; i < totalClasses.length; i++) {
        total = total + totalClasses[i];
        attended = attended + attendedClasses[i];
    }

    double overallAttendance =
            ((double) attended / total) * 100;

    int overallPercentage =
            (int) overallAttendance;
%>


<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Attendance - Win's LearnHub</title>


    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }


        body {

            font-family: Arial, sans-serif;

            background:
                linear-gradient(
                    135deg,
                    #0f2027,
                    #203a43,
                    #2c5364
                );

            color: white;

            min-height: 100vh;
        }


        /* ================= NAVBAR ================= */

        .navbar {

            height: 70px;

            display: flex;

            align-items: center;

            justify-content: space-between;

            padding: 0 50px;

            background:
                rgba(0, 0, 0, 0.45);

            backdrop-filter: blur(10px);
        }


        .logo {

            font-size: 25px;

            font-weight: bold;

            color: #00e5ff;
        }


        .nav-links {

            display: flex;

            gap: 25px;
        }


        .nav-links a {

            color: white;

            text-decoration: none;

            transition: 0.3s;
        }


        .nav-links a:hover {

            color: #00e5ff;
        }


        .logout {

            padding: 9px 18px;

            border-radius: 20px;

            background: #00e5ff;

            color: #001018;

            text-decoration: none;

            font-weight: bold;
        }


        /* ================= HEADER ================= */

        .page-header {

            text-align: center;

            padding: 55px 20px 35px;
        }


        .page-header h1 {

            font-size: 45px;

            margin-bottom: 12px;
        }


        .page-header h1 span {

            color: #00e5ff;
        }


        .page-header p {

            color: #b9c6cd;

            font-size: 18px;
        }


        /* ================= OVERALL CARD ================= */

        .overall-container {

            width: 90%;

            max-width: 1000px;

            margin: auto;

            padding: 35px;

            text-align: center;

            border-radius: 25px;

            background:
                rgba(255,255,255,0.09);

            backdrop-filter: blur(12px);

            border:
                1px solid
                rgba(255,255,255,0.1);
        }


        .percentage {

            font-size: 60px;

            font-weight: bold;

            color: #00e5ff;

            margin: 10px 0;
        }


        .overall-container p {

            color: #b9c6cd;
        }


        /* ================= PROGRESS ================= */

        .overall-progress {

            width: 80%;

            height: 12px;

            margin: 25px auto;

            background:
                rgba(255,255,255,0.15);

            border-radius: 20px;

            overflow: hidden;
        }


        .overall-progress-bar {

            height: 100%;

            width: <%= overallPercentage %>%;

            background:
                linear-gradient(
                    90deg,
                    #00e5ff,
                    #7b2ff7
                );

            border-radius: 20px;
        }


        /* ================= TABLE ================= */

        .attendance-container {

            width: 90%;

            max-width: 1100px;

            margin: 45px auto 70px;

            padding: 30px;

            border-radius: 25px;

            background:
                rgba(255,255,255,0.08);

            backdrop-filter: blur(10px);

            overflow-x: auto;
        }


        .attendance-container h2 {

            margin-bottom: 25px;

            color: #00e5ff;
        }


        table {

            width: 100%;

            border-collapse: collapse;
        }


        th {

            padding: 18px;

            text-align: left;

            background:
                rgba(0,229,255,0.12);

            color: #00e5ff;
        }


        td {

            padding: 18px;

            border-bottom:
                1px solid
                rgba(255,255,255,0.1);

            color: #dce4e8;
        }


        tr {

            transition: 0.3s;
        }


        tr:hover {

            background:
                rgba(0,229,255,0.08);
        }


        /* ================= STATUS ================= */

        .good {

            color: #00ff9d;

            font-weight: bold;
        }


        .warning {

            color: #ffd166;

            font-weight: bold;
        }


        .danger {

            color: #ff6b6b;

            font-weight: bold;
        }


        /* ================= FOOTER ================= */

        footer {

            text-align: center;

            padding: 30px;

            background:
                rgba(0,0,0,0.4);

            color: #aebbc4;
        }


        footer h3 {

            color: #00e5ff;

            margin-bottom: 8px;
        }


        /* ================= RESPONSIVE ================= */

        @media(max-width:700px) {

            .navbar {

                padding: 0 20px;
            }

            .nav-links {

                display: none;
            }

            .page-header h1 {

                font-size: 35px;
            }

            .percentage {

                font-size: 45px;
            }

            .overall-progress {

                width: 100%;
            }

        }

    </style>

</head>


<body>


<!-- ================= NAVBAR ================= -->

<nav class="navbar">

    <div class="logo">
        🎓 LearnHub
    </div>


    <div class="nav-links">

        <a href="studentDashboard.jsp">
            Dashboard
        </a>

        <a href="courses.jsp">
            Courses
        </a>

        <a href="attendance.jsp">
            Attendance
        </a>

        <a href="marks.jsp">
            Marks
        </a>

    </div>


    <a href="login.html" class="logout">
        Logout
    </a>

</nav>



<!-- ================= HEADER ================= -->

<section class="page-header">

    <h1>

        My <span>Attendance</span> 📊

    </h1>

    <p>

        Track your class attendance and academic participation

    </p>

</section>



<!-- ================= OVERALL ATTENDANCE ================= -->

<section class="overall-container">

    <p>
        Overall Attendance
    </p>


    <div class="percentage">

        <%= overallPercentage %>%

    </div>


    <p>

        Attended
        <strong>
            <%= attended %>
        </strong>

        out of

        <strong>
            <%= total %>
        </strong>

        classes

    </p>


    <div class="overall-progress">

        <div class="overall-progress-bar"></div>

    </div>

</section>



<!-- ================= SUBJECT ATTENDANCE ================= -->

<section class="attendance-container">

    <h2>
        📚 Subject-wise Attendance
    </h2>


    <table>

        <tr>

            <th>
                Subject
            </th>

            <th>
                Total Classes
            </th>

            <th>
                Attended
            </th>

            <th>
                Percentage
            </th>

            <th>
                Status
            </th>

        </tr>


<%

    for (int i = 0;
         i < subjects.length;
         i++) {

        double percentage =
            ((double) attendedClasses[i]
            / totalClasses[i]) * 100;

%>


        <tr>

            <td>
                <%= subjects[i] %>
            </td>


            <td>
                <%= totalClasses[i] %>
            </td>


            <td>
                <%= attendedClasses[i] %>
            </td>


            <td>

                <%= String.format(
                    "%.1f",
                    percentage
                ) %>%

            </td>


            <td>

<%

        if (percentage >= 75) {

%>

            <span class="good">
                Good
            </span>

<%

        } else if (percentage >= 60) {

%>

            <span class="warning">
                Warning
            </span>

<%

        } else {

%>

            <span class="danger">
                Low
            </span>

<%

        }

%>

            </td>

        </tr>


<%

    }

%>


    </table>

</section>



<!-- ================= FOOTER ================= -->

<footer>

    <h3>
        🎓 Win's LearnHub
    </h3>

    <p>
        Learn. Grow. Succeed.
    </p>

    <p>
        © 2026 Win's LearnHub. All Rights Reserved.
    </p>

</footer>


</body>

</html>
