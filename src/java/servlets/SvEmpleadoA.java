
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.ControladoraLogica;



@WebServlet(name = "SvEmpleadoA", urlPatterns = {"/SvEmpleadoA"})
public class SvEmpleadoA extends HttpServlet {

    ControladoraLogica controlL = new ControladoraLogica();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
                String dni = request.getParameter("dni");
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String direccion = request.getParameter("direccion");
                String nacionalidad = request.getParameter("nacionalidad");
                String celular = request.getParameter("celular");
                String cargo = request.getParameter("cargo");
                Double sueldo = Double.valueOf(request.getParameter("sueldo"));
                String email = request.getParameter("email");
                String usuario = request.getParameter("usuario");
                String password = request.getParameter("password");
                Date fechaN = controlL.stringADate(request.getParameter("fechanac"));
                
                controlL.empleadoA(dni, nombre, apellido, direccion, fechaN, nacionalidad, celular, cargo, sueldo, email,usuario,password);
                
                response.sendRedirect(request.getContextPath() + "/empleadoL.jsp");
    }
 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
                
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
