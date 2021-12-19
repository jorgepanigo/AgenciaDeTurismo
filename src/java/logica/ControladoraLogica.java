
package logica;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import persistencia.ControladoraPersistencia;

import servlets.SvServicioA;


public class ControladoraLogica {

    ControladoraPersistencia controlP = new ControladoraPersistencia();
    
    
    // Metodos Propios //////////////////////////////////////////////////////////////////////////////
 
    // Devuelve en un entero el dia del mes de una fecha determinada
    public int diaDelMes (Date fecha)
    {
        Date f = fecha;
        LocalDate local = f.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        int dia = local.getDayOfMonth();
        return dia;

    }
    
    // Duevuelve en un entero el numero del año de una fecha determinada
    public int Anio (Date fecha)
    {
        Date f = fecha;
        LocalDate local = f.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        int anio = local.getYear();
        return anio;

    }
    
    // Duevuelve en un entero el numero del mes de una fecha determinada
    public int mesDelAnio (Date fecha)
    {
        Date f = fecha;
        LocalDate local = f.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        int mes = local.getMonthValue();
        return mes;

    }
    
    // Procesa la ventas y devuelve un array de 31 posiciones que representan cada dis del mes
    // con las ganancias acumuladas para ese dia. Tiene en cuenta solo el mes en curso.
    public Double[] getGananciasDiarias ()
    {
        List<Venta> listadoVentas =  controlP.listaVentas();// Trae todas la ventas
        Double[] diasDelMes = new Double[31];
        Date diaActual = new Date();//Tama como parametro la fecha actual para comparar con las fechas de cada venta
       
        for (int i = 0; i < 31; i++) {diasDelMes[i] = 0.00;}//Inicializamos en cero los contadores
                
        for (Venta v : listadoVentas) {
            
            Producto producto = (Producto) v.getDetalleProductos();
            Date fechaVenta = v.getFechaVenta();
            int d = this.diaDelMes(fechaVenta);
           
            if(mesDelAnio(diaActual) == mesDelAnio(v.getFechaVenta())) //Filtra aquellas ventas que corresponden al mes en curso.
            {   
                //Acumula las ganancias teniendo en cuanta la comision segun mdio de pago.
                diasDelMes[d-1] += (producto.getCosto()*(v.getMedioDePago().getComision()/100)); 
            }
        }
 
        return diasDelMes;
   }
    
    //Encripta con MD5 el password de usuario en el alta o al momento de modificar 
    public String getMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(input.getBytes());
            BigInteger number = new BigInteger(1, messageDigest);
            String hashtext = number.toString(16);

            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
    
    // Procesa la ventas y devuelve un array de 12 posiciones que representan cada mes del año
    // con las ganancias acumuladas para ese mes. Tiene en cuenta solo el año en curso.   
    public Double[] getGananciasMensuales ()
    {
        List<Venta> listadoVentas =  controlP.listaVentas();//Trae todas la ventas
        Double[] mes = new Double[12];
        for (int i = 0; i < 12; i++) {mes[i] = 0.00;}//Inicializa los contadores
        
        for (Venta v : listadoVentas) {
            
           Date fecha = v.getFechaVenta();
           int m = this.mesDelAnio(fecha);
           if(Anio(new Date()) == Anio(v.getFechaVenta()))// Filtra solo la operaciones del año en curso
           {
               //Acumula las ganancias teniendo en cuenta la comision segun medio de pago.
                mes[m-1] += (v.getDetalleProductos().getCosto()*(v.getMedioDePago().getComision()/100));
           }
        }
        return mes;
    }
    
    // Valida si un usuario de encuentra en la DB al momento de que este se Logea devolviendo un booleano en respuesta
    public boolean validaLogin(String usuario, String password, HttpServletRequest request)
     {
         List<Usuario> listadousuarios = controlP.listaUsuarios();// Trae todos los usuarios
         HttpSession miSession = request.getSession(true); //Instancia una variable de tipo HttpSession para guardar el id de Usuario
         
         for (Usuario u : listadousuarios) {
             
             if (u.getUsuario().equals(usuario) & u.getPassword().equals(getMD5(password)))
             {
                //Guarda el id de usuario que sera utilizado para registrar ventas
                 miSession.setAttribute("idusuario",u.getId());
                 return true;
             }
             
         }
        return false;
    }
     
    // Parsea a String una fecha de tipo Date determinada y le asigna formato correspondiente.
    public String dateAString(Date fecha) {
        DateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
        return formato.format(fecha);
    }
    // Parsea a Date una fecha de tipo String determinada y le asigna formato correspondiente.
    public Date stringADate(String fecha) {

        SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
        Date fechaServ = new Date();
        try {
            return formato.parse(fecha);
        } catch (ParseException ex) {
            Logger.getLogger(SvServicioA.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fechaServ;
    }
    
    // Devuelve la fecha actual en un formato determinado
    public Date getFechaActual() {
        SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
        Date fechaServ = new Date();

        return fechaServ;
    }
    
    //Formatea las variable de tipo Double para que se visualizen con solo dos decimales
    public String verDosDecinales(Double numero)
    {
        return String.format("%.2f", numero);
    }
    

    // Medio de Pago ABML//////////////////////////////////////////////////////////////////////////////
    
    public void medioDePagoA(String nombre, Double comision) {

        MedioDePago m = new MedioDePago(0, nombre, comision);

        controlP.nuevoMedioDePago(m);

    }
    
    public List<MedioDePago> medioDePagoL() {
        
        return controlP.listaMedios();
    }

    public void medioDePagoM(int id, String nombre, Double comision) {
        
        MedioDePago m = new MedioDePago(id, nombre, comision);

        controlP.modificaMedioDePago(m);
    }

    public void medioDePagoB(int id) {
        
        controlP.borraMedioDePago(id);
    }

    public MedioDePago medioDePagoF(int id) {
        
        return controlP.buscaMedioDePago(id);
    }
    
    // Cliente ABML//////////////////////////////////////////////////////////////////////////////
    

    public void clienteA(String dni, String nombre, String apellido, String direccion, Date fechaNac, String nacionalidad, String celular, String email) {

        Cliente c = new Cliente(0, nombre, apellido, dni, direccion, nacionalidad, celular, email, fechaNac);

        controlP.nuevoCliente(c);
    }

    public Cliente clienteF(int id) {
        return controlP.buscaCliente(id);
    }
    
    public List<Cliente> clienteL() {
        return controlP.listaClientes();
    }

     public void clienteM(int id, String dni, String nombre, String apellido, String direccion, Date fechaNac, String nacionalidad, String celular, String email) {
        Cliente c = new Cliente(id, nombre, apellido, dni, direccion, nacionalidad, celular, email, fechaNac);

        controlP.modificaCliente(c);
    }

    public void clienteB(int id) {

        controlP.borrarCliente(id);
    }
    
    // Empleados ABML //////////////////////////////////////////////////////////////////////////////
    
    public void empleadoA(String dni, String nombre, String apellido, String direccion, Date fechaNac, String nacionalidad, String celular, String cargo, Double sueldo, String email, String usuario, String password) {
        
        Usuario u = new Usuario(0, usuario, getMD5(password));
        
        controlP.nuevoUsuario(u);
        
        Empleado e = new Empleado(cargo, sueldo, u, 0, nombre, apellido, dni, direccion, nacionalidad, celular, email, fechaNac);
        
        controlP.nuevoEmpleado(e);
       
    }

    public Empleado empleadoF(int id) {
        return controlP.buscaEmpleado(id);
    }
    
     public Empleado empleadoFPorUsuario(int idUsuario) {
        
        List<Empleado> todosLosEmpleados = this.empleadoL();
        
         for (Empleado e : todosLosEmpleados) {
             if(e.getUsuario().getId() == idUsuario)
             {
                 
                 return e;
             }
         }
         
         return null;

    }

    public List<Empleado> empleadoL() {
        return controlP.listaEmpleado();
    }

    public void empleadoM(int id, String dni, String nombre, String apellido, String direccion, Date fechaNac, String nacionalidad, String celular, String email, Double sueldo, String cargo, String usuario, String password) {
        Usuario u;
        
        Usuario usuarioPercistido = controlP.buscaUsuario(controlP.buscaEmpleado(id).getUsuario().getId());
        
        if(usuarioPercistido.getPassword().equals(password))
        {
            u = new Usuario (usuarioPercistido.getId(), usuario, password);
        }else{
            u = new Usuario (usuarioPercistido.getId(), usuario, getMD5(password));
        }
        
        controlP.modificaUsuario(u);
        
        Empleado e = new Empleado(cargo, sueldo, u, id, nombre, apellido, dni, direccion, nacionalidad, celular, email, fechaNac);

        controlP.modificaEmpleado(e);
    }

    public void empleadoB(int id) {
        Usuario usuarioPercistido = controlP.buscaEmpleado(id).getUsuario();
        
        controlP.borraEmpleado(id);
        
        controlP.borraUsuario(usuarioPercistido.getId());
        
        
    }
    
    // Servicio ABML//////////////////////////////////////////////////////////////////////////////

    public void servicoA(String nombre, String destino, Date fechaServ, Double costo, String descripcion) {

        Servicio s = new Servicio(descripcion, destino, fechaServ, 0, nombre, costo);

        controlP.nuevoServicio(s);
    }

    public Servicio ServicioF(int id) {
        return controlP.buscaServicio(id);
    }

    public void servicioM(int id, String nombre, String destino, Date fechaServ, Double costo, String descripcion) {

        Servicio s = new Servicio(descripcion, destino, fechaServ, id, nombre, costo);

        controlP.modificaServicio(s);
    }

    public List<Servicio> servicioL() {
        return controlP.listaServicios();
    }

    public void ServicioB(int id) {
        controlP.borrarServicio(id);
    }

    // Paquete ABML//////////////////////////////////////////////////////////////////////////////

    public void paqueteA(Paquete p) {

        controlP.nuevoPaquete(p);
    }

    public List<Paquete> paqueteL() {
        return controlP.listaPaquetes();
    }

    public Paquete paqueteF(int id) {
        return controlP.buscaPaquete(id);
    }

   
    public void paqueteM(Paquete pa) {
        controlP.modificaPaquete(pa);
    }

    public void paqueteB(int id) {
        controlP.borraPaquete(id);
    }
    
     // Venta ABML//////////////////////////////////////////////////////////////////////////////


    public List<Venta> ventaL() {
        return controlP.listaVentas();
    }

    public Venta ventaF(int id) {
        return controlP.buscaVenta(id);
    }
    
    public void ventaA(int idEmpleado, int idCliente, int idMedioDePago, String tipoProducto, int idProducto) {

        Empleado e = controlP.buscaEmpleado(idEmpleado);
        Cliente c = controlP.buscaCliente(idCliente);
        MedioDePago m = controlP.buscaMedioDePago(idMedioDePago);
        String tipoProd = tipoProducto;

        Producto p = new Producto();

        if (tipoProd.equals("S")) {
            p = (Producto) controlP.buscaServicio(idProducto);
        }
        if (tipoProd.equals("P")) {
            p = (Producto) controlP.buscaPaquete(idProducto);
        }

        Venta v = new Venta(0, c, new Date(), p, m, e, tipoProd);

        controlP.nuevoVenta(v);
    }

    public void ventaM(int idVenta, Date fecha, int idEmpleado, int idCliente, int idMedioDePago, String tipoProducto, int idProducto) {

        Empleado e = controlP.buscaEmpleado(idEmpleado);
        Cliente c = controlP.buscaCliente(idCliente);
        MedioDePago m = controlP.buscaMedioDePago(idMedioDePago);
        String tipoProd = tipoProducto;

        Producto p = new Producto();

        if (tipoProd.equals("S")) {
            p = (Producto) controlP.buscaServicio(idProducto);
        }
        if (tipoProd.equals("P")) {
            p = (Producto) controlP.buscaPaquete(idProducto);
        }

        Venta v = new Venta(idVenta, c, fecha, p, m, e, tipoProd);

        controlP.modificaVenta(v);
    }

    public void ventaB(int idVenta) {
        controlP.borrarVenta(idVenta);
    }

}
