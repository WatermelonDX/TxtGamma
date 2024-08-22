<%@ page import="java.sql.*"%>
<%
Connection c=null;
try{
    c=DriverManager.getConnection("jdbc:ucanaccess://C:\\proyectitio\\proyectitio.accdb","","");
	}catch(Exception e){
	    System.out.println(e.toString());
	}
%>
