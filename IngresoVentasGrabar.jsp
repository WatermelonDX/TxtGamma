<%@ include file="conecta.jsp" %>
<html>
<head>
<title>Ingreso Ventas Grabar</title></head>
<body>
<%
 try{
    PreparedStatement instruccion=c.prepareStatement("INSERT INTO Ventas(Codigo, DocumentoTrabajadores, FechadeCompra, PrecioTotal) VALUES (?,?,?,?)");
    instruccion.setString(1,request.getParameter("codigo"));
    instruccion.setString(2,request.getParameter("documentotrabajadores"));
    instruccion.setString(3,request.getParameter("fechadecompra"));
	instruccion.setString(4,request.getParameter("preciototal"));
     instruccion.executeUpdate(); 
     instruccion.close();
     response.sendRedirect("facturacionventa.jsp");
   
 }catch (Exception e){
    System.out.println(e.toString());
 }
 %>
</body>
</html>