<!DOCTYPE html>
<html>
<head>
<title>Consultar Telas Codigo</title>
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

input[type="submit"] {
    border-radius: 15px;
    border-color: #347d11; /* Marr�n oscuro */
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
.Estilo13 {font-size: 70px; margin-bottom: 0;}
.Estilo13 {font-size: 70px; margin-bottom: 0;}
.Estilo14 {font-size: 40px; font-weight: bold; margin-top: 0;}
.Estilo14 {font-size: 40px; font-weight: bold; margin-top: 0;}
.Estilo16 {font-size: 24px;}
.Estilo16 {font-size: 24px;}
.Estilo17 {font-size: 90px; margin-bottom: 0; }
.Estilo18 {font-size: 9px; font-weight: bold; margin-top: 0; }
.Estilo19 {font-size: 70px}
</style>
</head>
<body>
<div>
    <table width="1224" height="209" border="0">
      <tr>
        <td width="1218" height="205"><div>
            <blockquote>
              <table width="1224" height="209" border="0">
                <tr>
                  <td width="1218" height="205"><div>
                      <blockquote>
                        <p class="Estilo13">&nbsp;</p>
                        <p class="Estilo17 Estilo19">&nbsp;</p>
                        <p class="Estilo13"><a href="MenuTelas.jsp"><img src="isotipo.png" alt="iso" width="120" height="120" border="0" /></a></p>
                        <p class="Estilo14">&nbsp;</p>
                        <p class="Estilo14">TELAS</p>
                        <p class="Estilo18">&nbsp;</p>
                        <p class="Estilo16">Consultar</p>
                      </blockquote>
                  </div></td>
                </tr>
              </table>
              </blockquote>
        </div>
<form action="ConsultarTelas.jsp" method="post" name="formulario">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>Ingrese un nuevo c&oacute;digo </p>
<p>&nbsp;</p>
<p>Codigo:
  <input name="codigo" type="text" id="codigo" placeholder="Ingrese c&oacute;digo de la tela">
  <input type="submit" name="enviar" value="Consultar" >
</p>
</form>
<table width="595" height="60" border="0">
  <tr>
    <td width="589"><div><a href="MenuTrabajadores.jsp"> </a> <a href="MenuTelas.jsp">
      <button class="button411">
        <div>
          <div>Men&uacute; Telas </div>
        </div>
        </button>
    </a></div></td>
  </tr>
</table>
</body>
</html>
