/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.*;

/**
 *
 * @author Rahul Singh
 */
public class FirstServlet implements Servlet
{
    ServletConfig config;
    public void init(ServletConfig config)
    {
        this.config = config;
        System.out.println("creating object");
    }
    public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException
    {
        System.out.println("servicing");
        // Sets the type of the response data, here we are sending text and content type is html
        resp.setContentType("text/html");
        // The PrintWriter object is used to transmit character text to the client
        PrintWriter writer = resp.getWriter();
        writer.println("<h1>This is my first project</h1>");
        writer.println("<h1>Today's date and time is : "+new Date().toString()+"</h1>");
    }
    public void destroy()
    {
        System.out.println("going to destroy servlet object");
    }
    public ServletConfig getServletConfig()
    {
        return this.config;
    }
    public String getServletInfo()
    {
        return "this servlet is created by rahul";
    }
}
