<%@ include file="conecta.jsp" %>

<html>

<head>

</head>

<body>

<%

try{

PreparedStatement instruccion=c.prepareStatement("delete * from trabajadores where Documento=?");

instruccion.setString(1,request.getParameter("documento"));

instruccion.executeUpdate();

instruccion.close();

c.close();

response.sendRedirect("menu.jsp");

} catch (Exception e){

System.out.println(e.toString());

}

%>

</body>

</html>