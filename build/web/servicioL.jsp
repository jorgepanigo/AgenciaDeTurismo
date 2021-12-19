<%@page import="java.util.ArrayList"%>
<%@page import="logica.Servicio"%>
<%@page import="logica.Servicio"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="logica.ControladoraLogica"%>
<%@page import="logica.ControladoraLogica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Gestion de Servicios - Silicon Travel </title>
    
    
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
                            <h4>Gestion de Servicios</h4>
                            <p class="mb-0">Administracion de servicos cargados. </p>
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
                                <h4 class="card-title">Listado de Servicios</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example" class="display" style="min-width: 845px">
                                        <thead>
                                            <tr>
                                                <th>Codigo Producto</th>
                                                <th>Nombre</th>
                                                <th>Destino</th>
                                                <th>Fecha Servicio</th>
                                                <th>Costo</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                   ControladoraLogica controlL = new ControladoraLogica();
                                                    
                                                   List<Servicio> listaServicios = controlL.servicioL();
                                                 
                                                   for (Servicio s : listaServicios) {%>
                                                   
                                                    <tr>
                                                        <td><%= s.getCodigoProducto()%></td>
                                                        <td><%= s.getNombre()%></td>
                                                        <td><%= s.getDestino()%></td>
                                                        <td><%= controlL.dateAString(s.getFechaServicio())%></td>
                                                        <td><%= controlL.verDosDecinales(s.getCosto())%></td>
                                                        
                                                        <td>
                                                            <span>
                                                                <a href="servicioM.jsp?servicio=<%= s.getCodigoProducto()%>" class="mr-4" data-toggle="tooltip" data-placement="top" title="Editar"><i class="fa fa-pencil color-muted"></i> </a>
                                                                <a href="servicioB.jsp?servicio=<%= s.getCodigoProducto()%>" data-toggle="tooltip" data-placement="top" title="Eliminar"><i class="fa fa-close color-danger"></i></a>
                                                            </span>
                                                        </td>
                                                     </tr>
                                                   
                                                   
                                                   <%}%>
                                            
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>Codigo Producto</th>
                                                <th>Nombre</th>
                                                <th>Destino</th>
                                                <th>Fecha Servicio</th>
                                                <th>Costo</th>
                                                <th>Acciones</th>
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