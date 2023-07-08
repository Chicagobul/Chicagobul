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
public class S2 extends HttpServlet {
    
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
        try (PrintWriter out = resp.getWriter()) {
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet S2</title>");
        out.println("</head>");
        out.println("<body>");
        
        Cookie[] cookies = req.getCookies();
        boolean f = false;
        String name = "";
        
        if(cookies == null)
        {
            out.println("<h1>You are new user, go to home page and submit your name</h1>");
            return;
        }
        else
        {
            for(Cookie c : cookies)
            {
                String tname = c.getName();
                if(tname.equals("user_name"))
                {
                    f = true;
                    name = c.getValue();
                }
            }
        }
        
        if(f)
        {
        out.println("<h1> Hello, " + name + " welcome back to my website....</h1>");
        out.println("<h1>Thank you</h1>");
        }
        else
        {
            out.println("<h1>You are new user, go to home page and submit your name</h1>");
        }
        
        out.println("</body>");
        out.println("</html>");
    }
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
