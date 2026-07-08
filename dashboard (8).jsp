package com.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Remove session
        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate();
        }

        // Back to login page
        response.sendRedirect("login.jsp");
    }
}