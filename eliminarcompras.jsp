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
         <p> Codigo:
          <input type="text" name="codigo" value="<% out.println(consu.getString("Codigo"));%>" readonly=true ></p>
         <p> Fecha: 
         <input type="date-time" name="fecha" value="<% out.println(consu.getString("Fecha"));%>"  readonly=true ></p>
         <p>Precio:
	     <input type="text" name="precio" value="<% out.println(consu.getString("Precio"));%>"  readonly=true></p>
	     <p>Proveedores:
	     <input type="text" name="proveedores" value="<% out.println(consu.getString("Proveedores")); %>"  readonly=true></p>
            <%
            boolean s=true;
         PreparedStatement inscri1=c.prepareStatement("SELECT * FROM DetallesCompras WHERE Codigocompras=?");
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
          <h3>no se puede eliminar </h3>
          <%
          } 
       
        } else {
        %>
            <h2>No existe la compra</h2>
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