<%@ page import="com.springmvc.model.Admin" %>
<%@ page import="com.springmvc.model.Annonce" %><%--
  Created by IntelliJ IDEA.
  User: Princy
  Date: 05/05/2023
  Time: 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

    <%
        String title = "Sites sur d’informations sur l’intelligence artificielle";
        String description= "Backoffice-admin";
        if (request.getAttribute("annonce") != null ){
            Annonce annonce = (Annonce) request.getAttribute("annonce");
            title = title+"-"+ annonce.getTitre();
            description = title + "-"+description+"-"+ annonce.getTitre() + "-" + annonce.getResume();
        }
    %>

<head>
    <%--  Important  --%>
    <title><%= title %></title>
    <meta content= "<%= description %>" name="description" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- App favicon -->
    <link rel="shortcut icon" href="/assets/images/favicon.ico">

    <!-- Bootstrap Css -->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
<%--        <link href="/assets/css/icons.min.css" rel="stylesheet" type="text/css" />--%>

        <!-- App Css-->
    <link href="${pageContext.request.contextPath}/assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

</head>

<body data-sidebar="dark">

<!-- Begin page -->
<div id="layout-wrapper">

    <header id="page-topbar">
        <div class="navbar-header">
            <div class="d-flex">
                <!-- LOGO -->
                <div class="navbar-brand-box">
                    <a href="index.html" class="logo logo-dark">
                            <span class="logo-sm">
                                <img src="/assets/images/logo-sm.png" alt="" height="22">
                            </span>
                        <span class="logo-lg">
                                <img src="/assets/images/logo-dark.png" alt="" height="17">
                            </span>
                    </a>

                    <a href="index.html" class="logo logo-light">
                            <span class="logo-sm">
                                <img src="/assets/images/logo-sm.png" alt="" height="22" width="70">
                            </span>
                        <span class="logo-lg">
                                <img src="/assets/images/logo-light.png" alt="" height="18" width="70">
                            </span>
                    </a>
                </div>

            </div>

            <div class="d-flex">



                <div class="dropdown d-inline-block d-lg-none ms-2">
                    <button type="button" class="btn header-item noti-icon waves-effect" id="page-header-search-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="mdi mdi-magnify"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right p-0" aria-labelledby="page-header-search-dropdown">

                        <form class="p-3">
                            <div class="form-group m-0">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search ..." aria-label="Recipient's username">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="submit"><i class="mdi mdi-magnify"></i></button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <%
                    Admin admin = (Admin) session.getAttribute("admin");
                %>
                <div class="dropdown d-inline-block">
                    <button name="grand-plan" type="button" class="btn header-item waves-effect" id="page-header-user-dropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="mdi mdi-account-circle font-size-17 text-muted align-middle me-1"></i> <%= admin.getLogin() %>
                    </button>
                    <div class="dropdown-menu dropdown-menu-end">
                        <a class="dropdown-item text-danger" href="/sites-IA/backoffice/logout-admin.itu"><i class="mdi mdi-power font-size-17 text-muted align-middle me-1 text-danger"></i> Logout</a>
                    </div>
                </div>

            </div>
        </div>
    </header>
