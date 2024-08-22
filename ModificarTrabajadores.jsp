<%@ include file="conecta.jsp" %>
<html>
<head>
<title>Modificar Trabajadores</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap" rel="stylesheet">
<style>
* {
    font-size: 26px;
    font-family: 'Ubuntu', sans-serif;
    margin: 20px;
}

.container {
    margin: 20px;
}

.input-field {
    border-radius: 15px;
    border-color: #01579b; /* Marrón */
    background-color: #bceeff; /* Albaricoque */
    margin-bottom: 10px;
    font-size: 17px;
    padding: 5px 10px;
    width: 20%;
    box-sizing: border-box;
}

.submit-button {
    border-radius: 15px;
    border-color: #8B4513; /* Marrón oscuro */
    background-color:#4cbb17; /* Dorado */
    color: #FFFFFF; /* Blanco */
    padding: 5px 10px;
    font-size: 17px;
    cursor: pointer;
}

.error-message {
    background-color: #FFA07A; /* Salmón claro */
    border: 2px solid #FF6347; /* Rojo coral */
    border-radius: 5px;
    padding: 10px;
    margin-top: 10px;
    color: #8B0000; /* Rojo oscuro */
}
</style>
<script languaje="javascript">
function graba() {
    if (document.formulario.documento.value==""){
        alert('No digitó el documento');
    } else if (document.formulario.nombre.value==""){
        alert('No digitó el nombre');
    } else if (document.formulario.contacto.value==""){
        alert('No digitó el contacto');
    } else {
        document.formulario.submit();
    }
}

function borrar(){
    document.formulario.nombre.value="";
    document.formulario.contacto.value="";
}
</script>
</head>
<body>
<div class="container">
    <form action="ModificarTrabajadoresGrabar.jsp" method="post" name="formulario">
        <a href="menu.jsp">Inicio</a>;
        <p>
        <%
        try{
            PreparedStatement inscri=c.prepareStatement("SELECT * FROM trabajadores WHERE Documento=?");
            inscri.setString(1,request.getParameter("documento"));
            ResultSet consu=inscri.executeQuery();
            if(consu.next()){
        %>
        Documento:<input class="input-field" type="text" name="documento" value="<% out.println(consu.getString("Documento"));%>">
        <p>Nombre: 
          <input class="input-field" type="text" name="nombre" value="<% out.println(consu.getString("Nombre"));%>">
        <p>Contacto:  
          <input class="input-field" type="text" name="contacto" value="<% out.println(consu.getString("Contacto")); %>">
          <p>
            <input class="submit-button" name="actualizar" type="button" onClick="javascript:graba()" value="Actualizar Datos">
            <input class="submit-button" name="Borrar" type="reset" id="Borrar" value="Borrar">
            <%
        consu.close();
        c.close();
        } else {
        %>
            <h2>No existe el trabajador</h2>
        <%
        consu.close();
        c.close();
        }} catch(Exception e) {
            System.out.println(e.toString());
        }
        %>
    </form>
</div>
</body>
</html>
