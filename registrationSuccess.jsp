<%-- 
    Document   : registrationSuccess
    Created on : Oct 5, 2026, 11:45:09 AM
    Author     : ashwi
--%>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    String studentName = (String) session.getAttribute("registeredStudentName");

    if (studentName == null) {
        studentName = "Student";
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Registration Successful - Win's LearnHub</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            min-height: 100vh;

            display: flex;
            justify-content: center;
            align-items: center;

            font-family: Arial, sans-serif;

            background:
                linear-gradient(
                    135deg,
                    #0f2027,
                    #203a43,
                    #2c5364
                );

            color: white;

            overflow: hidden;
        }

        /* Background circles */

        body::before,
        body::after {
            content: "";
            position: absolute;

            width: 300px;
            height: 300px;

            border-radius: 50%;

            background: rgba(0, 198, 255, 0.15);

            animation: float 6s infinite ease-in-out;
        }

        body::before {
            top: -100px;
            left: -100px;
        }

        body::after {
            bottom: -100px;
            right: -100px;

            animation-delay: 2s;
        }

        @keyframes float {

            0% {
                transform: translateY(0);
            }

            50% {
                transform: translateY(30px);
            }

            100% {
                transform: translateY(0);
            }
        }

        .success-box {

            position: relative;

            width: 450px;

            padding: 45px 40px;

            text-align: center;

            background: rgba(255, 255, 255, 0.12);

            border: 1px solid rgba(255, 255, 255, 0.25);

            border-radius: 25px;

            backdrop-filter: blur(15px);

            box-shadow:
                0 25px 60px rgba(0, 0, 0, 0.45);

            animation: appear 0.8s ease;
        }

        @keyframes appear {

            from {
                opacity: 0;
                transform: translateY(40px) scale(0.9);
            }

            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .success-icon {

            width: 90px;
            height: 90px;

            margin: 0 auto 20px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 50%;

            background: rgba(0, 255, 150, 0.15);

            border: 2px solid #00ff99;

            font-size: 45px;

            animation: pop 1s ease;
        }

        @keyframes pop {

            0% {
                transform: scale(0);
            }

            70% {
                transform: scale(1.15);
            }

            100% {
                transform: scale(1);
            }
        }

        h1 {

            font-size: 30px;

            margin-bottom: 15px;

            color: #00ffcc;
        }

        .welcome {

            font-size: 20px;

            margin-bottom: 10px;
        }

        .name {

            color: #00e5ff;

            font-weight: bold;
        }

        .message {

            color: #ddd;

            margin: 15px 0 30px;

            line-height: 1.6;
        }

        .login-btn {

            display: inline-block;

            padding: 14px 30px;

            background:
                linear-gradient(
                    135deg,
                    #00c6ff,
                    #0072ff
                );

            color: white;

            text-decoration: none;

            border-radius: 12px;

            font-weight: bold;

            transition: 0.3s;

            box-shadow:
                0 8px 20px rgba(0, 114, 255, 0.3);
        }

        .login-btn:hover {

            transform: translateY(-4px);

            box-shadow:
                0 12px 30px rgba(0, 198, 255, 0.5);
        }

        .logo {

            margin-top: 25px;

            color: #aaa;

            font-size: 14px;
        }

    </style>

</head>

<body>

    <div class="success-box">

        <div class="success-icon">
            ✓
        </div>

        <h1>
            Student Registration Successful!
        </h1>

        <p class="welcome">
            Welcome,
            <span class="name">
                <%= studentName %>
            </span>
        </p>

        <p class="message">
            🎓 Your Win's LearnHub student account has been created successfully.
            You can now login and access your educational dashboard.
        </p>

        <a href="login.jsp" class="login-btn">
            Go to Login →
        </a>

        <div class="logo">
            🎓 Win's LearnHub Educational Portal
        </div>

    </div>

</body>
</html>