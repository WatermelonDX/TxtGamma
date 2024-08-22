
<%@ include file="conecta.jsp" %>
<html>
<head>
<script language="javascript">
function graba(){
    document.formulario.submit();
}
function asignar(){
    document.formulario.codigotela.value = document.formulario.codigotelanombre.options[document.formulario.codigotelanombre.selectedIndex].value;
}
</script>
<title>Facturación Venta</title>
</head>
<body>
<%
  PreparedStatement inscri = null;
  ResultSet consu = null;
  try {
      inscri = c.prepareStatement("SELECT * FROM DetallesVentas WHERE CodigoVentas = ? AND CodigoTelas = ?");
      inscri.setString(1, request.getParameter("venta"));
      inscri.setString(2, request.getParameter("tela"));
      consu = inscri.executeQuery();
  } catch (Exception e) {
      System.out.println(e.toString());
  }
%>
<form action="facturacionventagrabar.jsp" method="post" name="formulario">
<a href="MenuVentas.jsp">Volver a menú ventas</a><br>
<%
  if (consu != null && consu.next()) {
%>
Venta:<input type="text" name="codigoventa" value="<%= consu.getString("CodigoVentas") %>" size="4"><br>
Tela:<input type="text" name="codigotela" size="4"><br>
<select name="codigotelanombre" onclick="asignar();">
    <%
    PreparedStatement instruccion = null;
    ResultSet resultado = null;
    try {
        instruccion = c.prepareStatement("SELECT * FROM Telas WHERE Codigo = ?");
        instruccion.setString(1, request.getParameter("tela"));
        resultado = instruccion.executeQuery();
        while (resultado.next()) {
    %>
    <option selected value="<%= resultado.getString("Codigo") %>"><%= resultado.getString("Nombre") %></option>
    <%
        }
    } catch (Exception e) {
        System.out.println(e.toString());
    } finally {
        if (resultado != null) try { resultado.close(); } catch (Exception e) { System.out.println(e.toString());}
        if (instruccion != null) try { instruccion.close(); } catch (Exception e) { System.out.println(e.toString());}
    }
    %>
</select><br>
Precio Unitario:<input type="text" name="preciounitario" value="<%= consu.getString("PrecioUnidad") %>" size="8"><br>
Cantidad:<input type="text" name="cantidad" value="<%= consu.getString("CantidadProducto") %>" size="4"><br>
<p><input type="button" name="fin" value="Agregar" onclick="graba()"></p>
<%
  }
  if (consu != null) try { consu.close(); } catch (SQLException e) { e.printStackTrace(); }
  if (inscri != null) try { inscri.close(); } catch (SQLException e) { e.printStackTrace(); }
%>
</form>
</body>
</html>
