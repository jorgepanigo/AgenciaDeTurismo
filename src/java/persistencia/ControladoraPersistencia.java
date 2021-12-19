

package persistencia;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import logica.Cliente;
import logica.Empleado;
import logica.MedioDePago;
import logica.Paquete;
import logica.Servicio;
import logica.Usuario;
import logica.Venta;
import persistencia.exceptions.NonexistentEntityException;



public class ControladoraPersistencia {
   
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("Agencia_PU");
    
    EmpleadoJpaController emp = new EmpleadoJpaController(emf);
    MedioDePagoJpaController med = new MedioDePagoJpaController(emf);
    ClienteJpaController cli = new ClienteJpaController(emf);
    ServicioJpaController ser = new ServicioJpaController(emf);
    PaqueteJpaController paq = new PaqueteJpaController(emf);
    VentaJpaController ven = new VentaJpaController(emf);
    UsuarioJpaController usu = new UsuarioJpaController(emf);
    
    // Empleado ABML////////////////////////////////////////////////////////////////////////////////////
    
    public void nuevoEmpleado (Empleado e)
    {
        emp.create(e);
    }
    
     public List<Empleado> listaEmpleado() {
        
        return emp.findEmpleadoEntities();
    }

    public Empleado buscaEmpleado(int id) {
        return emp.findEmpleado(id);
    }

    public void modificaEmpleado(Empleado e ) {
        try {
            
            emp.edit(e);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borraEmpleado(int id) {
        try {
            emp.destroy(id);    
        } catch (persistencia.exceptions.NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    // Usuario ABML ///////////////////////////////////////////////////////////////////////////////////////
    
    
    public void nuevoUsuario(Usuario u) {
        usu.create(u);
    }

    public List<Usuario> listaUsuarios() {
        return  usu.findUsuarioEntities();
    }

    public Usuario buscaUsuario(int id) {
        return usu.findUsuario(id);
    }
    
    public void modificaUsuario(Usuario u) {
        try {
            usu.edit(u);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

     public void borraUsuario(int idUsuario) {
        try {
            usu.destroy(idUsuario);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     
    // Medios de Pago ABML///////////////////////////////////////////////////////////////////////////////
    
    public void nuevoMedioDePago (MedioDePago m)
    {
       med.create(m);
    }
    public List<MedioDePago> listaMedios() {
        return med.findMedioDePagoEntities();
    }

    public void modificaMedioDePago(MedioDePago m) {
        try {
            med.edit(m);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borraMedioDePago(int id) {
        try {
            med.destroy(id);
        } catch (persistencia.exceptions.NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public MedioDePago buscaMedioDePago(int id) {
        return med.findMedioDePago(id);
    }
    
    // Cliente ABML///////////////////////////////////////////////////////////////////////////////

    public void nuevoCliente(Cliente c) 
    {
        cli.create(c);
    }
    
     public List<Cliente> listaClientes() 
    {
        return cli.findClienteEntities();
    }
     
    public Cliente buscaCliente(int id) {
            
        return cli.findCliente(id);
        
    }

    public void modificaCliente(Cliente c) {
        try {
            cli.edit(c);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarCliente(int id) {
        try {
            cli.destroy(id);
        } catch (persistencia.exceptions.NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Servicio ABML ///////////////////////////////////////////////////////////////////////////////
    
     public void nuevoServicio(Servicio s)
     {
        ser.create(s);
     }

    public Servicio buscaServicio(int id) {
        return ser.findServicio(id);
    }

    public void modificaServicio(Servicio s) {
        try {
            ser.edit(s);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Servicio> listaServicios() {
        return ser.findServicioEntities();
    }

    public void borrarServicio(int id) {
       
        try {
            ser.destroy(id);
        } catch (persistencia.exceptions.NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }

   // Paquete ABML///////////////////////////////////////////////////////////////////////////////

    public void nuevoPaquete(Paquete p) {
        paq.create(p);
    }

    public List<Paquete> listaPaquetes() {
        
        return paq.findPaqueteEntities();

    }

    public Paquete buscaPaquete(int id) {
        return paq.findPaquete(id);
    }

    public void modificaPaquete(Paquete pa) {
        try {
            paq.edit(pa);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void borraPaquete(int id) {
        try {
            paq.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    // Ventas ABML //////////////////////////////////////////////////////////////////////////////
   
    public void nuevoVenta(Venta v) {
        ven.create(v);
    }
 
    public List<Venta> listaVentas() {
            return ven.findVentaEntities();
    }

    public Venta buscaVenta(int id) {
            return ven.findVenta(id);
    }

    public void modificaVenta(Venta v) {
        try {
            ven.edit(v);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarVenta(int idVenta) {
        try {
            ven.destroy(idVenta);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }


}