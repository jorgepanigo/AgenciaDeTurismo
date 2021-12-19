<%@page import="logica.Empleado"%>
<%@page import="logica.ControladoraLogica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Eliminar Empleado - Silicon Travel </title>
    
    
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./img/favicon.png">
    
    
    <!-- Material color picker -->
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
                            <h4>Eliminar Empleado</h4>
                            <p class="mb-0">Eliminacion de los datos del empleado. </p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                       
                    </div>
                </div>
                <!-- row -->

                
                <div class="row">
                    
                    <div class="col-xxl-12">
                        <div class="card text-white bg-danger">
                            <div class="card-header">
                                <h5 class="card-title text-white">Atencion</h5>
                            </div>
                            <div class="card-body mb-0">
                                <p class="card-text">Esta queriendo eliminar un registro de la base de datos. La eliminacion de dicho registro es irreversible.</p>
                               
                            </div>
                            
                        </div>
                    </div>
                    
                </div>

                
                <div class="row">
                    
                    <div class="col-xxl-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Datos del Empleado</h4>
                            </div>
                            <div class="card-body">
                                <div class="basic-form">
                                    <form action="SvEmpleadoB" method="POST">
                                        <%
                                            int idEmpleado = Integer.parseInt(request.getParameter("empleado"));
                                            
                                            ControladoraLogica controlL = new ControladoraLogica();
                                            
                                            Empleado e = controlL.empleadoF(idEmpleado); 
 
                                            %>
                                        <div class="form-row">
                                            <input hidden="true" name="id" value="<%= e.getId() %>" type="text" class="form-control" readonly="">
                                            
                                            <div class="form-group col-md-4">
                                                <label>DNI</label>
                                                <input name="dni" value="<%= e.getDni() %>" type="text" class="form-control" readonly="">
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label>Nombre</label>
                                                <input name="nombre" value="<%= e.getNombre() %>" type="text" class="form-control" readonly="">
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label>Apellido</label>
                                                <input name="apellido" value="<%= e.getApellido() %>" type="text" class="form-control" readonly="">
                                            </div>
                                            <div class="form-group col-md-8">
                                                <label>Direccion</label>
                                                <input name="direccion" value="<%= e.getDireccion() %>" type="text" class="form-control" readonly="">
                                            </div>
                                            <div class="form-group col-md-4">
                                                 <label>Fecha de Nacimiento</label>
                                                 <input name="fechanac" value="<%= controlL.dateAString(e.getFechaNac()) %>" type="text" class="form-control" id="mdate" readonly="">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label>Nacionalidad</label>
                                                <input name="nacionalidad" value="<%= e.getNacionalidad() %>" type="text" class="form-control" readonly="">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label>Celular</label>
                                                <input name="celular" value="<%= e.getCalular() %>" type="text" class="form-control" readonly="">
                                            </div>
                                           
                                            <div class="form-group col-md-3">
                                                <label>Cargo</label>
                                                <input name="cargo" value="<%= e.getCargo() %>" type="text" class="form-control" readonly="">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label>Sueldo</label>
                                                <input name="sueldo" value="<%= String.valueOf(e.getSueldo()) %>" type="text" class="form-control" readonly="">
                                            </div>
                                             <div class="form-group col-md-6">
                                                <label>Email</label>
                                                <input name="email" value="<%= e.getEmail() %>" type="email" class="form-control" readonly="">
                                            </div>
                                        </div>

                                        
                                       
                                        <button type="submit" class="btn btn-primary">Eliminar</button>
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


    <!-- Vectormap 
    <script src="./vendor/raphael/raphael.min.js"></script>
    <script src="./vendor/morris/morris.min.js"></script>-->

  <!-- 
    <script src="./vendor/circle-progress/circle-progress.min.js"></script>
    <script src="./vendor/chart.js/Chart.bundle.min.js"></script>

    <script src="./vendor/gaugeJS/dist/gauge.min.js"></script>-->

    <!--  flot-chart js 
    <script src="./vendor/flot/jquery.flot.js"></script>
    <script src="./vendor/flot/jquery.flot.resize.js"></script>-->

    <!-- Owl Carousel 
    <script src="./vendor/owl-carousel/js/owl.carousel.min.js"></script>-->

    <!-- Counter Up 
    <script src="./vendor/jqvmap/js/jquery.vmap.min.js"></script>
    <script src="./vendor/jqvmap/js/jquery.vmap.usa.js"></script>
    <script src="./vendor/jquery.counterup/jquery.counterup.min.js"></script>


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
    <%}%>
</body>

</html>