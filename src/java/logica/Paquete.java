

package logica;


import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;


@Entity
public class Paquete extends Producto{
  
    
    
    @ManyToMany 
    List<Servicio> listaServicios = new ArrayList<>();
    
    @OneToMany
    List<Venta> ventas = new ArrayList<>();


    public Paquete(int codigoProducto, String nombre, Double costo, List<Servicio> items) {
        super(codigoProducto, nombre, costo);
        this.listaServicios = items;
    }

    public Paquete() {
    }
    
    

    public List<Servicio> getListaServicios() {
        return listaServicios;
    }

    public void setListaServicios(List<Servicio> listaServicios) {
        this.listaServicios = listaServicios;
    }
    
    
    
    

}
