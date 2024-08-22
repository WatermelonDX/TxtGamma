<title>Verificar</title><%@ include file="conecta.jsp" %>
<%
try {
    String trabajador;
    trabajador = request.getParameter("trabajador");
    String documento;
    documento = request.getParameter("documento");
    PreparedStatement instruccion = c.prepareStatement("Select Nombre,Documento from trabajadores where Nombre=? and Documento=?");
    instruccion.setString(1, trabajador);
    instruccion.setString(2, documento);
    ResultSet resultado = instruccion.executeQuery();
    if (resultado.next()) {
        response.sendRedirect("menu.jsp");
    } else {
        response.sendRedirect("IngresarSistema.jsp?error=1");
    }
    resultado.close();
    instruccion.close();
    c.close();
} catch (Exception e) {
    System.out.println(e.toString());
}
%>
