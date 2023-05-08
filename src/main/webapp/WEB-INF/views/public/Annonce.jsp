<%@ page import="com.springmvc.model.Annonce" %><%--
  Created by IntelliJ IDEA.
  User: Princy
  Date: 05/05/2023
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="navbar.jsp"></jsp:include>


<%
    Annonce annonce = (Annonce) request.getAttribute("annonce");
%>


<div class="row">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-xl-5">
                    <img width="480" height="285" class="card-img-top img-fluid" src="data:image/jpeg;base64,<%= annonce.getPhoto() %>" alt="<%= annonce.getNomphoto()%>">
                </div>
                <div class="col-xl-5" style="margin: auto" >
                    <h1 style="color: #7b70be;"><%= annonce.getTitre() %></h1>
                    <h4><%= annonce.getResume() %></h4>
                </div>
            </div>
            <hr>
            <div class="row">
                <%= annonce.getContenu() %>
                <br>
                <br>
                <h6 style="font-size: 10px"> Date publication : <%= annonce.getDatepublication() %></h6>
                <h6 style="font-size: 10px"> Auteur : <%= annonce.getAdmin().getLogin() %></h6>
            </div>
        </div>
    </div>
</div>



<jsp:include page="footer.jsp"></jsp:include>
