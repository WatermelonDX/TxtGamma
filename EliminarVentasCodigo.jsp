<!DOCTYPE html>
<html>
<head>
<title>Eliminar Ventas Codigo</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">

<style>
* {
    font-family: 'Ubuntu', sans-serif;
    font-size: 26px;
    margin: 20px;
}

body {
    text-align: center;
    line-height: 0px;
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
    border-color: #8B4513; /* Marr�n oscuro */
    background-color:#4cbb17; /* Dorado */
    color: #FFFFFF; /* Blanco */
    font-size: 26px;
    padding: 10px 20px; /* Ajusta el padding seg�n tus necesidades */
}
</style>
</head>
<body>
<form action="EliminarVentas.jsp" method="post" name="formulario">
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>Ingrese un nuevo codigo </p>
<p>&nbsp;</p>
<p>Codigo:
  <input name="codigo" type="text" id="codigo" placeholder="Ingrese código de la venta">
  <input type="submit" name="enviar" value="Consultar" >
</p>
</form>
</body>
</html>
