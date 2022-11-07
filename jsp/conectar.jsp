<%@ page import="java.sql.*" %>
<%
  //Adiconar mysql-connector-java-5.1.40-bin.jar na pasta lib do tomcat no caso de não haver
  Class.forName("com.mysql.jdbc.Driver");
	Connection conexao = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/natureza_viva","root",""); 
%>