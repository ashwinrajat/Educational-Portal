<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    // ==============================
    // COURSE DATA
    // ==============================

    String[] courseNames = {
        "Java Programming",
        "Web Development",
        "Database Management",
        "Python Programming",
        "Spring Boot",
        "Data Structures"
    };

    String[] courseIcons = {
        "☕",
        "🌐",
        "🗄️",
        "🐍",
        "🍃",
        "🧠"
    };

    String[] instructors = {
        "Mr. Arun",
        "Ms. Priya",
        "Mr. Kumar",
        "Ms. Divya",
        "Mr. Raj",
        "Ms. Anitha"
    };

    String[] courseDescriptions = {
        "Learn Core Java, OOP, Collections and Exception Handling.",
        "Learn HTML, CSS, JavaScript and modern web development.",
        "Learn SQL, MySQL, database design and JDBC.",
        "Learn Python programming from basics to advanced concepts.",
        "Learn Spring Boot and develop Java web applications.",
        "Learn arrays, linked lists, stacks, queues and algorithms."
    };

    int[] duration = {
        8,
        10,
        6,
        8,
        10,
        7
    };

    int[] progress = {
        80,
        65,
        90,
        45,
        30,
        70
    };
%>


<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <title>My Courses - win's LearnHub</title>


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

            color: white;

            text-decoration: none;

            padding: 9px 18px;

            border-radius: 20px;

            background: #00e5ff;

            color: #001018;

            font-weight: bold;
        }


        /* ================= HEADER ================= */

        .page-header {

            text-align: center;

            padding: 60px 20px 40px;
        }


        .page-header h1 {

            font-size: 45px;

            margin-bottom: 15px;
        }


        .page-header h1 span {

            color: #00e5ff;
        }


        .page-header p {

            color: #bdc9d0;

            font-size: 18px;
        }


        /* ================= COURSE CONTAINER ================= */

        .course-container {

            width: 90%;

            max-width: 1200px;

            margin: auto;

            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 25px;

            padding-bottom: 70px;
        }


        /* ================= COURSE CARD ================= */

        .course-card {

            padding: 30px;

            border-radius: 22px;

            background:
                rgba(255, 255, 255, 0.09);

            backdrop-filter: blur(12px);

            border:
                1px solid
                rgba(255, 255, 255, 0.12);

            transition: 0.4s;

            position: relative;

            overflow: hidden;
        }


        .course-card:hover {

            transform:
                translateY(-12px);

            border-color:
                #00e5ff;

            box-shadow:
                0 20px 40px
                rgba(0, 229, 255, 0.15);
        }


        /* ================= COURSE ICON ================= */

        .course-icon {

            width: 75px;

            height: 75px;

            display: flex;

            align-items: center;

            justify-content: center;

            font-size: 40px;

            border-radius: 20px;

            background:
                rgba(0, 229, 255, 0.12);

            margin-bottom: 20px;

            transition: 0.4s;
        }


        .course-card:hover .course-icon {

            transform:
                scale(1.15)
                rotate(5deg);
        }


        .course-card h2 {

            margin-bottom: 12px;

            font-size: 23px;
        }


        .course-description {

            color: #b9c6cd;

            line-height: 1.6;

            min-height: 75px;
        }


        /* ================= INSTRUCTOR ================= */

        .instructor {

            margin-top: 18px;

            color: #00e5ff;

            font-size: 14px;
        }


        /* ================= DURATION ================= */

        .duration {

            margin-top: 8px;

            color: #b9c6cd;

            font-size: 14px;
        }


        /* ================= PROGRESS ================= */

        .progress-area {

            margin-top: 20px;
        }


        .progress-top {

            display: flex;

            justify-content: space-between;

            margin-bottom: 8px;

            font-size: 14px;
        }


        .progress-top span:last-child {

            color: #00e5ff;

            font-weight: bold;
        }


        .progress-bar {

            height: 8px;

            border-radius: 10px;

            background:
                rgba(255, 255, 255, 0.15);

            overflow: hidden;
        }


        .progress {

            height: 100%;

            border-radius: 10px;

            background:
                linear-gradient(
                    90deg,
                    #00e5ff,
                    #7b2ff7
                );
        }


        /* ================= BUTTON ================= */

        .course-button {

            display: block;

            margin-top: 22px;

            padding: 12px;

            text-align: center;

            text-decoration: none;

            color: white;

            border-radius: 25px;

            background:
                linear-gradient(
                    135deg,
                    #00c6ff,
                    #7b2ff7
                );

            transition: 0.3s;
        }


        .course-button:hover {

            transform: scale(1.04);

            box-shadow:
                0 10px 25px
                rgba(0, 229, 255, 0.25);
        }


        /* ================= FOOTER ================= */

        footer {

            text-align: center;

            padding: 30px;

            background:
                rgba(0, 0, 0, 0.4);

            color: #aebbc4;
        }


        footer h3 {

            color: #00e5ff;

            margin-bottom: 8px;
        }


        /* ================= RESPONSIVE ================= */

        @media(max-width: 1000px) {

            .course-container {

                grid-template-columns:
                    repeat(2, 1fr);
            }

        }


        @media(max-width: 650px) {

            .navbar {

                padding: 0 20px;
            }

            .nav-links {

                display: none;
            }

            .course-container {

                grid-template-columns: 1fr;
            }

            .page-header h1 {

                font-size: 35px;
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



<!-- ================= PAGE HEADER ================= -->

<section class="page-header">

    <h1>

        My <span>Courses</span> 📚

    </h1>

    <p>

        Continue learning and improve your skills

    </p>

</section>



<!-- ================= COURSES ================= -->

<div class="course-container">


<%

    // JSP FOR LOOP

    for(int i = 0; i < courseNames.length; i++) {

%>


    <div class="course-card">


        <div class="course-icon">

            <%= courseIcons[i] %>

        </div>


        <h2>

            <%= courseNames[i] %>

        </h2>


        <p class="course-description">

            <%= courseDescriptions[i] %>

        </p>


        <p class="instructor">

            👨‍🏫 Instructor:
            <%= instructors[i] %>

        </p>


        <p class="duration">

            ⏱ Duration:
            <%= duration[i] %> weeks

        </p>


        <!-- PROGRESS -->

        <div class="progress-area">

            <div class="progress-top">

                <span>
                    Your Progress
                </span>

                <span>
                    <%= progress[i] %>%
                </span>

            </div>


            <div class="progress-bar">

                <div class="progress"
                     style="width:<%= progress[i] %>%;">
                </div>

            </div>

        </div>


        <a href="#" class="course-button">

            Continue Learning →

        </a>


    </div>


<%

    }

%>


</div>



<!-- ================= FOOTER ================= -->

<footer>

    <h3>
        🎓 LearnHub
    </h3>

    <p>
        Learn. Grow. Succeed.
    </p>

    <p>
        © 2026 LearnHub. All Rights Reserved.
    </p>

</footer>


</body>

</html>