<%@page import="logica.Paquete"%>
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
    <title>Modificar Paquete - Silicon Travel </title>
    
    
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
                            <h4>Vista Previa de Paquete Modificado</h4>
                            <p class="mb-0">Actualizacion de datos y servicios incluidos en paquetes turisticos. </p>
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
                                <h4 class="card-title">Informacion del Paquete</h4>
                            </div>
                            <div class="card-body">
                                <form action="SvPaqueteM" method="POST">
                                <table style=" width: 100%;">
                                    
                                    <tr>
                                        <td style="font-weight:600;" colspan="5"></td>
                                        
                                    </tr>
                                    
                                    <%
                                        ControladoraLogica controlL = new ControladoraLogica();
                                        
                                        Paquete p = (Paquete) request.getAttribute("paquete");
                                        
                                        Double costoPaquete = 0.0;        
                                        
                                    
                                    %>
                                    
                                    
                                    <tr>
                                        <td style="font-weight: 600;" width="20%">Nombre del paquete:</td>
                                        <td style="text-align: left;"><%= p.getNombre()%></td>
                                        <td style="text-align: right; font-weight: 600;"></td>
                                        <td style="text-align: left;"></td>
                                        <td style="text-align: left;"></td>
                                    </tr>
                                    <tr>
                                        <td style="font-weight: 600;" colspan="5">Datalle de Servicios</td>
                                        
                                    </tr>
                                    <tr>
                                        <td style="">Codigo</td>
                                        <td style="">Nombre</td>
                                        <td style="">Fecha</td>
                                        <td style="">Destino</td>
                                        <td style="text-align: right;">Precio</td>
                                        
                                    </tr>
                                    
                                    
                                    <%
                                        
                                    for (Servicio s : p.getListaServicios()) {
                                            %>
                                        
                                        <tr>
                                            <td style=""><%= s.getCodigoProducto()%></td>
                                            <td style=""><%= s.getNombre()%></td>
                                            <td style=""><%= controlL.dateAString(s.getFechaServicio())%></td>
                                            <td style=""><%= s.getDestino()%></td>
                                            <td style="text-align: right;"><%= controlL.verDosDecinales(s.getCosto())%></td>
                                        </tr>
                                        
                                        
                                    
                                     <%   
                                         costoPaquete +=  s.getCosto();
                                         }

                                   

                                    %>
                                    


                                    <tr>
                                        <td style=""></td>
                                        <td style=""></td>
                                        <td style=""></td>
                                        <td style="text-align: right;">SubTotal</td>
                                        <td style="text-align: right;">$ <%= controlL.verDosDecinales(costoPaquete)%></td>
                                    </tr>
                                    <tr>
                                        <td style=""></td>
                                        <td style=""></td>
                                        <td style=""></td>
                                        <td style="text-align: right;">Descuentos</td>
                                        <td style="text-align: right;">$ <%= controlL.verDosDecinales(costoPaquete*0.10)%></td>
                                    </tr>
                                    <tr>
                                        <td style=""></td>
                                        <td style=""></td>
                                        <td style=""></td>
                                        <td style="text-align: right;">Total</td>
                                        <td style="text-align: right;">$ <%= controlL.verDosDecinales(costoPaquete*0.90)%></td>
                                    </tr>
                                    
                                    
                                    
                                </table>   
                                    
                                <%
                                p.setCosto(costoPaquete*0.90);
                                
                              

                               session.setAttribute("paqueteM", p);
                                %>    
                                
                                <button type="submit" class="btn btn-primary">Guardar Cambios</button>                          
                                
                                </form>
                        
                        
                       
                        
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