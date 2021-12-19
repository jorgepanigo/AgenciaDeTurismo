

package logica;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;


@Entity
public class Cliente extends Persona {
    
    @OneToMany
    List<Venta> ventas = new ArrayList<>();

    public Cliente(int id, String nombre, String apellido, String dni, String direccion, String nacionalidad, String calular, String email, Date fechaNac) {
        super(id, nombre, apellido, dni, direccion, nacionalidad, calular, email, fechaNac);
    }

    public Cliente() {
    }

    public List<Venta> getVentas() {
        return ventas;
    }

    public void setVentas(List<Venta> ventas) {
        this.ventas = ventas;
    }
    
    

    

  
}
