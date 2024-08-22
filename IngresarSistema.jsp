<!DOCTYPE html>++
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Ingresar Al Sistema</title> 
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
<style>
*{
font-size:26px;  
font-family: 'Ubuntu', sans-serif;
}
  body {
    margin: 20px;
  
    font-size: 16px;

  }
  .container {
    margin: 20px;
  }
  .a {
    border-radius: 15px;
    border-color: #01579b; 
    background-color: #bceeff; 
    margin-bottom: 10px;
	  font-size: 17px;
  }
  .b1 {
    border-radius: 15px;
    border-color: #8B4513; 
    background-color:#4cbb17; 
    color: #FFFFFF; /* Blanco */
  }
  .b2 {
    border-radius: 15px;
    border-color: #8B0000; 
    background-color: #FF4500; 
    color: #FFFFFF; /* Blanco */
    margin-left: 10px;
  }
  .error-message {
    background-color: #FFA07A; 
    border: 2px solid #FF6347; 
    border-radius: 5px;
    padding: 10px;
    margin-top: 10px;
    color: #8B0000; 
  }
</style>

</head>

<body>

<div class="container">
  <form id="form1" name="formulario" method="post" action="verificar.jsp">
    <p align="center">&nbsp;</p>
    <p align="center">&nbsp;</p>
    <p align="center"><strong><img src="logosinmargen.png" width="584" height="186"></strong></p>
    <p align="center">&nbsp;</p>
    <div align="center">
      <table width="200" border="0">
        <tr>
          <td><label>Trabajador: </label></td>
          <td><input class="a" type="text" name="trabajador" placeholder="Ingrese trabajador" /></td>
          <td><label>Documento: </label></td>
          <td><input class="a" type="password" name="documento" placeholder="Ingrese documento" /></td>
        </tr>
      </table>
      <input class="b1" type="button" name="verificar" value="Verificar" onClick="javascript:validar()"/>
      <input class="b2" type="reset" name="borrar" value="Borrar" />
      </div>
  </form>

  <div align="center">
    <%-- Mensaje de error --%>
    <%
  String error = request.getParameter("error");
  if (error != null && error.equals("1")) {
  %>
  </div>
  <div class="error-message">
    <div align="center">El usuario no se encontró en la base de datos </div>
  </div>
  <div align="center">
    <% } %>
  </div>
</div>

<script languaje="Javascript">
function validar(){
  if (document.formulario.trabajador.value==""){
    alert("No digitó nombre de trabajador");
  } else if(document.formulario.documento.value==""){
    alert("No digitó el documento");
  } else if (document.formulario.trabajador.value.length < 2){
    alert("El trabajador debe ser de más de 2 caracteres");
  } else if (document.formulario.documento.value.length < 2){
    alert("El documento debe ser de más de 2 caracteres");
  } else if(isNaN(parseInt(document.formulario.trabajador.value))==false){
    alert('El trabajador debe ser alfanumérico');
  } else if (isNaN(parseInt(document.formulario.documento.value))==true){
    alert('El documento debe ser numérico');
  } else {
    document.formulario.submit();
  }
}
</script>

</body>

</html>
