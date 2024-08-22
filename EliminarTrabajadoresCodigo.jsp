<!DOCTYPE html>
<html>
<head>
<title>Modificar Trabajadores Codigo</title>
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

input[type="submit"], input[type="reset"] {
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

<form method="POST" action="EliminarTrabajadores.jsp">
<div>
    <table width="1224" height="209" border="0">
      <tr>
        <td width="1218" height="205"><div>
            <blockquote>
              <p class="Estilo1">&nbsp;</p>
              <p class="Estilo1">&nbsp;</p>
              <p class="Estilo1"><img src="isotipo.png" width="175" height="175" alt="iso" /></p>
              <p class="Estilo10">&nbsp;</p>
              <p class="Estilo10">TRABAJADORES</p>
              <p class="Estilo12">&nbsp;</p>
              <p class="Estilo7">Eliminar</p>
            </blockquote>
        </div></td>
      </tr>
    </table>
  </div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>Ingrese el documento del trabajador a eliminar</p>
<p>&nbsp;</p>
Documento:
<input type="text" name="documento" placeholder="Ingrese documento">
<input type="submit" name="enviar" value="Enviar">
<input type="reset" name="cancelar" value="Cancelar">
</form>
<table width="595" height="60" border="0">
  <tr>
    <td width="589"><div><a href="MenuTrabajadores.jsp"> 
    <button class="button411">
        <div>
          <div>Menu Trabajadores </div>
        </div>
        </button></a> </div></td>
  </tr>
</table>
</body>
</html>