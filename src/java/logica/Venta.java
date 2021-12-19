

package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity

public class Venta implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int numVenta;
    
    @Temporal(TemporalType.DATE)
    private Date fechaVenta;
    
    @ManyToOne
    private Producto detalleProductos;
    
    @ManyToOne
    private MedioDePago medioDePago;
    
    
    @ManyToOne
    private Empleado empleado;
    
    @ManyToOne
    private Cliente cliente;
    
    @Basic
    private String tipoProducto;

    public Venta(int numVenta, Cliente cliente, Date fechaVenta, Producto detalleProductos, MedioDePago medioDePago, Empleado empleado, String tipoProducto) {
        this.numVenta = numVenta;
        this.fechaVenta = fechaVenta;
        this.detalleProductos = detalleProductos;
        this.medioDePago = medioDePago;
        this.empleado = empleado;
        this.tipoProducto = tipoProducto;
        this.cliente = cliente;
    }

    public Venta() {
    }

    public int getNumVenta() {
        return numVenta;
    }

    public void setNumVenta(int numVenta) {
        this.numVenta = numVenta;
    }

    public Date getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(Date fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public Producto getDetalleProductos() {
        return detalleProductos;
    }

    public void setDetalleProductos(Producto detalleProductos) {
        this.detalleProductos = detalleProductos;
    }

    public MedioDePago getMedioDePago() {
        return medioDePago;
    }

    public void setMedioDePago(MedioDePago medioDePago) {
        this.medioDePago = medioDePago;
    }

    public Empleado getEmpleado() {
        return empleado;
    }

    public void setEmpleado(Empleado empleado) {
        this.empleado = empleado;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public String getTipoProducto() {
        return tipoProducto;
    }

    public void setTipoProducto(String tipoProducto) {
        this.tipoProducto = tipoProducto;
    }

   

    
    
    
    
}


