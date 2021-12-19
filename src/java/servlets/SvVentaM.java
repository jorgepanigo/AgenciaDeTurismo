/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.ControladoraLogica;

@WebServlet(name = "SvVentaM", urlPatterns = {"/SvVentaM"})
public class SvVentaM extends HttpServlet {

    ControladoraLogica controlL = new ControladoraLogica();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        int idVenta = Integer.parseInt(request.getParameter("idventa"));
        Date fecha = controlL.stringADate(request.getParameter("fechaventa"));
        int idEmpleado = Integer.parseInt(request.getParameter("idempleado"));
        int idCliente = Integer.parseInt(request.getParameter("idcliente"));
        int idMedioDePago = Integer.parseInt(request.getParameter("idpago"));
        String tipoProducto = request.getParameter("tipoitem");
        int idProducto = 0;
        
        if (tipoProducto.equals("P")){
            idProducto = Integer.parseInt(request.getParameter("paquete"));
        }
        if (tipoProducto.equals("S")){
            idProducto = Integer.parseInt(request.getParameter("servicio"));
        }
       
 
        controlL.ventaM(idVenta, fecha, idEmpleado, idCliente, idMedioDePago, tipoProducto, idProducto);
   
        response.sendRedirect("./ventasL.jsp");
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
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
