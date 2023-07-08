<%-- 
    Document   : signup
    Created on : 19 Mar, 2023, 1:52:00 PM
    Author     : Rahul Singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    </head>
    <body style="background: url(img/car.jpg);background-size: cover;background-attachment: fixed;">
        <div class="container">
            <div class="row">
                <div class="col m6 offset-m3">
                    <!-- col m6 means that we are only using 6 grids out of 12 and offset means we are
                         moving our card to center leaving 3 columns on each side 
                        website - https://materializecss.com/ -->
                    <div class="card">
                        <div class="card-content">
                            <h3 style="margin-top: 10px;" class="center-align">REGISTER HERE !!!</h3>
                            <h5 id="msg" class="center-align"></h5>

                            <div class="form center-align">
                                <form action="Register" method="post" id="myform">
                                    <input type="text" name="user_name" placeholder="Enter username"/>
                                    <input type="password" name="user_password" placeholder="Enter password"/>
                                    <input type="email" name="user_email" placeholder="Enter email"/>
                                    <div class="file-field input-field">
                                        <div class="btn">
                                            <span>File</span>
                                            <input name="image" type="file">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" type="text">
                                        </div>
                                    </div>
                                    <button type="submit" class="btn f44336 red">Submit</button>
                                </form>
                            </div>
                            <div class="loader center-align" style="margin-top: 10px;display: none;">
                                <div class="preloader-wrapper big active">
                                    <div class="spinner-layer spinner-blue-only">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>
                                    </div>
                                </div>
                                <h5>Please wait...</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script
            src="https://code.jquery.com/jquery-3.6.4.min.js"
            integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
        crossorigin="anonymous"></script>

        <script>
            $(document).ready(function () {
                console.log("page is ready...")
                $("#myform").on('submit', function (event) {
                    event.preventDefault();
                    //var f = $(this).serialize();
                    let f = new FormData(this);
                    console.log(f);
                    $(".loader").show();
                    $(".form").hide();
                    $.ajax({
                        url: "Register",
                        data: f,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            console.log("success....")
                            $(".loader").hide();
                            $(".form").show();
                            if (data.trim == 'done')
                            {
                                $('#msg').html("Sucessfully Registered !!!")
                                $('#msg').addClass('green-text')
                            } else
                            {
                                $('#msg').html("Something went wrong on server !!!")
                                $('#msg').addClass('red-text')
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(data);
                            console.log("error....")
                            $(".loader").hide();
                            $(".form").show();
                            $('#msg').html("Something went wrong on server !!!")
                        },
                        processData : false,
                        contentType : false
                    })
                })
            })
        </script>
    </body>
</html>
