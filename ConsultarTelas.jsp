<%@ include file="conecta.jsp" %>
<html>
<head>
<title>Consultar Telas</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
<style>
* {
    font-family: 'Ubuntu', sans-serif;
    font-size: 26px;
    margin: 0 auto; /* Alinea todos los elementos al centro */
    text-align: center; /* Alinea el texto al centro */
}
.container {
    margin: 20px;
}


body {
    line-height: 1; /* Establece la altura de l�nea a 1 */
}

input[type="text"] {
    border-radius: 15px;
    border-color: #01579b; /* Marr�n */
    background-color: #bceeff; /* Albaricoque */
    margin-bottom: 10px;
    font-size: 26px;
    padding: 8px;
}

input[type="button"] {
    border-radius: 15px;
    border-color: #8B4513; /* Marr�n oscuro */
    background-color:#4cbb17; /* Dorado */
    color: #FFFFFF; /* Blanco */
    font-size: 26px;
    padding: 5px 20px;
}

.Estilo1 {font-size: 70px; margin-bottom: 0;}
.Estilo10 {font-size: 40px; font-weight: bold; margin-top: 0;}
.Estilo12 {font-size: 1px; font-weight: bold; margin-top: 0; }
.Estilo7 {font-size: 24px;}
.button411 {font-size: 20px;
    border-radius: 15px;
    border-color: #3c3c3c;
    background-color: #;
    padding: 10px 20px;
    margin: 10px;
}
.error-message {
    background-color: #FFA07A; /* Salm�n claro */
    border: 2px solid #FF6347; /* Rojo coral */
    border-radius: 5px;
    padding: 10px;
    margin-top: 10px;
    color: #8B0000; /* Rojo oscuro */
}
.Estilo1 {font-size: 70px; margin-bottom: 0;}
.Estilo10 {font-size: 40px; font-weight: bold; margin-top: 0;}
.Estilo12 {font-size: 1px; font-weight: bold; margin-top: 0; }
.Estilo7 {font-size: 24px;}
.Estilo13 {font-size: 70px; margin-bottom: 0;}
.Estilo13 {font-size: 70px; margin-bottom: 0;}
.Estilo14 {font-size: 40px; font-weight: bold; margin-top: 0;}
.Estilo14 {font-size: 40px; font-weight: bold; margin-top: 0;}
.Estilo16 {font-size: 24px;}
.Estilo16 {font-size: 24px;}
.Estilo17 {font-size: 90px; margin-bottom: 0; }
.Estilo18 {font-size: 9px; font-weight: bold; margin-top: 0; }
.Estilo19 {font-size: 70px}
.button4111 {font-size: 20px;
    border-radius: 15px;
    border-color: #3c3c3c;
    background-color: #;
    padding: 10px 20px;
    margin: 10px;
}
</style>
<script languaje="javascript">
function graba(){
    if (document.formulario.codigo.value==""){
    alert('no digito el documento');
    }else if (document.formulario.nombre.value==""){
     alert('No digito el nombre');
    }else if (document.formulario.tipo.value==""){
     alert('No digito el tipo');
     }else if (document.formulario.CantidadTotal.value==""){
     alert('No digito la cantidad');
    }else{
        document.formulario.submit();
    }
}

function borrar(){
    document.formulario.nombre.value="";
    document.formulario.tipo.value="";
    document.formulario.CantidadTotal.value="";
}
</script>
</head>
<body>
<div>
  <table width="1224" height="209" border="0">
    <tr>
      <td width="1218" height="205"><div>
          <blockquote>
            <p class="Estilo13">&nbsp;</p>
            <p class="Estilo17 Estilo19">&nbsp;</p>
            <p class="Estilo13"><a href="ConsultarTelasCodigo.jsp"><img src="isotipo.png" alt="iso" width="120" height="120" border="0" /></a></p>
            <p class="Estilo14">&nbsp;</p>
            <p class="Estilo14">TELAS</p>
            <p class="Estilo18">&nbsp;</p>
            <p class="Estilo16">Consultar</p>
          </blockquote>
      </div></td>
    </tr>
  </table>
</div>
<p>&nbsp;</p>
<p>
        <%
        try{
            PreparedStatement inscri=c.prepareStatement("SELECT * FROM Telas WHERE Codigo=?");
            inscri.setString(1,request.getParameter("codigo"));
            ResultSet consu=inscri.executeQuery();
            if(consu.next()){
        %>
<table width="325" border="0" align="center">
        <tr>
            <td height="29">C&oacute;digo:
              <input type="text" name="codigo2" value= " <%=request.getParameter("codigo")  %>" readonly="true"></td>
        </tr>
        <tr>
            <td width="325" height="29">Nombre: 
            <input type="text" name="nombre" value="<% out.println(consu.getString("Nombre"));%>" readonly="true"> </td>
        </tr>
        <tr>
            <td>Tipo:
            <input type="text" name="tipo" value="<% out.println(consu.getString("Tipo"));%>" readonly="true"></td>
        <tr>
            <td>Cantidad Total:
              <input type="text" name="nombre" value="<% out.println(consu.getString("CantidadTotal")); %>" readonly="true"></td>
        </table>
    <p>&nbsp;</p>
    <p>
	<button type="button" style="border-radius: 15px; border-color: #347d11; background-color:#4cbb17; color: #FFFFFF; font-size: 26px; padding: 10px 20px; cursor: pointer;" onClick="location.href='ConsultarTelasCodigo.jsp'">Consultar M&aacute;s</button></p>
    <%
    consu.close();
        }else{ 
    %>
  <div class="error-message" style="background-color: #FFCCCB;">
        <p style="font-size: 30px; color: #8B0000;">Esta tela no existe, desea probar con otro c&oacute;digo?</p>
        <p style="font-size: 30px; color: #8B0000;">&nbsp;</p>
        <button type="button" style="border-radius: 15px; border-color: #347d11; background-color:#4cbb17; color: #FFFFFF; font-size: 26px; padding: 10px 20px; cursor: pointer;" onClick="location.href='ConsultarTelasCodigo.jsp'">Aceptar</button>
</div>
    <%
        }}catch(Exception e){
            System.out.println(e.toString());
        }
    %>
</body>
</html>