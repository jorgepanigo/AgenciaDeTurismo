

package logica;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;


@Entity
public class Empleado extends Persona{
    
    
    @Basic
    private String cargo;
    private Double sueldo;
    
    @OneToMany
    List<Venta> ventas = new ArrayList<>();
    
    @OneToOne
    private Usuario usuario;

    public Empleado(String cargo, Double sueldo, Usuario usuario, int id, String nombre, String apellido, String dni, String direccion, String nacionalidad, String calular, String email, Date fechaNac) {
        super(id, nombre, apellido, dni, direccion, nacionalidad, calular, email, fechaNac);
        this.cargo = cargo;
        this.sueldo = sueldo;
        this.usuario = usuario;
    }

    public Empleado(String cargo, Double sueldo, int id, String nombre, String apellido, String dni, String direccion, String nacionalidad, String calular, String email, Date fechaNac) {
        super(id, nombre, apellido, dni, direccion, nacionalidad, calular, email, fechaNac);
        this.cargo = cargo;
        this.sueldo = sueldo;
    }
    
    

    public Empleado() {
    }

    
    
    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public Double getSueldo() {
        return sueldo;
    }

    public void setSueldo(Double sueldo) {
        this.sueldo = sueldo;
    }

    public List<Venta> getVentas() {
        return ventas;
    }

    public void setVentas(List<Venta> ventas) {
        this.ventas = ventas;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    
}
