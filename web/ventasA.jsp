<%@page import="logica.Empleado"%>
<%@page import="logica.Cliente"%>
<%@page import="logica.MedioDePago"%>
<%@page import="logica.Servicio"%>
<%@page import="logica.ControladoraLogica"%>
<%@page import="java.util.ArrayList"%>
<%@page import="logica.Paquete"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Nueva Venta - Silicon Travel </title>
    
    
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./img/favicon.png">
    
    <!-- MColor picker -->
    <link href="./vendor/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/duotone.css" integrity="sha384-R3QzTxyukP03CMqKFe0ssp5wUvBPEyy9ZspCB+Y01fEjhMwcXixTyeot+S40+AjZ" crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/fontawesome.css" integrity="sha384-eHoocPgXsiuZh+Yy6+7DsKAerLXyJmu2Hadh4QYyt+8v86geixVYwFqUvMU8X90l" crossorigin="anonymous"/>

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
                            <h4>Nueva Venta</h4>
                            <p class="mb-0">Registro de nuevas ventas. </p>
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
                                <h4 class="card-title">Datos de la Operacion</h4>
                            </div>
                            <div class="card-body">
                                <div class="basic-form">
                                    <form action="SvVentaA" method="POST">
                                                <%                                          
                                                    
                                                    ControladoraLogica controlL = new ControladoraLogica();
                                                    
                                                    
                                                    List<Paquete> listadoPaquetes= controlL.paqueteL();
                                                    List<Servicio> listadoServicios = controlL.servicioL();
                                                    List<MedioDePago> listadoMedioDePago = controlL.medioDePagoL();
                                                    List<Cliente> listadoClientes =  controlL.clienteL();
                                                    int idusu = Integer.parseInt(session.getAttribute("idusuario").toString());
                                                    
                                                 

                                                    Empleado empleado = controlL.empleadoFPorUsuario(idusu);
                                                    
                                                  
                                                    
                                                    
                                                    
                                                    
                                                %>

                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label>Empleado</label> 
                                                <input  name="idempleado" type="hidden" value="<%= empleado.getId()%>" class="form-control" readonly="" ></input>
                                                <input  type="text" value="<%= empleado.getId()+" | "+ empleado.getNombre().toUpperCase()+" "+empleado.getApellido().toUpperCase()%>" class="form-control" readonly="" ></input>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div  class="form-group col-md-6">
                                                <label>Cliente</label>
                                               
                                                <select name="idcliente" class="form-control" required>
                                                    <option  value="x" selected>Seleccione Cliente</option>
                                                    
                                                    
                                                    <% for (Cliente c  : listadoClientes) { %>
                                                   
                                                    <option value="<%= c.getId()%>"><%= "DNI: "+c.getDni()+" | "+c.getNombre()+" "+c.getApellido()%></option>
                                                    
                                                    <%}%>
                                                   
                                                    </select>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label>Medio de Pago</label>
                                               <select name="idpago" class="form-control" required>
                                                    <option  value="x" selected>Seleccione Medio de Pago</option>
                                                    
                                                    
                                                    <% for (MedioDePago m  : listadoMedioDePago) { %>
                                                   
                                                    <option value="<%=m.getId()%>"><%= m.getNombre()%></option>
                                                    
                                                    <%}%>
                                                   
                                                    </select>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label>Tipo de Item</label></br>
                                                    <label class="radio-inline" onclick="verServicios()">
                                                        <input type="radio" name="tipoitem" onclick="verServicios()" value="S"> Servico</label>
                                                    <label class="radio-inline" onclick="verPaquetes()">
                                                        <input type="radio" name="tipoitem" onclick="verPaquetes()" value="P"> Paquete</label>
                                            </div>
                                            
                                                    
                                            <div class="form-group col-md-12" id="listaPaquetes">
                                                <label>Producto</label>
                                                 
                                                
                                                
                                                <select hidden=""  name="paquete" class="form-control" id="selectPaquete" required>
                                                    <option  value="x" selected>Seleccione un Paquetes</option>
                                                        
                                                        <% for (Paquete p : listadoPaquetes) { %>

                                                        <option value="<%= p.getCodigoProducto()%>"><%= p.getCodigoProducto() + " | " + p.getNombre() + " | " + p.getCosto()%></option>

                                                        <%}%>
                                                        
                                                    </select>
                                                    
                                                    <select hidden="" name="servicio" class="form-control" id="selectServicio" required>
                                                        
                                                        <option  value="x" selected>Seleccione un Servicio</option>
                                                     
                                                        <% for (Servicio s : listadoServicios) {%>

                                                            <option value="<%=s.getCodigoProducto()%>"><%=s.getCodigoProducto() + " | " + s.getNombre() + " | " + s.getCosto()%></option>

                                                        <%}%>
                                                    
                                                    
                                                    </select>
                                                    
                                                    
                                            </div>
                                            
                                            
                                            
                                            
                                            
                                            
                                        </div>

                                        
                                       
                                        <button type="submit" class="btn btn-primary">Registrar Venta</button>
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


    <script src="./js/dashboard/dashboard-1.js"></script>-->
    <!-- Daterangepicker -->
    <!-- momment js is must -->
    <script src="./vendor/moment/moment.min.js"></script>
    <script src="./vendor/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- clockpicker -->
    <script src="./vendor/clockpicker/js/bootstrap-clockpicker.min.js"></script>
    <!-- asColorPicker -->
    <script src="./vendor/jquery-asColor/jquery-asColor.min.js"></script>
    <script src="./vendor/jquery-asGradient/jquery-asGradient.min.js"></script>
    <script src="./vendor/jquery-asColorPicker/js/jquery-asColorPicker.min.js"></script>
    <!-- Material color picker -->
    <script src="./vendor/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
    <!-- pickdate -->
    <script src="./vendor/pickadate/picker.js"></script>
    <script src="./vendor/pickadate/picker.time.js"></script>
    <script src="./vendor/pickadate/picker.date.js"></script>



    <!-- Daterangepicker -->
    <script src="./js/plugins-init/bs-daterange-picker-init.js"></script>
    <!-- Clockpicker init -->
    <script src="./js/plugins-init/clock-picker-init.js"></script>
    <!-- asColorPicker init -->
    <script src="./js/plugins-init/jquery-asColorPicker.init.js"></script>
    <!-- Material color picker init -->
    <script src="./js/plugins-init/material-date-picker-init.js"></script>
    <!-- Pickdate -->
    <script src="./js/plugins-init/pickadate-init.js"></script>
    
    <script src="./js/mis_scripts.js"></script>
    <%}%>
</body>

</html>