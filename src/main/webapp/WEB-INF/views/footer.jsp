<%--
  Created by IntelliJ IDEA.
  User: Princy
  Date: 05/05/2023
  Time: 12:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
</div> <!-- container-fluid -->
</div>
<!-- End Page-content -->


<footer class="footer">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                © <script>
            </script> Lexa <span class="d-none d-sm-inline-block"> - Crafted with <i class="mdi mdi-heart text-danger"></i> by Themesbrand.</span>
            </div>
        </div>
    </div>
</footer>
</div>
<!-- end main content-->

</div>
<!-- END layout-wrapper -->

<!-- Right Sidebar -->
<div class="right-bar">
    <div data-simplebar class="h-100">
        <!-- Settings -->
        <hr class="mt-0" />

    </div> <!-- end slimscroll-menu-->
</div>
<!-- /Right-bar -->

<!-- Right bar overlay-->
<div class="rightbar-overlay"></div>


<script src="/assets/ckeditor5-build-classic/ckeditor.js" ></script>
<script>
    ClassicEditor
        .create( document.getElementById('idckeditor') , {
        } )
        .then( editor => {
            window.editor = editor;
        } )
        .catch( err => {
            console.error( err.stack );
        } );
</script>


<!-- JAVASCRIPT -->
<script src="/assets/libs/jquery/jquery.min.js"></script>
<script src="/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/assets/libs/metismenu/metisMenu.min.js"></script>
<script src="/assets/libs/node-waves/waves.min.js"></script>
<script src="/assets/js/pages/dashboard.init.js"></script>

<!-- email editor init -->
<script src="/assets/js/pages/email-editor.init.js"></script>

<!-- App js -->
<script src="/assets/js/app.js"></script>
</body>


<!-- Mirrored from themesbrand.com/lexa/layouts/email-compose.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Jan 2023 07:53:39 GMT -->

</html>
