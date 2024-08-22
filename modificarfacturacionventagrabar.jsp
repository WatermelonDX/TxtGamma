<%@ include file="conecta.jsp" %>
<html>
<head>
<script languaje="javascript">
function graba(){
document.formulario.submit();
}
function asignar(){
 document.formulario.codigotela.value=document.formulario.codigotelanombre.options[document.formulario.codigotelanombre.selectedIndex].value;
}
</script>
<title>facturación venta</title>
</head>
<body>
<%
String ult="";
try{
 PreparedStatement inscri=c.prepareStatement("SELECT  * FROM Ventas order by Codigo desc limit 1");
 ResultSet consu=inscri.executeQuery();
  if (consu.next()) {
         ult = consu.getString("Codigo");
        }
}catch(Exception e){
   System.out.println(e.toString());
}
%>
<form action="facturacionventagrabar.jsp" method="post" name="formulario">
<a href="MenuVentas.jsp"> Volver a menu ventas </a>
Venta:<input type="text" name="codigoventa" value="<%= ult %>" size="4">
Tela:<input type="text" name="codigotela" size="4">
      <select name="codigotelanombre" onclick="javascript:asignar();">
        <%
        
      try{
        
       PreparedStatement instruccion=c.prepareStatement("Select * from Telas ORDER BY Codigo");
       ResultSet resultado=instruccion.executeQuery();
       while (resultado.next()){ %>
        <option selected value ="<%=resultado.getString("Codigo")%>"> <%=resultado.getString("Nombre")%> </option>
        <%
       }
      }catch(Exception e){
	   System.out.println(e.toString());
      }
      %>
      </select>
Precio Unitario:<input type="text" name="preciounitario" size="8">
Cantidad:<input type="text" name="cantidad" size="4">
<p><input type="button" name="fin" value="agregar" onClick="javascript:graba()"></p>

</form>
</body>
</html>