<%@ page import="com.springmvc.model.Annonce" %><%--
  Created by IntelliJ IDEA.
  User: Princy
  Date: 05/05/2023
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="navbar.jsp"></jsp:include>

<%
    Annonce annonce = (Annonce) request.getAttribute("annonce");
%>

<div class="row" style="margin-left: 280px;">
    <div class="col-xl-6" style="width: 700px;">
        <div class="card">
            <div class="card-body">
                <center><h4 class="card-title">Formulaire </h4></center>
                <form class="custom-validation" action="/sites-IA/backoffice/updating-annonce.itu" method="POST" enctype="multipart/form-data">
                    <input name="id" type="text" value="<%= annonce.getId() %>" hidden>
                    <input name="idadmin" type="text" value="<%= annonce.getIdadmin() %>" hidden>

                    <div class="mb-3">
                        <label class="form-label">Titre</label>
                        <div>
                            <input data-parsley-type="alphanum" name="titre" type="text" value="<%= annonce.getTitre() %>"
                                   class="form-control" required
                                   placeholder="Titre"/>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Resume</label>
                        <div>
                            <textarea  name="resume" required class="form-control" placeholder="Contenu" rows="5"><%= annonce.getResume() %></textarea>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-lable">Inserer une image</label>
                        <input type="file" name="sary" value="<%= annonce.getPhoto() %>" class="form-control" data-buttonname="btn-secondary">
                    </div>

                    <div class="mb-3" >
                        <label class="form-label">Contenu</label>
                        <div>
                            <textarea style="height: 100px" name="contenu" id="idckeditor" ><%= annonce.getContenu() %></textarea>
                        </div>
                    </div>


                    <div class="mb-0">
                        <div>
                            <button type="submit" class="btn btn-primary waves-effect waves-light me-1">
                                Modify
                            </button>
                            <button type="reset" class="btn btn-secondary waves-effect">
                                Cancel
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>


<jsp:include page="footer.jsp"></jsp:include>
