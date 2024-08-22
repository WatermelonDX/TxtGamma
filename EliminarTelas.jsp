<%@ include file="conecta.jsp" %>
<html>
<head>
<title>Eliminar Telas</title>
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
    border-color: #347d11; /* Marr�n oscuro */
    background-color:#4cbb17; /* Dorado */
    color: #FFFFFF; /* Blanco */
    font-size: 26px;
    padding: 5px 20px;
}
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
.Estilo13 {font-size: 70px; margin-bottom: 0;}
.Estilo13 {font-size: 70px; margin-bottom: 0;}
.Estilo14 {font-size: 40px; font-weight: bold; margin-top: 0;}
.Estilo14 {font-size: 40px; font-weight: bold; margin-top: 0;}
.Estilo16 {font-size: 24px;}
.Estilo16 {font-size: 24px;}
.Estilo17 {font-size: 90px; margin-bottom: 0; }
.Estilo18 {font-size: 9px; font-weight: bold; margin-top: 0; }
.Estilo19 {font-size: 70px}
.error-message1 {    background-color: #FFA07A; /* Salm�n claro */
    border: 2px solid #FF6347; /* Rojo coral */
    border-radius: 5px;
    padding: 10px;
    margin-top: 10px;
    color: #8B0000; /* Rojo oscuro */
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
<a href="menu.jsp"></a>
<div>
  <div>
    <div>
      <table width="1224" height="209" border="0">
        <tr>
          <td width="1218" height="205"><div>
              <blockquote>
                <p class="Estilo13">&nbsp;</p>
                <p class="Estilo17 Estilo19">&nbsp;</p>
                <p class="Estilo13"><a href="EliminarTelasCodigo.jsp"><img src="isotipo.png" alt="iso" width="120" height="120" border="0" /></a></p>
                <p class="Estilo14">&nbsp;</p>
                <p class="Estilo14">TELAS</p>
                <p class="Estilo18">&nbsp;</p>
                <p class="Estilo16">Eliminar</p>
              </blockquote>
          </div></td>
        </tr>
      </table>
    </div>
    <p></p>
  </div>
  <div class="container">
    <form action="modificartelasgrabar.jsp" method="post" name="formulario">
  </form>
  </div>
  <%
        try{
            PreparedStatement inscri=c.prepareStatement("SELECT * FROM Telas WHERE Codigo=?");
            inscri.setString(1,request.getParameter("codigo"));
            ResultSet consu=inscri.executeQuery();
            if(consu.next()){
        %>
</div>
<div class="container"><form action="EliminarTelasGrabar.jsp" method="post" name="formulario">
  <table width="325" border="0" align="center">
                  <tr>
                    <td width="325"><p>C&oacute;digo:</p>
                      <p>
                        <input align="center" class="input-field" type="text" name="codigo" value="<%=consu.getString("Codigo")%>" ReadOnly="true">
                      </p></td>
                  </tr>
                  <tr>
                    <td width="325" height="29">Nombre:                      
                    <input align="center" class="input-field" type="text" name="nombre" value="<%=consu.getString("Nombre")%>" ReadOnly="true"></td>
                  </tr>
                  <tr>
                    <td>Tipo:                      
                    <input  align="center" class="input-field" type="text" name="tipo" value="<%=consu.getString("Tipo")%>" ReadOnly="true"></td>
                  <tr>
                    <td>CantidadTotal:                      
                    <input align="center" class="input-field" type="text" name="cantidadtotal" value="<%=consu.getString("CantidadTotal")%>" ReadOnly="true"></td>
    </table>
                <p>&nbsp;</p>
                <%
             
        boolean s=true;
        PreparedStatement inscri1=c.prepareStatement("SELECT * FROM DetallesVentas WHERE CodigoTelas=?");
            inscri1.setString(1,request.getParameter("codigo"));
            ResultSet consu1=inscri1.executeQuery();
          if (consu1.next()){ 
             s=false;
          }
        PreparedStatement inscri2=c.prepareStatement("SELECT * FROM DetallesCompras WHERE Codigotelas=?");
            inscri2.setString(1,request.getParameter("codigo"));
            ResultSet consu2=inscri2.executeQuery();
          if (consu2.next()){ 
             s=false;
          }
          if(s){
        %>
           <input class="submit-button" name="actualizar" type="button" onClick="javascript:graba()" value="Eliminar Datos">
        <% 
          }else if(!s){
          %>
        <div class="error-message1" style="background-color: #FFCCCB;">
            <p style="font-size: 30px; color: #8B0000;">Esta tela no se puede eliminar porque est&aacute; conectada con alguna factura </p>
            <p>&nbsp;</p>
            <button type="button" style="border-radius: 15px; border-color: #8B4513; background-color:#4cbb17; color: #FFFFFF; font-size: 26px; padding: 10px 20px; cursor: pointer;" onClick="location.href='EliminarTelasCodigo.jsp'">Aceptar</button>
          </div>
          <p>&nbsp;</p>
          <p>
            <%
          } 
        } else {
        %>
          </p>
          <p>&nbsp;</p>
          <div class="error-message" style="background-color: #FFCCCB;">
        <p style="font-size: 30px; color: #8B0000;">Esta tela no existe, desea probar con otro c&oacute;digo?</p>
        <p>&nbsp;</p>
        <button type="button" style="border-radius: 15px; border-color: #8B4513; background-color:#4cbb17; color: #FFFFFF; font-size: 26px; padding: 10px 20px; cursor: pointer;" onClick="location.href='EliminarTelasCodigo.jsp'">Aceptar</button>
    </div>
    <p>&nbsp;</p>
          <p>
            <%
        }
        } catch(Exception e) {
            System.out.println(e.toString());
        }
        %>
                  </p>
</form>
</div>
</body>
</html>
