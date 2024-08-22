<%@ include file="conecta.jsp" %>
<html>
<head>
</head>
<body>
<% try{
    PreparedStatement instruccion=c.prepareStatement("INSERT INTO DetallesCompras (Codigocompras, Codigotelas, PrecioUnitario,Cantidad) VALUES (?,?,?,?)");
    instruccion.setString(1,request.getParameter("codigocompra"));
    instruccion.setString(2,request.getParameter("codigotela"));
	instruccion.setString(3,request.getParameter("preciounitario"));
    instruccion.setString(4,request.getParameter("cantidad"));
    instruccion.executeUpdate();
    instruccion.close();
    response.sendRedirect("facturacioncompra.jsp");
 }catch (Exception e){
    System.out.println(e.toString());
 }
 %>
</body>
</html>