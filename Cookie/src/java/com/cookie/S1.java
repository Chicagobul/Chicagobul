/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cookie;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rahul Singh
 */
public class S1 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }
    
    protected void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        resp.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = resp.getWriter()) 
     {
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet S1</title>");
        out.println("</head>");
        out.println("<body>");
        
        String name = req.getParameter("name");
        out.println("<h1> Hello, " + name + " welcome back to my website....</h1>");
        out.println("<h1><a href ='s2'>Go to servlet 2</a></h1>");
        
        Cookie c = new Cookie("user_name", name);
        resp.addCookie(c);
        
        out.println("</body>");
        out.println("</html>");
    }
    
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
