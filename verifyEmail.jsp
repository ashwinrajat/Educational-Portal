<%-- 
    Document   : verifyEmail
    Created on : Oct 5, 2026, 10:46:13 AM
    Author     : ashwi
--%>
<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    String email = (String) session.getAttribute("verificationEmail");

    if (email == null) {
        response.sendRedirect("studentRegister.html");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Verify Email - LearnHub</title>

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
                linear-gradient(135deg,
                #0f2027,
                #203a43,
                #2c5364);

            color: white;
        }

        .box {

            width: 420px;

            padding: 40px;

            text-align: center;

            background: rgba(255,255,255,0.1);

            border: 1px solid rgba(255,255,255,0.2);

            border-radius: 20px;

            backdrop-filter: blur(15px);

            box-shadow:
                0 20px 50px rgba(0,0,0,0.4);
        }

        .icon {

            font-size: 55px;

            margin-bottom: 15px;
        }

        h1 {

            margin-bottom: 10px;
        }

        p {

            color: #ddd;

            margin-bottom: 20px;
        }

        .email {

            color: #00e5ff;

            font-weight: bold;
        }

        input {

            width: 100%;

            padding: 15px;

            border: none;

            outline: none;

            border-radius: 10px;

            margin: 15px 0;

            text-align: center;

            font-size: 20px;

            letter-spacing: 5px;
        }

        button {

            width: 100%;

            padding: 14px;

            border: none;

            border-radius: 10px;

            background: #00c6ff;

            color: white;

            font-size: 16px;

            font-weight: bold;

            cursor: pointer;

            transition: 0.3s;
        }

        button:hover {

            background: #0072ff;

            transform: translateY(-3px);
        }

    </style>

</head>

<body>

<div class="box">

    <div class="icon">📧</div>

    <h1>Verify Your Email</h1>

    <p>
        We sent a verification OTP to
    </p>

    <p class="email">
        <%= email %>
    </p>

    <form action="VerifyOTPServlet" method="post">

        <input
            type="text"
            name="otp"
            placeholder="Enter 6 digit OTP"
            maxlength="6"
            required>

        <button type="submit">
            Verify Email
        </button>

    </form>

</div>

</body>
</html>