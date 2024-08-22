<%@ include file="conecta.jsp" %>
<html>
<head>
<title>Datos</title>
<script languaje="javascript">
function graba(){
    if (document.formulario.codigo.value==""){
    alert('no digito el codigo');
    }else if (document.formulario.fecha.value==""){
     alert('No digito la fecha');
    }else if (document.formulario.precio.value==""){
     alert('No digito el precio');
	     }else if (document.formulario.proveedores.value==""){
     alert('No digito el proveedor');
    }else{
        document.formulario.submit();
    }
}

function borrar(){
    document.formulario.fecha.value="";
    document.formulario.precio.value="";
	document.formulario.proveedores.value="";
}
</script>
</head>
<body>
<form action="IngresoComprasGrabar.jsp" method="post" name="formulario"></p>
    <a href="menu.jsp">Inicio</a>;
    <p>
    <%
    try{
        PreparedStatement inscri=c.prepareStatement("SELECT * FROM compras WHERE Codigo=?");
        inscri.setString(1,request.getParameter("codigo"));
        ResultSet consu=inscri.executeQuery();
        if(consu.next()){
    %>
           <table width="327" border="0" align="center">
            <tr>
                <td width="325" colspan="3">Codigo:
                    <input type="text" name="codigo" value="<%= request.getParameter("codigo") %>" readonly="true">
                </td>
            </tr>
            <tr>
                <td width="325" colspan="3" height="29">Proveedor:
                    <input type="text" name="proveedores" value="<%= consu.getString("Proveedores") %>" readonly="true">
                </td>
            </tr>
            <tr>
                <td width="140"> Fecha:
                    <input type="date-time" name="fechadecompra" value="<%= consu.getString("Fecha") %>" size="6" readonly="true">
                </td>
                <td>
            
                </td>
            </tr>
            <tr>
                <td colspan="3" >Precio:
                    <input type="text" name="preciototal" value="<%= consu.getString("Precio") %>" readonly="true">
                </td>
            </tr>
        </table>
   <p>&nbsp;</p>
   <p align="center"><span>YA EXISTE</span></p>
    <%
  try{
   PreparedStatement matricu=c.prepareStatement("Select Codigotelas as tela,Cantidad,PrecioUnitario from DetallesCompras where Codigocompras=?");
   matricu.setString(1,request.getParameter("codigo"));
   ResultSet rsmatricu=matricu.executeQuery();
   if ((rsmatricu.next())){
   %>
    </p>
	<span class="Estilo3">Factura</span>
  <table width="555" border="0">
    <tr>
     <td width="97">Tela</td>
     <td width="188">Cantidad</td>
     <td width="248">Precio Unitario</td>
    </tr><tr>
     <td>(<%= rsmatricu.getString("tela") %>) <%
                    try {
                        PreparedStatement rmatricu = c.prepareStatement("SELECT Nombre FROM Telas WHERE Codigo = ?");
                        rmatricu.setString(1, rsmatricu.getString("tela"));
                        ResultSet smatricu = rmatricu.executeQuery();
                        if (smatricu.next()) {
                            %><%= smatricu.getString("Nombre") %><%
                        }
                        smatricu.close();
                    } catch (Exception e) {
                        System.out.println(e.toString());
                    }
                    %></td>
     <td><%out.println(rsmatricu.getString("Cantidad"));%></td>
     <td><%out.println(rsmatricu.getString("PrecioUnitario"));%></td>
    </tr>
    <%
    while (rsmatricu.next()){
    %>
    <tr>
     <td>(<%= rsmatricu.getString("tela") %>) <%
                    try {
                        PreparedStatement rmatricu = c.prepareStatement("SELECT Nombre FROM Telas WHERE Codigo = ?");
                        rmatricu.setString(1, rsmatricu.getString("tela"));
                        ResultSet smatricu = rmatricu.executeQuery();
                        if (smatricu.next()) {
                            %><%= smatricu.getString("Nombre") %><%
                        }
                        smatricu.close();
                    } catch (Exception e) {
                        System.out.println(e.toString());
                    }
                    %></td>
     <td><%out.println(rsmatricu.getString("Cantidad"));%></td>
     <td><%out.println(rsmatricu.getString("PrecioUnitario"));%></td>
    </tr>
    <%
    }
   }
   rsmatricu.close();
   c.close();
  }catch(Exception e){
   System.out.println(e.toString());
  }
  %>
   <%
   consu.close();
     }else{ 
   %>
    <p>
  <table width="957" >
    <tr>
      <td colspan="2">
      <%
      double mat=1;
      try{
       PreparedStatement instruccion2=c.prepareStatement("Select Max(Codigo) as Codigo from Compras ");
       ResultSet resultado2=instruccion2.executeQuery();  
       if ((resultado2.next())){
	    Integer mat1= new Integer(resultado2.getString("Codigo"));
	    mat=mat1.doubleValue()+1;
       }
      }catch(Exception e){
	   System.out.println(e.toString());
      } 
      %>
      Codigo :
        <input type="text" name="codigo" size="12" value= " <%=mat%>"  maxlength="12" readonly="true">	  </td>
    </tr>
    <tr>
      <td colspan="2">fecha:
        <input type="date-time" name="fecha" size="30" maxlength="30">     </td>
    </tr>
     <tr>
      <td colspan="2">precio:
        <input type="text" name="precio" size="30" maxlength="30">     </td>
    </tr>
	     <tr>
      <td colspan="2">proveedores:
        <input type="text" name="proveedores" size="30" maxlength="30">     </td>
    </tr>
    
  </table>
  <input name="Grabar" type="button" onClick="javascript:graba()" value="Continuar">
  <input name="Borrar" type="reset" id="Borrar" value="Borrar">
</form>
<%
    }}catch(Exception e){
        System.out.println(e.toString());
    }
    
   %>

</body>