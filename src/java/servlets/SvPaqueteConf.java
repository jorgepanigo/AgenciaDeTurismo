
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.ControladoraLogica;
import logica.Paquete;
import logica.Servicio;

@WebServlet(name = "SvPaqueteConf", urlPatterns = {"/SvPaqueteConf"})
public class SvPaqueteConf extends HttpServlet {

    ControladoraLogica controlL = new ControladoraLogica();
    double totalConDesc;
    double totalSinDesc;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        
        
       
        

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        totalSinDesc = 0.0;
                
        
        String nombre = request.getParameter("nombre");
        
        List<Servicio> listaServicios = new ArrayList<>(); 
        
        Servicio s = new Servicio();
        
        for (int i = 0; i < 10; i++) {
            if(!request.getParameter("linea"+i).equals("x"))
            {
                int id = Integer.parseInt(request.getParameter("linea"+i));
                s = controlL.ServicioF(id);
                double costo = s.getCosto();
                totalSinDesc += costo;
                listaServicios.add(s);
            }
        }
        
        totalConDesc = totalSinDesc*0.90;
        
        Paquete p = new Paquete(0, nombre, totalConDesc, listaServicios);
        
        
        request.setAttribute("paquete", p);
        
        

        request.getRequestDispatcher("paquete_confirma.jsp").forward(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
