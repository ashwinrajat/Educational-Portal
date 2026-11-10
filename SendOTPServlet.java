/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author ashwi
 */
package com.learnhub;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SendOTPServlet")
public class SendOTPServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");

        if (email == null || email.trim().isEmpty()) {

            out.println("<h2>Email is required!</h2>");
            return;
        }

        email = email.trim();

        // Generate 6 digit OTP
        Random random = new Random();

        String otp = String.valueOf(
                100000 + random.nextInt(900000)
        );

        try {

            // Send OTP
            EmailUtil.sendOTP(email, otp);

            // Store OTP in session
            HttpSession session = request.getSession();

            session.setAttribute("verificationEmail", email);
            session.setAttribute("emailOTP", otp);

            // Redirect to verification page
            response.sendRedirect("verifyEmail.jsp");

        } catch (Exception e) {


            out.println("<h2>Email could not be sent!</h2>");
            out.println("<p>" + e.getMessage() + "</p>");
        }
    }
}
