package com.user.controller;


import com.user.dao.HandoverDAO;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;



public class UpdateStatusServlet extends HttpServlet {



@Override
protected void doPost(HttpServletRequest request,
        HttpServletResponse response)

        throws ServletException, IOException {



    int id =
    Integer.parseInt(
    request.getParameter("id"));



    HandoverDAO dao =
    new HandoverDAO();



    dao.updateStatus(
    id,"Completed");



    response.sendRedirect(
    "HandoverServlet");



}


}