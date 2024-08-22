<html>
<head>
<title>Datos del Trabajador</title>
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

input[type="submit-button"],input[type="reset"] {
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
</style>
</head>
<body>
<script lenguaje="javascript">
   function verificar(){
    if (document.formulario.codigo.value==""){
      alert("no se digito el codigo");
    }else if (isNaN(parseInt(document.formulario.codigo.value))==true){
      alert("solo se pueden digitar digitos numericos");
    }else {
      document.formulario.submit();
    }
   }



</script>
 <div class="container">      
     <table width="1224" height="209" border="0">
      <tr>
        <td width="1218" height="205"><div>
            <blockquote>
              <p class="Estilo1">&nbsp;</p>
              <p class="Estilo1">&nbsp;</p>
              <p class="Estilo1"><img src="isotipo.png" width="175" height="175" alt="iso" /></p>
              <p class="Estilo10">&nbsp;</p>
              <p class="Estilo10">COMPRAS</p>
              <p class="Estilo12">&nbsp;</p>
              <p class="Estilo7">Modificar</p>
            </blockquote>
        </div></td>
      </tr>
    </table>
  </div> 
<form action="modificarcompras.jsp" method="post" name="formulario">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>Codigo:
  <input name="codigo" type="text" id="codigo" placeholder="ingrese codigo de la compra">
  <input type="submit-button" name="enviar" value="Consultar" onClick="javascript:verificar()"readOnly="true">
</p>
</form>
<table width="595" height="60" border="0">
  <tr>
    <td width="589"><div><a href="MenuCompras.jsp"> 
    <button class="button411">
        <div>
          <div>Men&uacute; Compras </div>
        </div>
        </button></a> </div></td>
  </tr>
</table>
</body>
</html> 