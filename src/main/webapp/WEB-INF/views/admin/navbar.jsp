<%@ page import="com.springmvc.model.Annonce" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Princy
  Date: 05/05/2023
  Time: 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int number = (int) session.getAttribute("non-valide");
%>
<!-- ========== Left Sidebar Start ========== -->
<div class="vertical-menu">

    <div data-simplebar class="h-100">

        <!--- Sidemenu -->
        <div id="sidebar-menu">
            <!-- Left Menu Start -->
            <ul class="metismenu list-unstyled" id="side-menu">
                <li class="menu-title">Annonce</li>
                <li>
                    <a href="/sites-IA/backoffice/page-add-annonce.itu">
                        <span>Ajout Annonce</span>
                    </a>
                </li>
                <li>
                    <a href="/sites-IA/backoffice/liste-annonce-invalid&amp;valid.itu">
                        <span>Listes des annonces <span class="badge rounded-pill bg-warning float-end"><%= number %></span></span>
                    </a>
                </li>
            </ul>
        </div>
        <!-- Sidebar -->
    </div>
</div>
<!-- Left Sidebar End -->

<!-- ============================================================== -->
<!-- Start right Content here -->
<!-- ============================================================== -->
<div class="main-content">

    <div class="page-content">
        <div class="container-fluid">
