<%--
  Created by IntelliJ IDEA.
  User: Princy
  Date: 18/04/2023
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">


<!-- Mirrored from themesbrand.com/lexa/layouts/pages-login.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Jan 2023 07:55:41 GMT -->

<head>

    <meta charset="utf-8" />
    <title>Login</title>
    <meta content= "login backoffice" name="description" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="/assets/images/favicon.ico">

    <!-- Bootstrap Css -->
    <link href="/assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="/assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

</head>

<body>
<div class="account-pages my-5 pt-sm-5">
    <div class="container">
        <div class="row justify-content-center">
            <!-- ADMIN -->
            <div class="col-md-8 col-lg-6 col-xl-5">
                <%
                    String info = "";
                    if(request.getAttribute("error") !=null){
                        info = request.getAttribute("error").toString();
                %>
                <center>
                    <div style="width: 400px;" class="alert alert-danger mb-0" role="alert">
                        <strong>Error</strong> <%= info %>
                    </div>
                </center>
                <br>
                <%
                    }
                %>
                <div class="card overflow-hidden">
                    <div class="card-body pt-0">
                        <div class="p-3">
                            <h4 class="text-muted font-size-18 mb-1 text-center">Welcome Back !</h4>
                            <p class="text-muted text-center">Sign in to continue to <span style="color:#7a6fbe">ADMIN</span> .</p>
                            <form class="form-horizontal mt-4" action="/sites-IA/backoffice/login-admin.itu" method="post">
                                <div class="mb-3">
                                    <label for="username">Username</label>
                                    <input type="text" class="form-control"  id="username" value="author1" name="login" placeholder="Enter username">
                                </div>
                                <div class="mb-3">
                                    <label for="userpassword">Password</label>
                                    <input type="password" class="form-control" value="author1"  id="userpassword" name="motdepasse" placeholder="Enter password">
                                </div>
                                <div class="mb-3 row mt-4">
                                    <div class="col-6">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="customControlInline">
                                            <label class="form-check-label" for="customControlInline">Remember me
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-6 text-end">
                                        <button class="btn btn-primary w-md waves-effect waves-light" type="submit">Log In</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mt-5 text-center">
            <script>
                document.write(new Date().getFullYear())
            </script> Lexa <span class="d-none d-sm-inline-block"> - Crafted with <i class="mdi mdi-heart text-danger"></i> by Themesbrand.</span>
        </div>

    </div>
</div>

<!-- JAVASCRIPT -->
<script src="/assets/libs/jquery/jquery.min.js"></script>
<script src="/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/assets/libs/metismenu/metisMenu.min.js"></script>
<script src="/assets/libs/simplebar/simmlebar.min.js"></script>
<script src="/assets/libs/node-waves/waves.min.js"></script>
<script src="/assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
<!-- App js -->
<script src="/assets/js/app.js"></script>
</body>


<!-- Mirrored from themesbrand.com/lexa/layouts/pages-login.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Jan 2023 07:55:41 GMT -->

</html>