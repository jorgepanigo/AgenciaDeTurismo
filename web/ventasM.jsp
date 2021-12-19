<%@page import="logica.Venta"%>
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
    <title>Actualizar Venta - Silicon Travel </title>
    
    
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./img/favicon.png">

    
    <!-- Color picker -->
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
                            <h4>Actualizacion de Venta</h4>
                            <p class="mb-0">Modificacion de datos de operaciones. </p>
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
                                    <form action="SvVentaM" method="POST">
                                                                                         
                                                   
                                                   <%
                                                       
                                        ControladoraLogica controlL = new ControladoraLogica();

                                        int id = Integer.parseInt(request.getParameter("venta"));
                                        
                                        Venta v = controlL.ventaF(id);
                                        
                                        List<Empleado> listadoEmpleados = controlL.empleadoL();                                                                     
                                        List<Cliente> listadoClientes = controlL.clienteL();
                                        List<MedioDePago> listadoMediosDePago = controlL.medioDePagoL();
                                        List<Servicio> listadoServicios = controlL.servicioL();
                                        List<Paquete> listadoPaquetes = controlL.paqueteL();
                                        
                                                       

                                                       

                                        %> 
                                                    
                                                

                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <input hidden name="idventa" value="<%= v.getNumVenta() %>"></input>
                                                <input hidden name="fechaventa" value="<%= controlL.dateAString(v.getFechaVenta()) %>"></input>
                                               
                                                
                                                <label>Empleado</label>
                                                <select name="idempleado" class="form-control" required>
                                                    
                                                 <% 
                                                        for (Empleado e : listadoEmpleados) {
                                                            if( e.getId() == v.getEmpleado().getId()){
                                                    %>
                                                                   <option selected value="<%=e.getId() %>"><%= e.getId()+" | "+ e.getNombre().toUpperCase()+" "+e.getApellido().toUpperCase()%></option>
                                                                    
                                                    <%       
                                                         
                                                        }else{
                                                    %>
                                                                    <option value="<%= e.getId()%>"><%= e.getId()+" | "+ e.getNombre().toUpperCase()+" "+e.getApellido().toUpperCase()%></option>
                                                    <%          
                                                        }  
                                                        
                                                        }   
                                                    %>
                                                </select>
                                                
                                                
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div  class="form-group col-md-6">
                                                <label>Cliente</label>
                                               
                                                <select name="idcliente" class="form-control" required>
                                                    
                                                    <% 
                                                        for (Cliente c : listadoClientes) {
                                                            if( c.getId() == v.getCliente().getId()){
                                                    %>
                                                                   <option selected value="<%=c.getId()%>"><%= "DNI: "+c.getDni()+" | "+c.getNombre()+" "+c.getApellido() %></option>
                                                                    
                                                    <%       
                                                         
                                                        }else{
                                                    %>
                                                                    <option value="<%= c.getId() %>"><%= "DNI: "+c.getDni()+" | "+c.getNombre()+" "+c.getApellido() %></option>
                                                    <%          
                                                        }  
                                                        
                                                        }   
                                                    %>
                                                 </select>    

                                                   
                                                    
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label>Medio de Pago</label>
                                               <select name="idpago" class="form-control" required>
                                                 
                                                    
                                                    
                                                    <% 
                                                        for (MedioDePago m : listadoMediosDePago) {
                                                            if( m.getId() == v.getMedioDePago().getId()){
                                                    %>
                                                                   <option selected value="<%= m.getId() %>"><%= m.getNombre() %></option>
                                                                    
                                                    <%       
                                                         
                                                        }else{
                                                    %>
                                                                    <option value="<%= m.getId() %>"><%= m.getNombre() %></option>
                                                    <%          
                                                        }  
                                                        
                                                        }   
                                                    %>
                                                   
                                                    </select>
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label>Tipo de Item</label></br>
                                                
                                                   <%
                                                   if (v.getTipoProducto().equals("S")){
                                                   %>
                                                        <label class="radio-inline" onclick="verServicios()">
                                                            <input type="radio" name="tipoitem" onclick="verServicios()" value="S" checked> Servico</label>
                                                        <label class="radio-inline" onclick="verPaquetes()">
                                                            <input type="radio" name="tipoitem" onclick="verPaquetes()" value="P"> Paquete</label>
                                                        
                                                    <%
                                                    }
                                                        if (v.getTipoProducto().equals("P")){
                                                   %>
                                                         <label class="radio-inline" onclick="verServicios()">
                                                            <input type="radio" name="tipoitem" onclick="verServicios()" value="S" > Servico</label>
                                                        <label class="radio-inline" onclick="verPaquetes()">
                                                            <input type="radio" name="tipoitem" onclick="verPaquetes()" value="P" checked> Paquete</label>
                                                        
                                                        </script>
                                                           
                                                        </script>
                                                    <%}%>
                                            </div>
                                            
                                                    
                                            <div class="form-group col-md-12" id="listaPaquetes">
                                                <label>Producto</label>
                                                 
                                                
                                                
                                                <select hidden=""  name="paquete" class="form-control" id="selectPaquete" required>
                                                    
                                                        <option  selected value="x" >Ninguno - Seleccione Paquete</option>
                                                        
                                                    <% 
                                                        for (Paquete p : listadoPaquetes) {
                                                            if( p.getCodigoProducto()== v.getDetalleProductos().getCodigoProducto()){
                                                    %>
                                                                   <option selected value="<%= p.getCodigoProducto() %>"><%= p.getCodigoProducto() + " | " + p.getNombre() + " | " + p.getCosto() %></option>
                                                                    
                                                    <%       
                                                         
                                                        }else{
                                                    %>
                                                                    <option value="<%= p.getCodigoProducto() %>"><%= p.getCodigoProducto() + " | " + p.getNombre() + " | " + p.getCosto() %></option>
                                                    <%          
                                                        }  
                                                        
                                                        }   
                                                    %>
                                                        
                                                    </select>
                                                    
                                                    <select hidden="" name="servicio" class="form-control" id="selectServicio" required>
                                                        
                                                        <option  selected value="x" >Ninguno - Seleccione Servicio</option>
                                                     
                                                    <% 
                                                        for (Servicio s : listadoServicios) {
                                                            if( s.getCodigoProducto()== v.getDetalleProductos().getCodigoProducto()){
                                                    %>
                                                                   <option selected value="<%= s.getCodigoProducto() %>"><%= s.getCodigoProducto() + " | " + s.getNombre() + " | " + s.getCosto() %></option>
                                                                    
                                                    <%       
                                                         
                                                        }else{
                                                    %>
                                                                    <option value="<%= s.getCodigoProducto() %>"><%= s.getCodigoProducto() + " | " + s.getNombre() + " | " + s.getCosto() %></option>
                                                    <%          
                                                        }  
                                                        
                                                        }   
                                                    %>
                                                    
                                                    
                                                    </select>
                                                    
                                                    
                                            </div>
                                            
                                            
                                            
                                            
                                            
                                            
                                        </div>

                                        
                                       
                                        <button type="submit" class="btn btn-primary">Guardar Cambios</button>
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
    <!-- Color picker init -->
    <script src="./js/plugins-init/material-date-picker-init.js"></script>
    <!-- Pickdate -->
    <script src="./js/plugins-init/pickadate-init.js"></script>
    
    <script src="./js/mis_scripts.js"></script>
    <%}%>
</body>

</html>