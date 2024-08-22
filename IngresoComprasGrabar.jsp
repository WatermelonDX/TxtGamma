<%@ include file="conecta.jsp" %>
<html>
<head>
</head>
<body>
<%
 try{
    PreparedStatement instruccion=c.prepareStatement("INSERT INTO Compras (Fecha, Precio, Proveedores) VALUES (?,?,?)");
    instruccion.setString(1,request.getParameter("fecha"));
    instruccion.setString(2,request.getParameter("precio"));
	 instruccion.setString(3,request.getParameter("proveedores"));
    instruccion.executeUpdate();
    instruccion.close();
    response.sendRedirect("facturacioncompra.jsp");
 }catch (Exception e){
    System.out.println(e.toString());
 }
 %>

</body>
</html>