<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Men&uacute;</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
<style>
*{
    font-family: 'Ubuntu', sans-serif;
}
  body {
    font-size: 36px;

    text-align: center;
	line-height:0px;
  }

  .button {
    font-size: 20px;
    border-radius: 15px;
    border-color: #B66F6A;
    background-color: #F3B4AF;
    padding: 10px 20px;
    margin: 10px;
  }
    .button:hover{
    animation: animacion-boton 0.5s;
  }
  @keyframes animacion-boton{
    0%{
      transform:scale(1);
    }
    50%{
      transform:scale(1.25);
    }
    100%{
      transform:scale(1);
    }
  } 
  
  .button1 {
    font-size: 20px;
    border-radius: 15px;
    border-color: #8D653D;
    background-color: #FCCC9B;
    padding: 10px 20px;
    margin: 10px;
  }

  .button1:hover{
    animation: animacion-boton 0.5s;
  }
  @keyframes animacion-boton{
    0%{
      transform:scale(1);
    }
    50%{
      transform:scale(1.25);
    }
    100%{
      transform:scale(1);
    }
  }  
  .button2 {
    font-size: 20px;
    border-radius: 15px;
    border-color: #768F3A;
    background-color: #C7E188;
    padding: 10px 20px;
    margin: 10px;
  }
  .button2:hover {
    transform: scale(1.1);
}
  .button2:hover{
    animation: animacion-boton 0.5s;
  }
  @keyframes animacion-boton{
    0%{
      transform:scale(1);
    }
    50%{
      transform:scale(1.25);
    }
    100%{
      transform:scale(1);
    }
  } 

  .button3 {
    font-size: 20px;
    border-radius: 15px;
    border-color: #295E70;
    background-color: #7CCAE4;
    padding: 10px 20px;
    margin: 10px;
  }
   .button3:hover{
    animation: animacion-boton 0.5s;
  }
  @keyframes animacion-boton{
    0%{
      transform:scale(1);
    }
    50%{
      transform:scale(1.25);
    }
    100%{
      transform:scale(1);
    }
  } 

  a {
    text-decoration: none;
  }
.Estilo1 {font-size: 70px}
.Estilo7 {font-size: 24px}
.Estilo9 {font-size: 12pt; }
.Estilo10 {
	font-size: 40px;
	font-weight: bold;

}
.button4 {font-size: 20px;
    border-radius: 15px;
    border-color: #3c3c3c;
    background-color: #;
    padding: 10px 20px;
    margin: 10px;
    display: inline-block;
    position: relative;
    overflow: hidden; 
    transition: background-color 0.3s ease;
}

.button4::before {
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

.button4:hover::before {
    left: 0;
}


.button4 span {
    position: relative;
    z-index: 1;
}
</style>
</head>

<body>
<div align="center">
  <table width="1224" height="209" border="0">
    <tr>
      <td width="1218" height="205"><div align="center">
        <blockquote>
          <p class="Estilo1 Estilo9">&nbsp;</p>
          <p class="Estilo1"><a href="IngresarSistema.jsp"><img src="isotipo.png" width="120" height="120" border="0"></a></p>
          <p class="Estilo10">MEN&Uacute; PRINCIPAL</p>
          <p class="Estilo7">Formularios e Informes</p>
        </blockquote>
      </div></td>
    </tr>
  </table>
</div>
<p align="center">&nbsp;</p>
<div align="center">
  <table width="590" height="59" border="0">
    <tr>
      <td width="376"><div align="left"><a href="MenuCompras.jsp">
        <button class="button">Compras</button>
      </a></div></td>
      <td width="198" bordercolor="0">&nbsp;</td>
    </tr>
  </table>
  <table width="591" height="54" border="0">
    <tr>
      <td width="217">&nbsp;</td>
      <td width="358"><div align="right"><a href="MenuTelas.jsp">
        <button class="button1">Telas</button>
      </a></div></td>
    </tr>
  </table>
  <table width="592" height="60" border="0">
    <tr>
      <td width="372"><div align="left"><a href="MenuTrabajadores.jsp">
        <button class="button2">Trabajadores</button>
      </a></div></td>
      <td width="204">&nbsp;</td>
    </tr>
  </table>
  <table width="594" height="60" border="0">
    <tr>
      <td width="223">&nbsp;</td>
      <td width="355"><div align="right"><a href="MenuVentas.jsp">
        <button class="button3">Ventas</button>
      </a></div></td>
    </tr>
  </table>
  <table width="595" height="60" border="0">
    <tr>
      <td width="589"><div align="center"><a href="MenuTrabajadores.jsp"> </a> <a href="MenuInformes.jsp">
        <button class="button4">
          <div align="left">
            <div align="center">Informes</div>
          </div>
          </button>
      </a></div></td>
    </tr>
  </table>
</div>
<p>&nbsp;</p>
</body>
</html>
