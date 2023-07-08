/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegisterServlet extends HttpServlet 
{
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
    {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.println("<h2>Welcome to Register Servlet</h2>");
        String name = req.getParameter("user_name");
        String password = req.getParameter("user_password");
        String email = req.getParameter("user_email");
        String gender = req.getParameter("user_gender");
        String course = req.getParameter("user_course");
        String cond = req.getParameter("condition");
        
        if(cond!=null)
        {
        if(cond.equals("checked"))
        {
            out.println("<h2> Name :" + name + "<h2>");
            out.println("<h2> Password :" + password + "<h2>");
            out.println("<h2> Email :" + email + "<h2>");
            out.println("<h2> Gender :" + gender + "<h2>");
            out.println("<h2> Course :" + course + "<h2>");
            
            // here you have to pass the url pattern of the servlet or the path of the file
            RequestDispatcher rd = req.getRequestDispatcher("SuccessServlet");
            rd.forward(req, resp);
        }
        else
        {
            out.println("<h2>You have not accepted the terms and conditions</h2>");
        }
    }
    
        else
        {
            out.println("<h2>You have not accepted the terms and conditions</h2>");
            // include the output of index.html
            // get the obj of request dispatcher
            
            RequestDispatcher rd = req.getRequestDispatcher("index.html");
            rd.include(req, resp);
        }
    
}
}
