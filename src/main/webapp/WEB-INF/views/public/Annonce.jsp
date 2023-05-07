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
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <h1 style="color: #7b70be;"><%= annonce.getTitre() %></h1>
                <h4><%= annonce.getResume() %></h4>
                <p style="font-size: 10px"> Date publication : <%= annonce.getDatepublication() %></p>
                <br>
                <%= annonce.getContenu() %>
            </div>
        </div>
    </div>
</div>



<jsp:include page="footer.jsp"></jsp:include>
