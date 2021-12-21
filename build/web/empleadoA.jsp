<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Nuevo Empleado - Silicon Travel </title>
    
    
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
                            <h4>Alta de Empleado</h4>
                            <p class="mb-0">Formulario de alta en el sistema para nuevos empleados. </p>
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
                                <h4 class="card-title">Datos del Empleado</h4>
                            </div>
                            <div class="card-body">
                                <div class="basic-form">
                                    <form action="SvEmpleadoA" method="post">

                                        <div class="form-row">
                                            <div class="form-group col-md-4">
                                                <label>DNI</label>
                                                <input name="dni" type="text" class="form-control">
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label>Nombre</label>
                                                <input name="nombre" type="text" class="form-control">
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label>Apellido</label>
                                                <input name="apellido"  type="text" class="form-control">
                                            </div>
                                            <div class="form-group col-md-8">
                                                <label>Direccion</label>
                                                <input name="direccion" type="text" class="form-control">
                                            </div>
                                            <div class="form-group col-md-4">
                                                 <label>Fecha de Nacimiento</label>
                                                 <input name="fechanac" type="date" class="form-control" id="mdate" placeholder="dd-mm-aaaa">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label>Nacionalidad</label>
                                                <input name="nacionalidad" type="text" class="form-control">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label>Celular</label>
                                                <input name="celular" type="text" class="form-control">
                                            </div>
                                           
                                            <div class="form-group col-md-3">
                                                <label>Cargo</label>
                                                <input name="cargo" type="text" class="form-control">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label>Sueldo</label>
                                                <input name="sueldo" type="text" class="form-control">
                                            </div>
                                             <div class="form-group col-md-6">
                                                <label>Email</label>
                                                <input name="email" type="email" class="form-control">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label>Usuario</label>
                                                <input name="usuario" type="text" class="form-control" required="">
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label>Contraseña</label>
                                                <input name="password" type="password" class="form-control" required="">
                                            </div>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Guardar</button>
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