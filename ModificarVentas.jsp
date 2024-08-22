<%@ include file="conecta.jsp" %>
<html>
<head>
<title>ModificarVentas</title>
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
     }else if (document.formulario.cantidadtotal.value==""){
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
<a href="menu.jsp">Inicio</a>;
<a href="MenuTelas.jsp">MenuTelas</a>
    <form  method="post" name="formulario" action="ModificarVentasGrabar.jsp ">
       
        <p>
        <%
        try{
            PreparedStatement inscri=c.prepareStatement("SELECT * FROM Ventas WHERE Codigo=?");
            inscri.setString(1,request.getParameter("codigo"));
            ResultSet consu=inscri.executeQuery();
            if(consu.next()){
        %>
    <table width="654" border="0" align="center">
        <tr>
            <td height="29">Codigo :
            <input type="text" name="codigo" size="12" value= " <%=request.getParameter("codigo")  %>"  maxlength="12" ></td>
            <td>&nbsp;</td>
        </tr>
        
        <tr>
            <td width="325" height="29">Documento Trabajador: 
            <input type="text" name="nombre" value="<% out.println(consu.getString("DocumentoTrabajadores"));%>" > </td>
            <td width="313">&nbsp;</td>
        </tr>
        <tr>
            <td>Fecha de Compra:
            <input type="date-time" name="tipo" value="<% out.println(consu.getString("FechaDeCompra"));%>" placeholder="aaaa-mm-dd"></td>
        </tr>
        <tr>
            <td>Precio Total:
            <input type="text" name="cantidadtotal" value="<% out.println(consu.getString("PrecioTotal")); %>" ></td>
        </tr>
        <tr>

            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
        <td><input type="button" name="Actualizar" value="Actualizar Datos" OnClick="javascript:graba()"></td>
        </tr>
    </table>

    <p>&nbsp;</p>

    <%
            try {
                PreparedStatement matricu = c.prepareStatement("SELECT CodigoVentas,CodigoTelas as tela, CantidadProducto, PrecioUnidad FROM DetallesVentas WHERE CodigoVentas = ?");
                matricu.setString(1, request.getParameter("codigo"));
                ResultSet rsmatricu = matricu.executeQuery();
                if (rsmatricu.next()) {
        %>
       
        <table width="992" border="0"> 
            <tr> 
             <td colspan="4"><p align="center"><span class="Estilo3">Factura</span></p></td>
            </tr>
            <tr>
                <td width="100">Venta</td>
                <td width="620">Tela</td>
                <td width="188">Cantidad Producto</td>
                <td width="248">Precio Unidad</td>
            </tr>
            <tr>
             <form name="formulariomodificar.jsp" method="post" action="modificarfacturacionventa.jsp">
               <td><input type="text" name="venta" value="<%= rsmatricu.getString("CodigoVentas")%>" readonly="true"></td> 
               <td><input type="text" name="tela" value="<%= rsmatricu.getString("tela") %>" readonly="true">
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
                
                <td><input type="text" name="cantidad" value="<%= rsmatricu.getString("CantidadProducto") %>" readonly="true"></td>
                <td><input type="text" name="precio" value="<%= rsmatricu.getString("PrecioUnidad") %>" readonly="true"></td>
                <td><input type="submit" name="modificar" value="modificar"></a></td>
             </form>
            </tr>
            <%
            while (rsmatricu.next()) {
            %>
            <tr>
             <form name="formulariomodificar" method="post" action="modificarfacturacionventa.jsp">
                <td><input type="text" name="venta" value="<%= rsmatricu.getString("CodigoVentas")%>" readonly="true"></td> 
                <td><input type="text" name="tela" value="<%= rsmatricu.getString("tela") %>" readonly="true">
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
                <td><input type="text" name="cantidad" value="<%= rsmatricu.getString("CantidadProducto") %>" readonly="true"></td>
                <td><input type="text" name="precio" value="<%= rsmatricu.getString("PrecioUnidad") %>" readonly="true"></td>
                <td><input type="submit" name="modificar" value="modificar"></a></td>
             </form>
            </tr>
            <%
            }
            rsmatricu.close();
        }
        c.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        %> 
    <%
    consu.close();
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