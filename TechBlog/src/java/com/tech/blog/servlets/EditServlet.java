/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Rahul Singh
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

            // fetch all data
            String userEmailEdit = request.getParameter("user_email_edit");
            String userNameEdit = request.getParameter("user_name_edit");
            String userPasswordEdit = request.getParameter("user_password_edit");
            Part part = request.getPart("update_profile_pic");
            String imgName = part.getSubmittedFileName();

            // get the user from session
            HttpSession httpsession = request.getSession();
            User user = (User) httpsession.getAttribute("currentUser");
            user.setEmail(userEmailEdit);
            user.setName(userNameEdit);
            user.setPassword(userPasswordEdit);
            String oldFile = user.getProfile();
            user.setProfile(imgName);

            // update data in database
            UserDao userdao = new UserDao(ConnectionProvider.getConnection());
            if (userdao.updateUser(user)) {
                String path = request.getRealPath("/") + "profilepics" + File.separator + user.getProfile();

                String pathOldFile = request.getRealPath("/") + "profilepics" + File.separator + oldFile;
                if (!oldFile.equals("default.png")) {
                    Helper.deleteFile(oldFile);
                }

                if (Helper.saveFile(part.getInputStream(), path)) {
                    Message msg = new Message("Profile Details Updated !!!", "success", "alert-success");
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("msg", msg);
                } else {
                    Message msg = new Message("Something went wrong....", "error", "alert-danger");
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("msg", msg);
                }

            } else {
                Message msg = new Message("Something went wrong....", "error", "alert-danger");
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("msg", msg);
            }
            response.sendRedirect("profile.jsp");

            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
