<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Men&uacute; Trabajadores</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
<style type="text/css">
<!--
* {
    font-family: 'Ubuntu', sans-serif;
}
.Estilo1 {font-size: 70px}
.Estilo10 {	font-size: 40px;
	font-weight: bold;
}
.Estilo7 {font-size: 24px}
.button {    font-size: 20px;
    border-radius: 15px;
    border-color: #B66F6A;
    background-color: #F3B4AF;
    padding: 10px 20px;
    margin: 10px;
}
.button1 {    font-size: 20px;
    border-radius: 15px;
    border-color: #8D653D;
    background-color: #FCCC9B;
    padding: 10px 20px;
    margin: 10px;
}
.button2 {    font-size: 20px;
    border-radius: 15px;
    border-color: #768F3A;
    background-color: #C7E188;
    padding: 10px 20px;
    margin: 10px;
}
  .button2:hover {
    transform: scale(1.1);
}
.button3 {    font-size: 20px;
    border-radius: 15px;
    border-color: #295E70;
    background-color: #7CCAE4;
    padding: 10px 20px;
    margin: 10px;
}
.button4 {    font-size: 20px;
    border-radius: 15px;
    border-color: #B66F6A;
    background-color: #F3B4AF;
    padding: 10px 20px;
    margin: 10px;
}
.button11 {    font-size: 20px;
    border-radius: 15px;
    border-color: #8D653D;
    background-color: #FCCC9B;
    padding: 10px 20px;
    margin: 10px;
}
.button21 {    font-size: 20px;
    border-radius: 15px;
    border-color: #768F3A;
    background-color: #C7E188;
    padding: 10px 20px;
    margin: 10px;
}
.button31 {    font-size: 20px;
    border-radius: 15px;
    border-color: #295E70;
    background-color: #7CCAE4;
    padding: 10px 20px;
    margin: 10px;
}
.button111 {font-size: 20px;
    border-radius: 15px;
    border-color: #8D653D;
    background-color: #FCCC9B;
    padding: 10px 20px;
    margin: 10px;
}
.button5 {    font-size: 20px;
    border-radius: 15px;
    border-color: #B66F6A;
    background-color: #F3B4AF;
    padding: 10px 20px;
    margin: 10px;
}
.button12 {    font-size: 20px;
    border-radius: 15px;
    border-color: #8D653D;
    background-color: #FCCC9B;
    padding: 10px 20px;
    margin: 10px;
}
.button22 {    font-size: 20px;
    border-radius: 15px;
    border-color: #768F3A;
    background-color: #C7E188;
    padding: 10px 20px;
    margin: 10px;
}
.button32 {    font-size: 20px;
    border-radius: 15px;
    border-color: #295E70;
    background-color: #7CCAE4;
    padding: 10px 20px;
    margin: 10px;
}
.button41 {font-size: 20px;
    border-radius: 15px;
    border-color: #3c3c3c;
    background-color: #;
    padding: 10px 20px;
    margin: 10px;
    overflow: hidden; 
    transition: background-color 0.3s ease; 
    display: inline-block;
    position: relative; 
}
.button41::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background-color:gray;
    transition: left 0.3s ease;
    z-index: 0; 
}

.button41:hover::before {
    left: 0;
}


.button41 span {
    position: relative;
    z-index: 1;
}
-->
</style>
</head>

<body>
<div align="center">
  <table width="1224" height="209" border="0">
    <tr>
      <td width="1218" height="205"><div align="center">
        <blockquote>
          <p></p>
          <p class="Estilo1"><a href="menu.jsp"><img src="isotipo.png" alt="iso" width="120" height="120" border="0" /></a></p>
          <p class="Estilo10">TRABAJADORES</p>
          <p class="Estilo7">Datos </p>
        </blockquote>
      </div></td>
    </tr>
  </table>
</div>
<p align="center">&nbsp;</p>
<div align="center">
  <table width="590" height="59" border="0">
    <tr>
      <td width="376"><div align="left"><a href="IngresoDatosCodigo.jsp">
        <button class="button2">Ingreso</button>
      </a></div></td>
      <td width="198" bordercolor="0">&nbsp;</td>
    </tr>
  </table>
  <table width="591" height="54" border="0">
    <tr>
      <td width="217">&nbsp;</td>
      <td width="358"><div align="right"><a href="ModificarTrabajadoresCodigo.jsp">
        <button class="button2">Modificar</button>
      </a></div></td>
    </tr>
  </table>
  <table width="592" height="60" border="0">
    <tr>
      <td width="372"><div align="left"><a href="EliminarTrabajadoresCodigo.jsp">
        <button class="button2">Eliminar</button>
      </a></div></td>
      <td width="204">&nbsp;</td>
    </tr>
  </table>
  <table width="594" height="60" border="0">
    <tr>
      <td width="223">&nbsp;</td>
      <td width="355"><div align="right"><a href="ConsultarDatosCodigo.jsp">
        <button class="button2">Consultar</button>
      </a></div></td>
    </tr>
  </table>
  <table width="595" height="60" border="0">
    <tr>
      <td width="589"><div align="center"><a href="MenuTrabajadores.jsp"> </a> <a href="menu.jsp">
        <button class="button41">
          <div align="left">
            <div align="center">Inicio</div>
          </div>
          </button>
      </a></div></td>
    </tr>
  </table>
  <p><a href="menu.jsp"></a></p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</div>
</body>
</html>
