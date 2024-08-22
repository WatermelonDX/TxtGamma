<%@ include file="conecta.jsp" %>
<html>
<head>
<title>Ingreso Telas Grabar</title></head>
<body>
<%
 try{
    PreparedStatement instruccion=c.prepareStatement("INSERT INTO Telas(Codigo, Nombre, Tipo, CantidadTotal) VALUES (?,?,?,?)");
    instruccion.setString(1,request.getParameter("codigo"));
    instruccion.setString(2,request.getParameter("nombre"));
    instruccion.setString(3,request.getParameter("tipo"));
	instruccion.setString(4,request.getParameter("CantidadTotal"));
    instruccion.executeUpdate();
    instruccion.close();
    response.sendRedirect("menu.jsp");
 }catch (Exception e){
    System.out.println(e.toString());
 }
 %>
</body>
</html>