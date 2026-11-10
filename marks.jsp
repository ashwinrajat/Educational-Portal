<%-- 
    Document   : marks
    Created on : Oct 3, 2026, 12:21:09 PM
    Author     : ashwi
--%>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    // =========================
    // STUDENT INFORMATION
    // =========================

    String studentName = "Ashwin";
    String studentId = "STU001";
    String course = "Computer Science";


    // =========================
    // SUBJECT DETAILS
    // =========================

    String[] subjects = {
        "Java Programming",
        "Web Development",
        "Database Management",
        "Python Programming",
        "Data Structures",
        "Spring Boot"
    };


    // Internal marks
    int[] internalMarks = {
        25, 23, 24, 22, 21, 20
    };


    // External marks
    int[] externalMarks = {
        65, 60, 68, 62, 64, 58
    };


    // =========================
    // OVERALL CALCULATION
    // =========================

    int totalMarks = 0;
    int passedSubjects = 0;

    for (int i = 0; i < subjects.length; i++) {

        int subjectTotal =
                internalMarks[i] + externalMarks[i];

        totalMarks = totalMarks + subjectTotal;

        if (subjectTotal >= 40) {
            passedSubjects++;
        }
    }


    int maximumMarks = subjects.length * 100;

    double overallPercentage =
            ((double) totalMarks / maximumMarks) * 100;

    double average =
            (double) totalMarks / subjects.length;
%>


<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Win's LearnHub - Marks</title>


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

            min-height: 100vh;

            color: white;
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

            background: rgba(0,0,0,0.35);

            backdrop-filter: blur(15px);

            border-bottom: 1px solid
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
                0 0 10px #00f2ff;
        }


        .nav-links {

            display: flex;

            gap: 25px;

            list-style: none;
        }


        .nav-links a {

            color: white;

            text-decoration: none;

            font-size: 15px;

            transition: 0.3s;
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

            color: white !important;
        }


        .logout:hover {

            background: #ff6b81;

            box-shadow:
                0 0 15px #ff4757;
        }


        /* =========================
           MAIN CONTAINER
           ========================= */

        .container {

            width: 90%;

            max-width: 1200px;

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

            color: #d8e9ed;

            font-size: 16px;
        }


        /* =========================
           STUDENT INFO
           ========================= */

        .student-info {

            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 20px;

            margin-bottom: 30px;
        }


        .info-box {

            background:
                rgba(255,255,255,0.08);

            border:
                1px solid
                rgba(255,255,255,0.15);

            padding: 20px;

            border-radius: 15px;

            backdrop-filter: blur(12px);

            transition: 0.4s;
        }


        .info-box:hover {

            transform: translateY(-5px);

            box-shadow:
                0 0 20px
                rgba(0,242,255,0.3);
        }


        .info-box h3 {

            color: #00f2ff;

            margin-bottom: 8px;
        }


        .info-box p {

            font-size: 17px;
        }


        /* =========================
           SUMMARY CARDS
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
                linear-gradient(
                    145deg,
                    rgba(255,255,255,0.12),
                    rgba(255,255,255,0.04)
                );

            border:
                1px solid
                rgba(255,255,255,0.15);

            backdrop-filter: blur(15px);

            transition: 0.4s;
        }


        .summary-card:hover {

            transform:
                translateY(-8px)
                scale(1.02);

            box-shadow:
                0 0 25px
                rgba(0,242,255,0.35);
        }


        .summary-card h2 {

            font-size: 32px;

            color: #00f2ff;

            margin-bottom: 8px;
        }


        .summary-card p {

            color: #ddd;

            font-size: 15px;
        }


        /* =========================
           MARKS TABLE
           ========================= */

        .table-container {

            background:
                rgba(255,255,255,0.08);

            padding: 25px;

            border-radius: 20px;

            backdrop-filter: blur(15px);

            border:
                1px solid
                rgba(255,255,255,0.15);

            overflow-x: auto;
        }


        .table-container h2 {

            color: #00f2ff;

            margin-bottom: 20px;

            text-align: center;
        }


        table {

            width: 100%;

            border-collapse: collapse;

            min-width: 700px;
        }


        th {

            background: rgba(0,242,255,0.15);

            color: #00f2ff;

            padding: 15px;

            text-align: center;
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


        .subject {

            text-align: left;

            font-weight: bold;
        }


        /* =========================
           GRADE
           ========================= */

        .grade {

            display: inline-block;

            padding: 6px 13px;

            border-radius: 20px;

            font-weight: bold;
        }


        .excellent {

            background: #00c853;

            color: white;

            box-shadow:
                0 0 10px #00c853;
        }


        .good {

            background: #00b0ff;

            color: white;

            box-shadow:
                0 0 10px #00b0ff;
        }


        .average {

            background: #ff9800;

            color: white;
        }


        .fail {

            background: #ff1744;

            color: white;

            box-shadow:
                0 0 10px #ff1744;
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


            .student-info,
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


<!-- =========================
     NAVBAR
     ========================= -->

<nav class="navbar">

    <div class="logo">
        🎓 Win's LearnHub
    </div>


    <ul class="nav-links">

        <li>
            <a href="studentDashboard.jsp">
                Dashboard
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
     MAIN
     ========================= -->

<div class="container">


    <div class="heading">

        <h1>📊 Academic Marks</h1>

        <p>
            View your subject-wise examination results
        </p>

    </div>


    <!-- STUDENT INFORMATION -->

    <div class="student-info">


        <div class="info-box">

            <h3>👨‍🎓 Student Name</h3>

            <p>
                <%= studentName %>
            </p>

        </div>


        <div class="info-box">

            <h3>🆔 Student ID</h3>

            <p>
                <%= studentId %>
            </p>

        </div>


        <div class="info-box">

            <h3>🎓 Course</h3>

            <p>
                <%= course %>
            </p>

        </div>


    </div>


    <!-- SUMMARY -->

    <div class="summary">


        <div class="summary-card">

            <h2>
                <%= totalMarks %>
            </h2>

            <p>
                Total Marks
            </p>

        </div>


        <div class="summary-card">

            <h2>
                <%= String.format("%.1f", average) %>%
            </h2>

            <p>
                Average Percentage
            </p>

        </div>


        <div class="summary-card">

            <h2>
                <%= passedSubjects %>
                /
                <%= subjects.length %>
            </h2>

            <p>
                Subjects Passed
            </p>

        </div>


    </div>


    <!-- MARKS TABLE -->

    <div class="table-container">

        <h2>
            📚 Subject-wise Marks
        </h2>


        <table>

            <tr>

                <th>
                    S.No
                </th>

                <th>
                    Subject
                </th>

                <th>
                    Internal
                </th>

                <th>
                    External
                </th>

                <th>
                    Total
                </th>

                <th>
                    Percentage
                </th>

                <th>
                    Grade
                </th>

            </tr>


            <%
                for (int i = 0; i < subjects.length; i++) {

                    int subjectTotal =
                        internalMarks[i] + externalMarks[i];

                    double percentage =
                        ((double) subjectTotal / 100) * 100;

                    String grade;

                    if (percentage >= 90) {

                        grade = "A+";

                    } else if (percentage >= 80) {

                        grade = "A";

                    } else if (percentage >= 70) {

                        grade = "B+";

                    } else if (percentage >= 60) {

                        grade = "B";

                    } else if (percentage >= 50) {

                        grade = "C";

                    } else if (percentage >= 40) {

                        grade = "D";

                    } else {

                        grade = "F";
                    }
            %>


            <tr>

                <td>
                    <%= i + 1 %>
                </td>


                <td class="subject">
                    <%= subjects[i] %>
                </td>


                <td>
                    <%= internalMarks[i] %>
                </td>


                <td>
                    <%= externalMarks[i] %>
                </td>


                <td>
                    <%= subjectTotal %>
                </td>


                <td>
                    <%= String.format("%.1f", percentage) %>%
                </td>


                <td>


                    <%
                        if (grade.equals("A+")
                            || grade.equals("A")) {
                    %>

                        <span class="grade excellent">
                            <%= grade %>
                        </span>

                    <%
                        } else if (
                            grade.equals("B+")
                            || grade.equals("B")
                        ) {
                    %>

                        <span class="grade good">
                            <%= grade %>
                        </span>

                    <%
                        } else if (
                            grade.equals("C")
                            || grade.equals("D")
                        ) {
                    %>

                        <span class="grade average">
                            <%= grade %>
                        </span>

                    <%
                        } else {
                    %>

                        <span class="grade fail">
                            <%= grade %>
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

    </div>


</div>


<!-- =========================
     FOOTER
     ========================= -->

<footer>

    © 2026 Win's LearnHub Educational Portal
    |
    Learn • Grow • Succeed

</footer>


</body>

</html>