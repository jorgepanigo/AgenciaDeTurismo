<%@page import="logica.MedioDePago"%>
<%@page import="logica.Empleado"%>
<%@page import="logica.ControladoraLogica"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.Cliente"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Listado de Medios de Pago - Silicon Travel </title>
    
    
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./img/favicon.png">
  
    <!-- Datatable -->
    <link href="./vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
    
   
    <link href="./vendor/jqvmap/css/jqvmap.min.css" rel="stylesheet">
    <link href="./css/style.css" rel="stylesheet">
    




</head>

<body>
    <!--*******************
        Check Login
    ********************-->  
    <%
        HttpSession miSession = request.getSession(true);

        if(miSession.getAttribute("usuario") == null)
        {
            response.sendRedirect("./login_requerido.jsp");

        }else{

    %>
    <!--*******************
       Fin Check Login
    ********************-->

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="sk-three-bounce">
            <div class="sk-child sk-bounce1"></div>
            <div class="sk-child sk-bounce2"></div>
            <div class="sk-child sk-bounce3"></div>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->


    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">
        
        <div class="nav-header"><jsp:include page="secciones/nav-header.jsp" />  </div>
        
        <div class="header"><jsp:include page="secciones/header.jsp"/> </div>
        
        <div class="quixnav"><jsp:include page="secciones/sidebar.jsp"/> </div>
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h4>Gestion de Medios de Pago</h4>
                            <p class="mb-0">Listado de medios de pago registrados en el sistema. </p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                       
                    </div>
                </div>
                <!-- row -->


                <div class="row">
                    
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Medios de Pago</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example" class="display" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>Codigo Interno</th>
                                                <th>Nombre</th>
                                                <th>Comision</th>
                                                <th>Accion</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                            
                                            ControladoraLogica controlL = new ControladoraLogica();
                                            
                                            List<MedioDePago> listadoMedios = controlL.medioDePagoL();
                                            
                                            for (MedioDePago m : listadoMedios) {      
                                            %>
                                                                
                                                <tr>
                                                                
                                                          <td><%= m.getId() %></td>
                                                          <td><%= m.getNombre()%></td>
                                                          <td><%= m.getComision()%></td>
                                                          <td>
                                                                <span>
                                                                    <a href="mPagoM.jsp?medio=<%= m.getId()%>" class="mr-4" data-toggle="tooltip" data-placement="top" title="Editar"><i class="fa fa-pencil color-muted"></i> </a>
                                                                    <a href="mPagoB.jsp?medio=<%= m.getId()%>" data-toggle="tooltip" data-placement="top" title="Eliminar"><i class="fa fa-close color-danger"></i></a>
                                                                </span>
                                                            </td>
                                                </tr>               
                                                                
                                                                
                                           <% }%>
                                            
     
                                        </tbody>
                                        <tfoot>
                                             <tr>
                                                <th>Codigo Interno</th>
                                                <th>Nombre</th>
                                                <th>Comison</th>
                                                <th>Accion</th>
                                                
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    

                </div>

            
        </div>
        <!--**********************************
            Content body end
        ***********************************-->


        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <jsp:include page="secciones/footer.jsp"/>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->



    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="./vendor/global/global.min.js"></script>
    <script src="./js/quixnav-init.js"></script>
    <script src="./js/custom.min.js"></script>


 
    <!-- Datatable -->
    <script src="./vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="./js/plugins-init/datatables.init.js"></script>
    
    <%}%>
</body>

</html>