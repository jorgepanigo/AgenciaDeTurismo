

package logica;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
public class Servicio extends Producto{
    
   
    @Basic
    private String descripcion;
    private String destino;
    
    @Temporal(TemporalType.DATE)
    private Date fechaServicio;
    
    @ManyToMany
    List<Paquete> listaPaquetes = new ArrayList<>();
    
    @OneToMany
    List<Venta> ventas = new ArrayList<>();

    public Servicio(String descripcion, String destino, Date fechaServicio, int codigoProducto, String nombre, Double costo) {
        super(codigoProducto, nombre, costo);
        this.descripcion = descripcion;
        this.destino = destino;
        this.fechaServicio = fechaServicio;
    }

    
    
    public Servicio() {
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public Date getFechaServicio() {
        return fechaServicio;
    }

    public void setFechaServicio(Date fechaServicio) {
        this.fechaServicio = fechaServicio;
    }

    public List<Paquete> getListaPaquetes() {
        return listaPaquetes;
    }

    public void setListaPaquetes(List<Paquete> listaPaquetes) {
        this.listaPaquetes = listaPaquetes;
    }

    
   
    
}
