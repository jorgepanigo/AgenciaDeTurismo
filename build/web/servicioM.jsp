<%@page import="logica.Servicio"%>
<%@page import="logica.ControladoraLogica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Actualizacion de Servicio - Silicon Travel </title>
    
    
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./img/favicon.png">
   
    
    <!--Color Picker-->
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
                            <h4>Actualizacion de Servicio</h4>
                            <p class="mb-0">Modificacion de datos de servicios cargados. </p>
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
                                <h4 class="card-title">Servicio</h4>
                            </div>
                            <div class="card-body">
                                <div class="basic-form">
                                    <form action="SvServicoM" action="POST">

                                        <div class="form-row">
                                            <%
                                            int idServicio = Integer.parseInt(request.getParameter("servicio"));
                                            
                                            ControladoraLogica controlL = new ControladoraLogica();
                                            
                                            Servicio ser = controlL.ServicioF(idServicio); 
 
                                            %>
                                            
                                            
                                            <input hidden="true" value="<%= ser.getCodigoProducto() %>" name="id" type="text" class="form-control">
                                            
                                            
                                            <div class="form-group col-md-4">
                                                <label>Nombre</label>
                                                <input value="<%=ser.getNombre() %>" name="nombre" type="text" class="form-control">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label>Destino</label>
                                                <input value="<%= ser.getDestino() %>" name="destino" type="text" class="form-control">
                                            </div>
                                            <div class="form-group col-md-3">
                                                 <label>Fecha de Servicio</label>
                                                 <input  name="fechaserv" type="text" class="form-control" id="mdate" 
                                                         value="<%= controlL.dateAString(ser.getFechaServicio())%>"/>
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label>Costo</label>
                                                <input value="<%= ser.getCosto() %>" name="costo" type="text" class="form-control">
                                            </div>
                                            <div class="form-group col-md-12">
                                                <label>Descripcion Breve</label>
                                                <textarea name="descripcion" type="text" rows="4" class="form-control"><%= ser.getDescripcion() %></textarea>
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

        <!--**********************************
           Support ticket button start
        ***********************************-->

        <!--**********************************
           Support ticket button end
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


<!-- Daterangepicker  -->
    <script src="./js/plugins-init/bs-daterange-picker-init.js"></script>-->
    <!-- Clockpicker init-->
    <script src="./js/plugins-init/clock-picker-init.js"></script> 
    <!-- asColorPicker init -->
    <script src="./js/plugins-init/jquery-asColorPicker.init.js"></script>
    <!-- Material color picker init-->
    <script src="./js/plugins-init/material-date-picker-init.js"></script> 
    <!-- Pickdate -->
    <script src="./js/plugins-init/pickadate-init.js"></script>
    
    <%}%>
</body>

</html>