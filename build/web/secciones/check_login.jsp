<%
HttpSession miSession = request.getSession(true);

if(miSession.getAttribute("usuario") == null)
{
    response.sendRedirect("./login_requerido.jsp");
    
}else{

%>
