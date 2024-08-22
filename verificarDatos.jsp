<title>Verificar Datos</title><%@ include file="conecta.jsp" %>
<%
try{
    String usu;
	usu=request.getParameter("trabajador");
	String cla;
	cla=request.getParameter("documento");
	PreparedStatement instruccion=c.prepareStatement("SELECT Documento FROM trabajadores WHERE Documento = ?");
    instruccion.setString(1, documento);
	ResultSet resultado=instruccion.executeQuery();
	if(resultado.next()){
	    response.sendRedirect("menu.jsp");
	}else{
	    response.sendRedirect("IngresarSistema.jsp");
	 
	  } 
	  resultado.close();
	  instruccion.close();
	  c.close();
   }catch(Exception e){
	System.out.println(e.toString());
	}
%>
