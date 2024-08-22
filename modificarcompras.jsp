<%@ include file="conecta.jsp" %>
<html>
<head>
<title>Datos</title>
<script languaje="javascript">
function graba(){                                                                                                      
        document.formulario.submit();
    }

         

function borrar(){
    document.formulario.fecha.value="";
    document.formulario.precio.value="";
	document.formulario.proveedores.value="";

}
</script>
</head>
<body>
<form action="modificarcomprasgrabar.jsp" method="post" name="formulario"><p>
    <a href="menu.jsp">Inicio</a>
    </p>
    <%
    try{
        PreparedStatement inscri=c.prepareStatement("SELECT * FROM Compras WHERE Codigo=?");
        inscri.setString(1,request.getParameter("codigo"));
        ResultSet consu=inscri.executeQuery();
        inscri.close();
        if(consu.next()){
    %>
    Codigo:
    <input type="text" name="codigo" value="<% out.println(consu.getString("Codigo"));%>" readonly=true >
    Fecha: 
     <input type="date-time" name="fecha" value="<% out.println(consu.getString("Fecha"));%>" >
     Precio:
	 <input type="text" name="precio" value="<% out.println(consu.getString("Precio"));%>" >
	 Proveedores:
	 <input type="text" name="proveedores" value="<% out.println(consu.getString("Proveedores")); %>" >
     <input type="button" name="enviar" value="Actualizar Datos" Onclick="javascript:graba()">
   <%
    consu.close();
    c.close();
    }else{ 
    %>
      <a href="modificarcomprascodigo.jsp">Volver a ingresar el codigo</a>
      <p>Codigo no encontrado volver a ingresar el codigo</p>
    <%
    }}catch(Exception e){
        System.out.println(e.toString());
    }
    
   %>
</form>
</body>