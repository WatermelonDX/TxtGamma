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
input[type="text"],input[type="date-time"] {
    border-radius: 15px;
    border-color: #01579b; /* Marr�n */
    background-color: #bceeff; /* Albaricoque */
    margin-bottom: 10px;
    font-size: 17px;
    width: 100%;
    box-sizing: border-box;
	padding: 8px;
}

</style>
<script languaje="javascript">
function graba() {
        document.formulario.submit();
  
}

function borrar(){
    document.formulario.nombre.value="";
    document.formulario.contacto.value="";
}
</script>
</head>
<body>
<div class="container">
    <form action="EliminarVentasGrabar.jsp" method="post" name="formulario">
        <a href="menu.jsp">Inicio</a>;
        <p>
        <%
        try{
            PreparedStatement inscri=c.prepareStatement("SELECT * FROM Ventas WHERE Codigo=?");
            inscri.setString(1,request.getParameter("codigo"));
            ResultSet consu=inscri.executeQuery();
            if(consu.next()){
        %>
        <table width="654" border="0" align="center">
        <tr>
            <td height="29">Codigo :
            <input type="text" name="codigo" size="12" value= " <%=request.getParameter("codigo")  %>"  maxlength="12" readonly="true"></td>
            <td>&nbsp;</td>
        </tr>
        
        <tr>
            <td width="325" height="29">Documento Trabajador: 
            <input type="text" name="nombre" value="<% out.println(consu.getString("DocumentoTrabajadores"));%>" readonly="true"> </td>
            <td width="313">&nbsp;</td>
        </tr>
        <tr>
            <td>Fecha de Compra:
            <input type="date-time" name="tipo" value="<% out.println(consu.getString("FechaDeCompra"));%>" readonly="true"></td>
        <tr>
            <td>Precio Total:
            <input type="text" name="nombre" value="<% out.println(consu.getString("PrecioTotal")); %>" readonly="true"></td>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
            <%
            boolean s=true;
        PreparedStatement inscri1=c.prepareStatement("SELECT * FROM DetallesVentas WHERE CodigoVentas=?");
            inscri1.setString(1,request.getParameter("codigo"));
            ResultSet consu1=inscri1.executeQuery();
          if (consu1.next()){ 
             s=false;
          }
          if(s){
        %>
           <input class="submit-button" name="actualizar" type="button" onClick="javascript:graba()" value="Eliminar Datos">
        <% 
          }else if(!s){
          %>
          <h3>no se puede eliminar la venta</h3>
          <%
          } 
       
        } else {
        %>
            <h2>No existe la venta</h2>
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