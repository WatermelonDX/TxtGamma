<%@ include file="conecta.jsp" %>
<html>
<head>
<title>Modificar Trabajadores Grabar</title></head>
<body>
<%
 try{
    PreparedStatement instruccion=c.prepareStatement("UPDATE trabajadores SET Nombre=?, Contacto=? WHERE Documento=?");
    instruccion.setString(1,request.getParameter("nombre"));
    instruccion.setString(2,request.getParameter("contacto"));
    instruccion.setString(3,request.getParameter("documento"));
    instruccion.executeUpdate(); 
    instruccion.close();
    c.close();
    response.sendRedirect("menu.jsp");
 }catch (Exception e){
    System.out.println(e.toString());
 }
 %>
</body>
</html>