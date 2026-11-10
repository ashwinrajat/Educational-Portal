<%-- 
    Document   : profile
    Created on : Oct 3, 2026, 12:27:37 PM
    Author     : ashwi
--%>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    // =========================
    // STUDENT PROFILE DATA
    // =========================

    String studentName = "Ashwin Raja";
    String studentId = "STU001";
    String email = "ashwin@gmail.com";
    String phone = "+91 98765 43210";

    String course = "B.E Computer Science and Engineering";
    String year = "Final Year";
    String department = "Computer Science";

    int attendance = 87;
    int marks = 82;

    String[] skills = {
        "Java",
        "HTML",
        "CSS",
        "JavaScript",
        "JSP",
        "MySQL"
    };

    String[] interests = {
        "Web Development",
        "Java Programming",
        "Database",
        "Software Development"
    };
%>


<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Win's LearnHub - My Profile</title>


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

            overflow-x: hidden;
        }


        /* =========================
           BACKGROUND ANIMATION
           ========================= */

        body::before {

            content: "";

            position: fixed;

            width: 350px;

            height: 350px;

            background:
                rgba(0,242,255,0.12);

            border-radius: 50%;

            top: 100px;

            left: -100px;

            filter: blur(20px);

            animation:
                floating 6s infinite alternate;

            z-index: -1;
        }


        body::after {

            content: "";

            position: fixed;

            width: 300px;

            height: 300px;

            background:
                rgba(0,255,136,0.10);

            border-radius: 50%;

            bottom: 50px;

            right: -100px;

            filter: blur(20px);

            animation:
                floating 7s infinite alternate-reverse;

            z-index: -1;
        }


        @keyframes floating {

            from {
                transform: translateY(0px);
            }

            to {
                transform: translateY(40px);
            }
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
        }


        .logout:hover {

            color: white !important;

            background: #ff6b81;

            box-shadow:
                0 0 15px #ff4757;
        }


        /* =========================
           MAIN CONTAINER
           ========================= */

        .container {

            width: 90%;

            max-width: 1150px;

            margin: 45px auto;
        }


        .heading {

            text-align: center;

            margin-bottom: 35px;
        }


        .heading h1 {

            font-size: 40px;

            color: #00f2ff;

            text-shadow:
                0 0 15px #00f2ff;
        }


        .heading p {

            margin-top: 10px;

            color: #d8e9ed;
        }


        /* =========================
           PROFILE HEADER
           ========================= */

        .profile-header {

            display: flex;

            align-items: center;

            gap: 30px;

            padding: 35px;

            border-radius: 25px;

            background:
                rgba(255,255,255,0.08);

            border:
                1px solid
                rgba(255,255,255,0.15);

            backdrop-filter: blur(15px);

            margin-bottom: 30px;

            transition: 0.4s;
        }


        .profile-header:hover {

            transform: translateY(-5px);

            box-shadow:
                0 0 30px
                rgba(0,242,255,0.25);
        }


        /* =========================
           PROFILE IMAGE
           ========================= */

        .profile-image {

            width: 130px;

            height: 130px;

            border-radius: 50%;

            display: flex;

            align-items: center;

            justify-content: center;

            font-size: 65px;

            background:
                linear-gradient(
                    135deg,
                    #00f2ff,
                    #0066ff
                );

            border:
                5px solid
                rgba(255,255,255,0.3);

            box-shadow:
                0 0 30px
                rgba(0,242,255,0.5);

            animation:
                profileGlow 3s infinite alternate;
        }


        @keyframes profileGlow {

            from {
                box-shadow:
                    0 0 15px
                    rgba(0,242,255,0.3);
            }

            to {
                box-shadow:
                    0 0 35px
                    rgba(0,242,255,0.8);
            }
        }


        .profile-name h2 {

            font-size: 30px;

            margin-bottom: 8px;
        }


        .profile-name p {

            color: #bcecf1;

            margin: 5px 0;
        }


        .student-badge {

            display: inline-block;

            margin-top: 10px;

            padding: 7px 15px;

            border-radius: 20px;

            background:
                rgba(0,242,255,0.15);

            color: #00f2ff;

            border:
                1px solid
                rgba(0,242,255,0.3);
        }


        /* =========================
           CONTENT GRID
           ========================= */

        .content-grid {

            display: grid;

            grid-template-columns:
                1fr 1fr;

            gap: 25px;
        }


        .card {

            padding: 30px;

            border-radius: 20px;

            background:
                rgba(255,255,255,0.08);

            border:
                1px solid
                rgba(255,255,255,0.15);

            backdrop-filter: blur(15px);

            transition: 0.4s;
        }


        .card:hover {

            transform: translateY(-7px);

            box-shadow:
                0 0 25px
                rgba(0,242,255,0.2);
        }


        .card h2 {

            color: #00f2ff;

            margin-bottom: 22px;
        }


        /* =========================
           PERSONAL INFORMATION
           ========================= */

        .info-row {

            display: flex;

            justify-content: space-between;

            padding: 14px 0;

            border-bottom:
                1px solid
                rgba(255,255,255,0.1);
        }


        .info-row:last-child {

            border-bottom: none;
        }


        .label {

            color: #9fc7cc;

            font-weight: bold;
        }


        .value {

            text-align: right;

            color: white;
        }


        /* =========================
           SKILLS
           ========================= */

        .skills {

            display: flex;

            flex-wrap: wrap;

            gap: 12px;
        }


        .skill {

            padding: 9px 16px;

            border-radius: 20px;

            background:
                rgba(0,242,255,0.12);

            color: #00f2ff;

            border:
                1px solid
                rgba(0,242,255,0.25);

            transition: 0.3s;
        }


        .skill:hover {

            transform: scale(1.08);

            background:
                rgba(0,242,255,0.25);

            box-shadow:
                0 0 12px
                rgba(0,242,255,0.4);
        }


        /* =========================
           INTERESTS
           ========================= */

        .interest-list {

            list-style: none;
        }


        .interest-list li {

            padding: 12px;

            margin-bottom: 10px;

            border-radius: 10px;

            background:
                rgba(255,255,255,0.05);

            transition: 0.3s;
        }


        .interest-list li:hover {

            background:
                rgba(0,242,255,0.1);

            transform: translateX(8px);
        }


        /* =========================
           PERFORMANCE
           ========================= */

        .performance-item {

            margin-bottom: 22px;
        }


        .performance-header {

            display: flex;

            justify-content: space-between;

            margin-bottom: 8px;
        }


        .progress {

            width: 100%;

            height: 10px;

            background:
                rgba(255,255,255,0.1);

            border-radius: 20px;

            overflow: hidden;
        }


        .progress-bar {

            height: 100%;

            border-radius: 20px;

            background:
                linear-gradient(
                    90deg,
                    #00f2ff,
                    #00ff88
                );

            box-shadow:
                0 0 10px
                rgba(0,242,255,0.6);

            animation:
                progressAnimation 1.5s ease;
        }


        @keyframes progressAnimation {

            from {
                width: 0;
            }
        }


        .attendance-bar {

            width: <%= attendance %>%;
        }


        .marks-bar {

            width: <%= marks %>%;
        }


        /* =========================
           STATUS
           ========================= */

        .status {

            margin-top: 20px;

            padding: 15px;

            border-radius: 12px;

            text-align: center;
        }


        <%
            if (attendance >= 75 && marks >= 50) {
        %>

        .status {

            background:
                rgba(0,255,136,0.12);

            color: #00ff88;

            border:
                1px solid
                rgba(0,255,136,0.25);
        }

        <%
            } else {
        %>

        .status {

            background:
                rgba(255,193,7,0.12);

            color: #ffc107;

            border:
                1px solid
                rgba(255,193,7,0.25);
        }

        <%
            }
        %>


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


            .profile-header {

                flex-direction: column;

                text-align: center;
            }


            .content-grid {

                grid-template-columns: 1fr;
            }
        }


        @media(max-width: 600px) {

            .nav-links {

                display: none;
            }


            .container {

                width: 95%;
            }


            .heading h1 {

                font-size: 30px;
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
            <a href="profile.jsp">
                Profile
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

        <h1>👤 My Profile</h1>

        <p>
            View your LearnHub student profile
        </p>

    </div>


    <!-- =========================
         PROFILE HEADER
         ========================= -->

    <div class="profile-header">


        <div class="profile-image">
            👨‍🎓
        </div>


        <div class="profile-name">

            <h2>
                <%= studentName %>
            </h2>

            <p>
                <%= course %>
            </p>

            <p>
                Student ID: <%= studentId %>
            </p>

            <span class="student-badge">
                🎓 <%= year %>
            </span>

        </div>


    </div>


    <!-- =========================
         CONTENT
         ========================= -->

    <div class="content-grid">


        <!-- PERSONAL INFORMATION -->

        <div class="card">

            <h2>
                📋 Personal Information
            </h2>


            <div class="info-row">

                <span class="label">
                    Full Name
                </span>

                <span class="value">
                    <%= studentName %>
                </span>

            </div>


            <div class="info-row">

                <span class="label">
                    Student ID
                </span>

                <span class="value">
                    <%= studentId %>
                </span>

            </div>


            <div class="info-row">

                <span class="label">
                    Email
                </span>

                <span class="value">
                    <%= email %>
                </span>

            </div>


            <div class="info-row">

                <span class="label">
                    Phone
                </span>

                <span class="value">
                    <%= phone %>
                </span>

            </div>


            <div class="info-row">

                <span class="label">
                    Department
                </span>

                <span class="value">
                    <%= department %>
                </span>

            </div>


        </div>


        <!-- COURSE INFORMATION -->

        <div class="card">

            <h2>
                🎓 Course Information
            </h2>


            <div class="info-row">

                <span class="label">
                    Course
                </span>

                <span class="value">
                    <%= course %>
                </span>

            </div>


            <div class="info-row">

                <span class="label">
                    Department
                </span>

                <span class="value">
                    <%= department %>
                </span>

            </div>


            <div class="info-row">

                <span class="label">
                    Academic Year
                </span>

                <span class="value">
                    <%= year %>
                </span>

            </div>


            <div class="info-row">

                <span class="label">
                    Student ID
                </span>

                <span class="value">
                    <%= studentId %>
                </span>

            </div>


        </div>


        <!-- SKILLS -->

        <div class="card">

            <h2>
                💻 Technical Skills
            </h2>


            <div class="skills">


                <%
                    for (int i = 0;
                         i < skills.length;
                         i++) {
                %>

                    <span class="skill">
                        <%= skills[i] %>
                    </span>

                <%
                    }
                %>


            </div>


        </div>


        <!-- INTERESTS -->

        <div class="card">

            <h2>
                🚀 Areas of Interest
            </h2>


            <ul class="interest-list">


                <%
                    for (int i = 0;
                         i < interests.length;
                         i++) {
                %>

                    <li>
                        🔹 <%= interests[i] %>
                    </li>

                <%
                    }
                %>


            </ul>


        </div>


        <!-- PERFORMANCE -->

        <div class="card">

            <h2>
                📈 Academic Performance
            </h2>


            <div class="performance-item">


                <div class="performance-header">

                    <span>
                        Attendance
                    </span>

                    <strong>
                        <%= attendance %>%
                    </strong>

                </div>


                <div class="progress">

                    <div class="progress-bar attendance-bar">
                    </div>

                </div>


            </div>


            <div class="performance-item">


                <div class="performance-header">

                    <span>
                        Academic Marks
                    </span>

                    <strong>
                        <%= marks %>%
                    </strong>

                </div>


                <div class="progress">

                    <div class="progress-bar marks-bar">
                    </div>

                </div>


            </div>


            <!-- JSP IF ELSE -->

            <%
                if (attendance >= 75 && marks >= 50) {
            %>

                <div class="status">

                    ✅ Good academic performance

                </div>

            <%
                } else {
            %>

                <div class="status">

                    ⚠️ Improvement is required

                </div>

            <%
                }
            %>


        </div>


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
