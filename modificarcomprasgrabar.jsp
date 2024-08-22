<%@ include file="conecta.jsp" %>
<%
   try{

   PreparedStatement inserta=c.prepareStatement("UPDATE Compras SET Fecha=?, Precio=?, Proveedores=? WHERE Codigo=?");
   inserta.setString(1,request.getParameter("fecha"));
   inserta.setString(2,request.getParameter("precio"));
   inserta.setString(3,request.getParameter("proveedores"));
   inserta.setString(4,request.getParameter("codigo"));
   inserta.executeUpdate();
   inserta.close();
   c.close();
   response.sendRedirect("menu.jsp");

   }catch(Exception e) {
    System.out.println(e.toString());
    
   }
%>