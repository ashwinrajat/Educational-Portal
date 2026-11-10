/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author ashwi
 */
package com.learnhub;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Properties;

public class EmailUtil {

    // YOUR GMAIL ADDRESS
    private static final String FROM_EMAIL = "yourgmail@gmail.com";

    // GMAIL APP PASSWORD - NOT YOUR NORMAL PASSWORD
    private static final String APP_PASSWORD = "your-16-digit-app-password";

    public static void sendOTP(String toEmail, String otp) throws Exception {

        Properties props = new Properties();

        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(
                                FROM_EMAIL,
                                APP_PASSWORD
                        );
                    }
                });

        Message message = new MimeMessage(session);

        message.setFrom(new InternetAddress(FROM_EMAIL));

        message.setRecipients(
                Message.RecipientType.TO,
                InternetAddress.parse(toEmail)
        );

        message.setSubject("LearnHub Email Verification");

        message.setText(
                "Hello,\n\n"
                + "Welcome to Win's LearnHub!\n\n"
                + "Your email verification OTP is:\n\n"
                + otp
                + "\n\n"
                + "This OTP is used to verify your email address.\n"
                + "Please do not share this OTP with anyone.\n\n"
                + "Thank you,\n"
                + "LearnHub Team"
        );

        Transport.send(message);
    }
}