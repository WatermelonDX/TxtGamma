<%@ include file="conecta.jsp" %>
<html>
<head>
<title>Modificar Trabajadores</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
<style>
* {
    font-size: 26px;
    font-family: 'Ubuntu', sans-serif;
    margin: 20px;
}

.container {
    margin: 20px;
}

.input-field {
    border-radius: 15px;
    border-color: #01579b; /* Marr�n */
    background-color: #bceeff; /* Albaricoque */
    margin-bottom: 10px;
    font-size: 17px;
    padding: 5px 10px;
    width: 20%;
    box-sizing: border-box;
}

.submit-button {
    border-radius: 15px;
    border-color: #8B4513; /* Marr�n oscuro */
    background-color:#4cbb17; /* Dorado */
    color: #FFFFFF; /* Blanco */
    padding: 5px 10px;
    font-size: 17px;
    cursor: pointer;
}

.error-message {
    background-color: #FFA07A; /* Salm�n claro */
    border: 2px solid #FF6347; /* Rojo coral */
    border-radius: 5px;
    padding: 10px;
    margin-top: 10px;
    color: #8B0000; /* Rojo oscuro */
}
</style>
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
<div class="container">
    <form action="eliminarcomprasgrabar.jsp" method="post" name="formulario">
        <a href="menu.jsp">Inicio</a>;
        <p>
        <%
        try{
            PreparedStatement inscri=c.prepareStatement("SELECT * FROM Compras WHERE Codigo=?");
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
           } else {
        %>
        La compra no existe
        <%
        }
        } catch(Exception e) {
            System.out.println(e.toString());
        }
        %>
    </form>
</div>
</body>
</html>