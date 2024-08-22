<%@ include file="conecta.jsp" %>
<html>
<head>
<title>Ingreso Datos Grabar</title></head>
<body>
<%
 try{
    PreparedStatement instruccion=c.prepareStatement("INSERT INTO trabajadores (Documento, Nombre, Contacto) VALUES (?,?,?)");
    instruccion.setString(1,request.getParameter("documento"));
    instruccion.setString(2,request.getParameter("nombre"));
    instruccion.setString(3,request.getParameter("contacto"));
    instruccion.executeUpdate();
    instruccion.close();
    response.sendRedirect("menu.jsp");
 }catch (Exception e){
    System.out.println(e.toString());
 }
 %>
</body>
</html>