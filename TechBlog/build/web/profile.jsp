<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Categories"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.CategoriesDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- css -->

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 100%, 71% 90%, 31% 100%, 0 88%, 0 0);
            }
            body{
                background: url(img/website_background2.png);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-cloud"></span> Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><span class="fa fa-graduation-cap"></span> Learn Coding With cheeku007 <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-tags"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-phone-square"></span> Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-commenting"></span> Post</a>
                    </li>

                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName()%> </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%= m.getCssClass()%>" role="alert">
            <%= m.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }
        %>


        <!--main body of the page-->

        <main>
            <div class="container">
                <div class="row mt-4">

                    <!--first col-->

                    <div class="col-md-4">
                        <!--categories-->

                        <div class="list-group">
                            <a href="#" onclick="getPosts(0, this)" class="cat-link list-group-item list-group-item-action active">
                                All Posts
                            </a>

                            <!--categories-->

                            <%
                                CategoriesDao catDao2 = new CategoriesDao(ConnectionProvider.getConnection());
                                ArrayList<Categories> catlist2 = catDao2.getAllCategories();
                                for (Categories cats : catlist2) {
                            %>
                            <a href="#" onclick="getPosts(<%= cats.getCid()%>, this)" class="cat-link list-group-item list-group-item-action"><%= cats.getName()%></a>
                            <%
                                }
                            %>
                        </div>

                    </div>

                    <!--second col-->

                    <div class="col-md-8">
                        <!--posts-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>
                        <div class="container-fluid" id="post-container">

                        </div>

                    </div>
                </div>
            </div>
        </main>


        <!--profile modal-->

        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel"> Tech Blog </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="profilepics/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%; max-width: 150px">
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"> <%= user.getName()%> </h5>

                            <!--details-->
                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row"> ID :</th>
                                            <td><%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email :</th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%= user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on :</th>
                                            <td><%= user.getDateTime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--profile edit-->

                            <div id="profile-edit" style="display: none;">
                                <h3 class="mt-2">Please Edit Carefully !</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <!--our form contains data of multiple types therefore we are using
                                        enctype="multipart/form-data" -->
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td><input type="email" class="form-control" name="user_email_edit" value="<%= user.getEmail()%>"</td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td><input type="text" class="form-control" name="user_name_edit" value="<%= user.getName()%>"</td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td><input type="password" class="form-control" name="user_password_edit" value="<%= user.getPassword()%>"</td>
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td><%= user.getGender().toUpperCase()%></td>
                                        </tr>
                                        <tr>
                                            <td>Update profile pic :</td>
                                            <td>
                                                <input type="file" name="update_profile_pic" class="form-control">
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>    
                                </form>
                            </div>

                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--add post modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide Post Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="post">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected="disabled">--- Select Category ---</option>
                                    <%
                                        CategoriesDao catDao = new CategoriesDao(ConnectionProvider.getConnection());
                                        ArrayList<Categories> catList = catDao.getAllCategories();
                                        for (Categories c : catList) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <input class="form-control" name="pTitle" type="text" placeholder="Enter post title">
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="pContent" style="height: 200px;" placeholder="Enter your content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="pCode" style="height: 200px;" placeholder="Enter your code (if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select Picture</label>
                                <br>
                                <input type="file" name="pic">
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- java script -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <script>
                                $(document).ready(function () {
                                    let editStatus = false;
                                    $('#edit-profile-button').click(function () {
                                        if (editStatus == false) {
                                            $('#profile-details').hide()
                                            $('#profile-edit').show()
                                            editStatus = true;
                                            $(this).text("Back")
                                        } else {
                                            $('#profile-details').show()
                                            $('#profile-edit').hide()
                                            editStatus = false;
                                            $(this).text("Edit")
                                        }
                                    })
                                });
        </script>

        <!--add post js-->

        <script>
            $(document).ready(function (event) {
                $("#add-post-form").on("submit", function (event) {
                    event.preventDefault();
                    let form = new FormData(this);

                    // requesting to server

                    $.ajax({
                        url: "AddPostServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            if (data.trim() == 'done') {
                                swal("Good job!", "Details Saved Successfully!", "success");
                            } else {
                                swal("Error!", "Something went wrong... try again!!!", "error");
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Error!", "Something went wrong... try again!!!", "error");

                        },
                        processData: false,
                        contentType: false
                    })
                })
            })
        </script>

        <!--load post using ajax-->

        <script>
            function getPosts(catId, temp) {
                $('#loader').show()
                $('#post-container').hide()
                $('.cat-link').removeClass('active')
                $.ajax({
                    url: "load_posts.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        $('#loader').hide()
                        $('#post-container').show()
                        $('#post-container').html(data)
                        $(temp).addClass('active')
                    }
                })
            }
            $(document).ready(function (event) {
                let allPostLink = $('.cat-link')[0]
                getPosts(0, allPostLink)
            })
        </script>
    </body>
</html>
