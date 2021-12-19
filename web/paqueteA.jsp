<%@page import="java.util.ArrayList"%>
<%@page import="logica.Servicio"%>
<%@page import="java.util.List"%>
<%@page import="logica.ControladoraLogica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Nuevo Paquete - Silicon Travel </title>
    
    
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
                            <h4>Confeccion de Nuevo Paquete</h4>
                            <p class="mb-0">Armado de paquetes turisticos con servicios pargados en el sistema. </p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                        
                    </div>
                </div>
                <!-- row -->


                <div class="row">
                    
                    <div class="col-xxl-12">
                        <div class="card">
                            
                           
                               
                            <div class="card-header">
                                <h4 class="card-title">Confeccion de Paquete</h4>
                            </div>
                            <div class="card-body">
                                
                                
                                <div class="basic-form">
                                     <form action="SvPaqueteConf" method="POST">

                                        <div class="form-row">
                                            <div class="form-group col-md-12">
                                                <label>Nombre</label>
                                                <input required name="nombre" type="text" class="form-control">
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label>Seleccion los Servicos que integraran el paquete.</label>
                                                
                                                    <%
                                                       
                                                       ControladoraLogica controlL = new ControladoraLogica();

                                                       List<Servicio> listaServicios = controlL.servicioL();

                                                       

                                                     %>
                                                        
                                                <select name="linea0" class="form-control" required>
                                                        
                                                        <option  value="" selected>Seleccione Servico</option>
                                                    
                                                    <% for (Servicio s : listaServicios) {%>

                                                    <option value="<%=s.getCodigoProducto()%>"><%= s.getCodigoProducto() + " | " + s.getNombre() + " | " + controlL.verDosDecinales(s.getCosto()) + " | " + s.getDestino() %></option>

                                                    <%}%>
                                                     
                                                    </select></br>
                                                    <select  name="linea1" class="form-control"  required>
                                                        
                                                        <option  value="" selected>Seleccione Servico</option>
                                                    
                                                    <% for (Servicio s : listaServicios) {%>

                                                        <option value="<%= s.getCodigoProducto()%>"><%= s.getCodigoProducto() + " | " + s.getNombre() + " | " + controlL.verDosDecinales(s.getCosto()) + " | " + s.getDestino() %></option>

                                                    <%}%>
                                                     
                                                    </select></br>
                                               
                                                
                                                <% for (int i = 2; i < 11; i++) {%>

                                                    <select name="linea<%= i%>" class="form-control" >
                                                    <option  value="x" selected>Seleccione Servico</option>
                                                    
                                                    <% for (Servicio s : listaServicios) {%>

                                                        <option value="<%= s.getCodigoProducto()%>"><%= s.getCodigoProducto() + " | " + s.getNombre() + " | " + controlL.verDosDecinales(s.getCosto()) + " | " + s.getDestino()%></option>

                                                    <%}%>
                                                     
                                                    </select></br> 
                                                
                                                <%}%>
                                                 
                                             </div>
                                          
                                        <button type="submit" class="btn btn-primary">Confirmar Paquete</button>
                                    </form>
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


 
-->
<!-- Datatable -->
    <script src="./vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="./js/plugins-init/datatables.init.js"></script>
    
     

   <%}%>

</body>

</html>