<title>Modificar Telas Grabar</title><%@ include file="conecta.jsp" %>
<%
   try{

   PreparedStatement inserta=c.prepareStatement("UPDATE Telas SET Nombre=?, Tipo=?, CantidadTotal=? WHERE Codigo=?");
   inserta.setString(1,request.getParameter("nombre"));
   inserta.setString(2,request.getParameter("tipo"));
   inserta.setString(3,request.getParameter("cantidadtotal"));
   inserta.setString(4,request.getParameter("codigo"));
   inserta.executeUpdate();
   inserta.close();
   c.close();
   response.sendRedirect("menu.jsp");

   }catch(Exception e) {
    System.out.println(e.toString());
    
   }
%>