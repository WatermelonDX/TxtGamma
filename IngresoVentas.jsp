<%@ include file="conecta.jsp" %>
<html>
<head>
<title>Ingreso Telas</title>
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

input[type="text"],input[type="date-time"] {
    border-radius: 15px;
    border-color: #01579b; /* Marr�n */
    background-color: #bceeff; /* Albaricoque */
    margin-bottom: 10px;
    font-size: 26px;
    padding: 8px;
}

input[type="button"],input[type="reset"] {
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
    padding: 2px;
    width:1000px;
    margin-top: 10px;
    color: #8B0000; /* Rojo oscuro */
}
.Estilo1 {font-size: 70px; margin-bottom: 0;}
.Estilo10 {font-size: 40px; font-weight: bold; margin-top: 0;}
.Estilo12 {font-size: 1px; font-weight: bold; margin-top: 0; }
.Estilo7 {font-size: 24px;}
</style>
<script type="text/javascript">
function graba(){
    if (document.formulario.codigo.value==""){
        alert('No se ha digitado el código');
    } else if (document.formulario.documentotrabajadores.value==""){
        alert('No se ha digitado el trabajador');
    } else if (document.formulario.fechadecompra.value==""){
        alert('No se ha digitado la fecha de compra');
    } else if (document.formulario.preciototal.value==""){
        alert('No se ha digitado el precio total');
    } else {
        document.formulario.submit();
    }
}

function borrar(){
    document.formulario.codigo.value = "";
    document.formulario.documentotrabajadores.value = "";
    document.formulario.fechadecompra.value = "";
    document.formulario.preciototal.value = "";
}

function asignar(){
    document.formulario.documentotrabajadores.value = document.formulario.documentotrabajadoresnombre.options[document.formulario.documentotrabajadoresnombre.selectedIndex].value;
}


</script>
</head>
<body>
   <a href="menu.jsp">Inicio</a>
        <a href="MenuTelas.jsp">Menú Telas</a>
    <form action="IngresoVentasGrabar.jsp" method="post" name="formulario">
     <div class="container">      
     <table width="1224" height="209" border="0">
      <tr>
        <td width="1218" height="205"><div>
            <blockquote>
              <p class="Estilo1">&nbsp;</p>
              <p class="Estilo1">&nbsp;</p>
              <p class="Estilo1"><img src="isotipo.png" width="175" height="175" alt="iso" /></p>
              <p class="Estilo10">&nbsp;</p>
              <p class="Estilo10">VENTAS</p>
              <p class="Estilo12">&nbsp;</p>
              <p class="Estilo7">Ingreso</p>
            </blockquote>
        </div></td>
      </tr>
    </table>
  </div>  
     
        <p>
        <%
        try {
            PreparedStatement inscri = c.prepareStatement("SELECT * FROM Ventas WHERE Codigo = ?");
            inscri.setString(1, request.getParameter("codigo"));
            ResultSet consu = inscri.executeQuery();
            if (consu.next()) {
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
                <td width="325">
                    <input type="date-time" name="fechadecomprae" value="<%= consu.getString("FechadeCompra") %>" size="4" readonly="true">
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
                <td>Tela</td>
                <td>Cantidad Producto</td>
                <td>Precio Unidad</td>
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
        %>
     <div class="error-message" style="background-color: #FFCCCB;">
        <p style="font-size: 30px; color: #8B0000;">Este c�digo ya existe, �desea probar con otro?</p>
        <button type="button" style="border-radius: 15px; border-color: #8B4513; background-color:#4cbb17; color: #FFFFFF; font-size: 26px; padding: 10px 20px; cursor: pointer;" onclick="location.href='IngresoVentasCodigo.jsp'">Aceptar</button>
     </div> 
        <%
        } else {
        %>
        <p>
        <table width="957">
            <tr>
                <%
                double mat = 1;
                try {
                    PreparedStatement instruccion2 = c.prepareStatement("SELECT MAX(Codigo) as Codigo FROM Ventas");
                    ResultSet resultado2 = instruccion2.executeQuery();
                    if (resultado2.next()) {
                        Integer mat1 = Integer.parseInt(resultado2.getString("Codigo"));
                        mat = mat1 + 1;
                    }
                } catch (Exception e) {
                    System.out.println(e.toString());
                }
                %>
                <td colspan="2">Como este código no existe, puede ingresar los datos para registrarlo
                    <p>&nbsp;</p>
                    Codigo:
                    <input type="text" name="codigo" value="<%= mat %>" readonly="true">
                </td>
            </tr>
            <tr>
                <td colspan="2">Trabajador:
                    <input type="text" name="documentotrabajadores" size="4">
                    <select name="documentotrabajadoresnombre" onchange="javascript:asignar();">
                        <%
                        try {
                            PreparedStatement instruccion = c.prepareStatement("SELECT * FROM trabajadores ORDER BY Documento");
                            ResultSet resultado = instruccion.executeQuery();
                            while (resultado.next()) {
                        %>
                        <option value="<%= resultado.getString("Documento") %>">
                            <%= resultado.getString("Nombre") %>
                        </option>
                        <%
                            }
                        } catch (Exception e) {
                            System.out.println(e.toString());
                        }
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">Fecha de Compra:
                    <input type="date-time" name="fechadecompra" placeholder="aaaa-mm-dd">
                </td>
            </tr>
            <tr>
                <td colspan="2">Precio Total:
                    <input type="text" name="preciototal">
                </td>
            </tr>
        </table>
        <input name="Grabar" type="button" onClick="javascript:graba()" value="Continuar">
        <input name="Borrar" type="reset" id="Borrar" value="Borrar">
        <%
        }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        %>
    </form>

</div>
</body>
</html>




