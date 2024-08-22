<%@ include file="conecta.jsp" %>
<%
 try{
    PreparedStatement instruccion=c.prepareStatement("INSERT INTO DetallesVentas (CodigoVentas, CodigoTelas, PrecioUnidad,CantidadProducto) VALUES (?,?,?,?)");
    instruccion.setString(1,request.getParameter("codigoventa"));
    instruccion.setString(2,request.getParameter("codigotela"));
	instruccion.setString(3,request.getParameter("preciounitario"));
    instruccion.setString(4,request.getParameter("cantidad"));
    instruccion.executeUpdate();
    instruccion.close();
    response.sendRedirect("facturacionventa.jsp");
 }catch (Exception e){
    System.out.println(e.toString());
 }
%>