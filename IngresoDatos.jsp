<%@ include file="conecta.jsp" %>
<html>
<head>
<title>Ingreso Datos</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
<style>
* {
    font-size:26px;  
    font-family: 'Ubuntu', sans-serif;
    margin: 20px;
}

.container {
    margin: 20px;
}

.input-field {
    border-radius: 15px;
    border-color: #01579b; /* Marrón */
    background-color: #bceeff; /* Albaricoque */
    margin-bottom: 10px;
    font-size: 17px;
    padding: 8px;
    width: 100%;
    box-sizing: border-box;
}

.submit-button {
    border-radius: 15px;
    border-color: #8B4513; /* Marrón oscuro */
    background-color:#4cbb17; /* Dorado */
    color: #FFFFFF; /* Blanco */
    font-size: 26px;
    padding: 10px 20px;
    cursor: pointer;
}

.reset-button {
    border-radius: 15px;
    border-color: #8B0000; /* Rojo oscuro */
    background-color: #FF4500; /* Naranja rojizo */
    color: #FFFFFF; /* Blanco */
    font-size: 26px;
    padding: 10px 20px;
    margin-left: 10px;
    cursor: pointer;
}

.error-message {
    background-color: #FFA07A; /* Salmón claro */
    border: 2px solid #FF6347; /* Rojo coral */
    border-radius: 5px;
    padding: 10px;
    margin-top: 10px;
    color: #8B0000; /* Rojo oscuro */
}
.input-field1 {    border-radius: 15px;
    border-color: #01579b; /* Marrón */
    background-color: #bceeff; /* Albaricoque */
    margin-bottom: 10px;
    font-size: 17px;
    padding: 8px;
    width: 100%;
    box-sizing: border-box;
}
</style>
<script languaje="javascript">
function graba(){
    if (document.formulario.documento.value==""){
    alert('No digitó el documento');
    } else if (document.formulario.nombre.value==""){
     alert('No digitó el nombre');
    } else if (document.formulario.contacto.value==""){
     alert('No digitó el contacto');
    } else {
        document.formulario.submit();
    }
}

function borrar(){
    document.formulario.nombre.value="";
    document.formulario.contacto.value="";
}
</script>
</head>
<body>
<div class="container">
    <form action="IngresoDatosGrabar.jsp" method="post" name="formulario">
        <a href="menu.jsp">Inicio</a>;
        <p>
        <%
        try{
            PreparedStatement inscri=c.prepareStatement("SELECT * FROM trabajadores WHERE Documento=?");
            inscri.setString(1,request.getParameter("documento"));
            ResultSet consu=inscri.executeQuery();
            if(consu.next()){
        %>
    <table width="654" border="0" align="center">
    <tr>
      <td>Documento de Identidad: 
      <input class="input-field1" type="text" name="documento2" size="12" value= "<%=request.getParameter("documento")  %>"  maxlength="12" readonly="true"></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
     <td width="325">Nombre: 
      <input class="input-field" type="text" name="nombre" value="<%=consu.getString("Nombre")%>" readonly="true"></td>
     <td width="313">&nbsp;</td>
    </tr>
    <tr>
     <td>Contacto:  <input class="input-field" type="text" name="contacto" value="<%=consu.getString("Contacto")%>" readonly="true"></td>
    <tr>
     <td>&nbsp;</td>
     <td>&nbsp;</td>
    </tr>
   </table>
   <p>&nbsp;</p>
   <p align="center"><span>YA EXISTE</span></p>
   <%
   consu.close();
     }else{ 
   %>
    <p>
  <table width="957" >
    <tr>
      <td colspan="2">Documento de Identidad :
      <input class="input-field" type="text" name="documento" size="12" value= "<%=request.getParameter("documento")  %>"  maxlength="12" readonly="true">	  </td>
    </tr>
    <tr>
      <td colspan="2">Nombre:
        <input class="input-field" type="text" name="nombre" size="30" maxlength="30">     </td>
    </tr>
     <tr>
      <td colspan="2">Contacto:
        <input class="input-field" type="text" name="contacto" size="30" maxlength="30">     </td>
    </tr>
    
  </table>
  <input class="submit-button" name="Grabar" type="button" onClick="javascript:graba()" value="Continuar">
  <input class="reset-button" name="Borrar" type="reset" id="Borrar" value="Borrar">
  <%
    
    }}catch(Exception e){
        System.out.println(e.toString());
    }
    
   %>

</body>
</html>
