/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 *
 * @author Rahul Singh
 */
public class Generic_Servlet extends GenericServlet{

    @Override
    public void service(ServletRequest req, ServletResponse resp) throws ServletException, IOException 
    {
        System.out.println("this is generic servlet");
        resp.setContentType("text/html");
        PrintWriter writer = resp.getWriter();
        writer.println("<h1>This is my second project using generic servlet</h1>");
    }
    
}
