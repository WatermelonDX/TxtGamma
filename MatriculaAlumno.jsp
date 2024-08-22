<%@ include file="conecta.jsp" %>
<html>
<head>
<title>Matricula del alumno</title>
<script language="javascript">
function asignar(){
 document.formulario.Grupo.value=document.formulario.Gruponombre.options[document.formulario.Gruponombre.selectedIndex].value
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"><style type="text/css">
<!--
body {
	background-image: url();
}
.Estilo2 {
	font-size: 18px;
	color: #FF0000;
	font-weight: bold;
}
.Estilo3 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style></head>
<body>
<form action="MatriculaAlumnoGrabar.jsp" method="post" name="formulario"></p>
  <p><a href="menu.jsp">Inicio</a> &nbsp;
 <%
 String cod=request.getParameter("Codigo");

%>
    <span class="Estilo2">NUEVAS MATRICULAS </span>  </p>
  <table width="950" border="1">
    <tr>
      <td width="940">
          <p>Alumno:
            <input type="text" name="codigo" size="12" value="<%=cod%>"  readonly="true" maxlength="12">
            <%PreparedStatement alumno=c.prepareStatement("Select Nombre from Datos where Codigo=?");
            alumno.setString(1,cod);
            ResultSet rsalumno=alumno.executeQuery();  
           if (rsalumno.next()){%>
            <input type="text" name="nombre" size="30" value="<%=rsalumno.getString("Nombre")%>"  readonly="true">
			Fecha ingreso:
            <input type="text" name="Fecha" size="6">
	      <%}
          else{   
           %>
        <p>*****.......ALERTA No existe el alumno, no se puede matricular....***** </p>
           <p>***........Primero ingrese los datos personales.......
          <% 
          }%>
       +</p></td>
    </tr>
    <tr>
      <td><%
      double mat=1;
      try{
       PreparedStatement instruccion=c.prepareStatement("Select Max(Numero) as Matri from Matricula ");
       ResultSet resultado=instruccion.executeQuery();  
       if ((resultado.next())){
	    Integer mat1= new Integer(resultado.getString("Matri"));
	    mat=mat1.doubleValue()+1;
       }
      }catch(Exception e){
	   System.out.println(e.toString());
      } %>
      N&uacute;mero de matricula:
      <input type="text" name="numero" value="<%=mat%>">
      </p>
      Grupo de estudio:
      
      <input name="Grupo" type="text" size="10" maxlength="10" >
      <select name=Gruponombre onclick="javascript:asignar();">
        <%
      try{
       PreparedStatement instruccion=c.prepareStatement("Select * from Grupos ORDER BY Codigo");
       ResultSet resultado=instruccion.executeQuery();
       while (resultado.next()){ %>
        <option selected value ="<%=resultado.getString("Codigo")%>"> <%=resultado.getString("Nombre")%> </option>
        <%
       }
      }catch(Exception e){
	   System.out.println(e.toString());
      }
      %>
            </select></td>
    </tr>
    <tr>
      <td>&nbsp;
  Nombre Acudiente:
    <input type="text" name="Nombre Acudiente2" size="65""  maxlength="65"></td>
    </tr>
	    <tr>
      <td>&nbsp;
  Contacto Acudiente:
    <input type="text" name="Nombre Telefono" size="20""  maxlength="20"> 
    Correo 
    <input type="text" name="Nombre Telefono2" size="65""  maxlength="65"></td>
    </tr>
  </table>
 
    <p>
      <input type="button" name="button" value="Grabar">
  </p>
</p>
   <%
  try{
   PreparedStatement matricu=c.prepareStatement("Select Numero,DAY(Fecha)+' de '+ MONTH(Fecha)+'/'+ YEAR(Fecha) AS FechaM, NombreAcudiente from Matricula where Estudiante=?");
   matricu.setString(1,cod);
   ResultSet rsmatricu=matricu.executeQuery();
   if ((rsmatricu.next())){
   %>
    </p>
	<span class="Estilo3">YA TIENE LAS SIGUIENTES MATRICULAS</span>
  <table width="555" border="1">
    <tr>
     <td width="97">Matricula</td>
     <td width="188">Fecha(dd/mm/aaaa)</td>
     <td width="248">Acudiente</td>
    </tr><tr>
     <td><%out.println(rsmatricu.getString("Numero"));%></td>
     <td><%out.println(rsmatricu.getString("FechaM"));%></td>
     <td><%out.println(rsmatricu.getString("NombreAcudiente"));%></td>
    </tr>
    <%
    while (rsmatricu.next()){
    %>
    <tr>
     <td><%out.println(rsmatricu.getString("Numero"));%></td>
     <td><%out.println(rsmatricu.getString("FechaM"));%></td>
     <td><%out.println(rsmatricu.getString("NombreAcudiente"));%></td>
    </tr>
    <%
    }
   }
   rsmatricu.close();
   c.close();
  }catch(Exception e){
   System.out.println(e.toString());
  }
  %>
  </table>
</form>
</body>

</html>