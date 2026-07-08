package com.user.controller;


import com.user.dao.HandoverDAO;
import com.user.model.Handover;

import java.io.IOException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;



public class HandoverServlet extends HttpServlet {



@Override
protected void doGet(HttpServletRequest request,
        HttpServletResponse response)

        throws ServletException, IOException {



    HandoverDAO dao =
    new HandoverDAO();



    List<Handover> list =
    dao.getAllRecords();



    request.setAttribute(
    "handoverList", list);



    RequestDispatcher rd =
    request.getRequestDispatcher(
    "handover_log.jsp");



    rd.forward(request,response);


}


}