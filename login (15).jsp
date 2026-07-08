package com.user.controller;


import com.user.dao.ClaimDAO;
import com.user.model.Claim;

import java.io.IOException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.http.*;



public class ViewVerificationServlet extends HttpServlet {



@Override

protected void doGet(
HttpServletRequest request,
HttpServletResponse response)

throws ServletException,IOException {



ClaimDAO dao =
new ClaimDAO();



List<Claim> list =
dao.getPendingClaims();



request.setAttribute(
"claimList",
list);



RequestDispatcher rd =
request.getRequestDispatcher(
"verify_notice.jsp");



rd.forward(request,response);



}


}