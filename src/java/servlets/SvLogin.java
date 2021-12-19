
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.ControladoraLogica;


@WebServlet(name = "SvLogin", urlPatterns = {"/SvLogin"})
public class SvLogin extends HttpServlet {
    
    ControladoraLogica controlL = new ControladoraLogica();
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        
        HttpSession miSession = request.getSession(true);
        
        
        
        if(controlL.validaLogin(usuario, password, request))
        {
            
            
            miSession.setAttribute("usuario", usuario);
            miSession.setAttribute("password", password);
            
            System.out.println("Id de usuario en svlogin: "+miSession.getAttribute("idusuario"));
            
 
            
            response.sendRedirect("./index.jsp");
        }else
        {
            response.sendRedirect("./login_error.jsp");
        }
           
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
