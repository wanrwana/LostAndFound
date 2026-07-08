package com.user.controller;

import com.user.dao.UserDAO;
import com.user.model.User;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class DashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("user");

        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        UserDAO dao = new UserDAO();
        User user = dao.getUserByUsername(username);

        // Pass the owner account data to JSP
        request.setAttribute("dashboardUser", user);

        RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
        rd.forward(request, response);
    }
}
