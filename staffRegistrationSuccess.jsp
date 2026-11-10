
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Successful - Win's LearnHub</title>

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #0f172a, #164e63, #312e81);
        }

        .success-card {
            width: 90%;
            max-width: 420px;
            padding: 40px 25px;
            background: white;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.3);
        }

        .check {
            width: 75px;
            height: 75px;
            margin: auto auto 20px;
            border-radius: 50%;
            background: #dcfce7;
            color: #16a34a;
            font-size: 45px;
            line-height: 75px;
        }

        h2 {
            color: #166534;
        }

        p {
            color: #64748b;
            line-height: 1.6;
        }

        a {
            display: inline-block;
            margin-top: 18px;
            padding: 13px 28px;
            border-radius: 9px;
            color: white;
            background: #2563eb;
            text-decoration: none;
        }
    </style>
</head>

<body>

<div class="success-card">
    <div class="check">&#10003;</div>

    <h2>Registration Successful!</h2>

    <p>Your staff account has been created successfully.</p>

    <a href="<%= request.getContextPath() %>/login.jsp">
        Go to Login
    </a>
</div>

</body>
</html>
