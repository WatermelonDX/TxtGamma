<%@ include file="conecta.jsp" %>
<html>
<head>
<title>Ingreso Telas</title>
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

input[type="text"],input[type="date-time"] {
    border-radius: 15px;
    border-color: #01579b; /* Marr�n */
    background-color: #bceeff; /* Albaricoque */
    margin-bottom: 10px;
    font-size: 17px;
    width: 100%;
    box-sizing: border-box;
	padding: 8px;
}

input[type="button"] {
    border-radius: 15px;
    border-color: #8B4513; /* Marr�n oscuro */
    background-color:#4cbb17; /* Dorado */
    color: #FFFFFF; /* Blanco */
    font-size: 26px;
    padding: 10px 20px;
    cursor: pointer;
}

input[type="reset"] {
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
    background-color: #FFA07A; /* Salm�n claro */
    border: 2px solid #FF6347; /* Rojo coral */
    border-radius: 5px;
    padding: 10px;
    margin-top: 10px;
    color: #8B0000; /* Rojo oscuro */
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
<div class="container">
    <form  method="post" name="formulario">
        <a href="menu.jsp">Inicio</a>;
        <a href="MenuTelas.jsp">MenuTelas</a>
        <p>
        <%
        try{
            PreparedStatement inscri=c.prepareStatement("SELECT * FROM Ventas WHERE Codigo=?");
            inscri.setString(1,request.getParameter("codigo"));
            ResultSet consu=inscri.executeQuery();
            if(consu.next()){
        %>
   <table width="327" border="0" align="center">
            <tr>
                <td width="325" colspan="3">Codigo:
                    <input type="text" name="codigo" value="<%= request.getParameter("codigo") %>" readonly="true">
                </td>
            </tr>
            <tr>
                <td width="325" colspan="3" height="29">Trabajador:
                    <input type="text" name="documentotrabajadores" value="<%= consu.getString("DocumentoTrabajadores") %>" readonly="true">
                </td>
            </tr>
            <tr >
             <td colspan="3" >
              Fecha de Compra:
             </td>
            </tr>
            <tr>
                <td width="110">
                    <input type="date-time" name="fechadecomprae" value="<%= consu.getString("FechadeCompra") %>" size="8" readonly="true">
                </td>
                <td>
            
                </td>
            </tr>
            <tr>
                <td colspan="3" >Precio Total:
                    <input type="text" name="preciototal" value="<%= consu.getString("PrecioTotal") %>" readonly="true">
                </td>
            </tr>
        </table>
        <p>&nbsp;</p>
    
        <%
            try {
                PreparedStatement matricu = c.prepareStatement("SELECT CodigoTelas as tela, CantidadProducto, PrecioUnidad FROM DetallesVentas WHERE CodigoVentas = ?");
                matricu.setString(1, request.getParameter("codigo"));
                ResultSet rsmatricu = matricu.executeQuery();
                if (rsmatricu.next()) {
        %>
       
        <table width="992" border="0"> 
            <tr> 
             <td colspan="4"><p align="center"><span class="Estilo3">Factura</span></p></td>
            </tr>
            <tr>
                <td width="720">Tela</td>
                <td width="188">Cantidad Producto</td>
                <td width="248">Precio Unidad</td>
            </tr>
            <tr>
                <td>(<%= rsmatricu.getString("tela") %>)
                    <%
                    try {
                        PreparedStatement rmatricu = c.prepareStatement("SELECT Nombre FROM Telas WHERE Codigo = ?");
                        rmatricu.setString(1, rsmatricu.getString("tela"));
                        ResultSet smatricu = rmatricu.executeQuery();
                        if (smatricu.next()) {
                            %><%= smatricu.getString("Nombre") %><%
                        }
                        smatricu.close();
                    } catch (Exception e) {
                        System.out.println(e.toString());
                    }
                    %>
                </td>
                <td><%= rsmatricu.getString("CantidadProducto") %></td>
                <td><%= rsmatricu.getString("PrecioUnidad") %></td>
            </tr>
            <%
            while (rsmatricu.next()) {
            %>
            <tr>
                <td>(<%= rsmatricu.getString("tela") %>) <%
                    try {
                        PreparedStatement rmatricu = c.prepareStatement("SELECT Nombre FROM Telas WHERE Codigo = ?");
                        rmatricu.setString(1, rsmatricu.getString("tela"));
                        ResultSet smatricu = rmatricu.executeQuery();
                        if (smatricu.next()) {
                            %><%= smatricu.getString("Nombre") %><%
                        }
                        smatricu.close();
                    } catch (Exception e) {
                        System.out.println(e.toString());
                    }
                    %></td>
                <td><%= rsmatricu.getString("CantidadProducto") %></td>
                <td><%= rsmatricu.getString("PrecioUnidad") %></td>
            </tr>
            <%
            }
            rsmatricu.close();
        }
        c.close();
              } catch (Exception e) {
            System.out.println(e.toString());
        }
        }else{ 
    %>
    <h1>Venta Inexistente</h1>
    <%
        }}catch(Exception e){
            System.out.println(e.toString());
        }
    %>
</body>
</html>