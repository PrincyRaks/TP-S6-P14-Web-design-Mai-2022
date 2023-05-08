<%@ page import="com.springmvc.model.Annonce" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Princy
  Date: 05/05/2023
  Time: 13:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="navbar.jsp"></jsp:include>

<div class="row">
    <div class="card">
        <div class="card-body">
                        <img src="/assets/images/intelligence artificielle.jpeg" alt="intelligence-artificielle">
                        <div class="carousel-caption d-none d-md-block">
                            <h1 class="text-white">Site d’informations sur l’intelligence artificielle</h1>
                            <strong>Découvrez les dernières avancées en matière d'intelligence artificielle, les applications pratiques dans différents domaines et les enjeux éthiques associés à l'utilisation de l'IA sur notre site d'informations sur l'IA</strong>
            </div>
        </div>
    </div>
</div>

<div class="card" style="width: 300px;float: left;">
    <div class="card-body">
        <div class="row">
            <form action="/sites-IA/public/searching-annonce.gg" method="get" >
                <div class="mb-3">
                    <label class="form-label">Titre</label>
                    <input data-parsley-type="alphanum" name="titre" type="text"
                           class="form-control"
                           placeholder="Titre"/>
                    <br>
                    <button type="submit" class="btn btn-primary waves-effect waves-light me-1">
                        Searching
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="row" style="clear: right;">
    <%
        List<Annonce> li = (List<Annonce>) request.getAttribute("liste");
        for (Annonce annonces: li) {
    %>
    <div class="col-lg-4">
        <div class="card">
            <img class="card-img-top img-fluid" src="data:image/jpeg;base64,<%= annonces.getPhoto() %>" alt="<%= annonces.getNomphoto() %>">
            <div class="card-body">
                <h2 class="card-title" style="color: #7b70be;"><%= annonces.getTitre() %></h2>
                <p class="card-text"><%= annonces.getResume() %> </p>
                <p>Date publication : <%= annonces.getDatepublication() %> </p>
                <a href="/sites-IA/public/annonce-read-<%= annonces.getId() %>.gg" class="btn btn-primary waves-effect waves-light">En savoir plus</a>
                </p>
            </div>
        </div>
    </div>

    <%
        }
    %>
</div>

<jsp:include page="../footer.jsp"></jsp:include>
