<%@ page import="com.springmvc.model.Annonce" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Princy
  Date: 05/05/2023
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="navbar.jsp"></jsp:include>
<%
    List<Annonce> list = (List<Annonce>) request.getAttribute("annonces");
%>
<center><h2 style="color: #7b70be;"><i class="ion ion-md-albums"></i>  Liste des Annonces </h2></center>
<br>
<br>
<%

    if(request.getAttribute("info-success")!=null){
        String info = request.getAttribute("info-success").toString();%>
<center>
    <div style="width: 400px;" class="alert alert-success" role="alert">
        <strong>Succes</strong> <%= info %>
    </div>
</center>

<%   } else if (request.getAttribute("info-error") !=null) {
    String error = request.getAttribute("info-error").toString();
%>
<center>
    <div style="width: 400px;" class="alert alert-danger mb-0" role="alert">
        <strong>Error</strong> <%= error %>
    </div>
</center>
<% } %>
<div class="row">
    <%
        for (Annonce a: list) {
    %>
    <div class="col-md-6 col-lg-6 col-xl-3" style="width: 400px;">
        <div class="card">
            <img class="card-img-top img-fluid" src="data:image/jpeg;base64,<%= a.getPhoto() %>" alt="<%= a.getNomphoto() %>>">
            <div class="card-body">
                <form action="/sites-IA/backoffice/validate-publication.itu" method="post">
                    <h4 class="card-title" style="color: #7b70be;" ><%= a.getTitre() %></h4>
                    <p class="card-text"><%= a.getResume() %></p>
                    <input type="text" value="<%= a.getId() %>" name="idannonce" hidden>
                    <p style="font-size: 10px;">Date de creation: <%= a.getDateCreation() %> </p>

                    <%
                        if(a.getIdetat()==2){
                    %>
                    <p style="font-size: 10px;">Date de publication: <%= a.getDatepublication() %> </p>
                    <p><span class="badge bg-primary">publié</span></p>
                    <% } else if (a.getIdetat()==1) { %>
                    <p><span class="badge bg-info">non-publié</span></p>
                    <div class="mb-3">
                        <label>Date publication</label>
                        <div>
                            <div class="input-group" >
                                <input name="datepublication" type="datetime-local" class="form-control">
                            </div>
                        </div>
                    </div>

                    <br>

                    <a href="/sites-IA/backoffice/page-formulaire-modification-<%= a.getId() %>.itu" class="btn btn-outline-info waves-effect waves-light">
                        Modify
                    </a>


                    <button type="submit" class="btn btn-outline-primary waves-effect waves-light">
                        Publish
                    </button>
                    <% } %>


                </form>

            </div>
        </div>
    </div>
    <%
        }
    %>
</div>

<jsp:include page="footer.jsp"></jsp:include>
