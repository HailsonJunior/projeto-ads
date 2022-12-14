<!doctype html>
<html lang="pt-br">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.0/css/font-awesome.css" integrity="sha512-CB+XYxRC7cXZqO/8cP3V+ve2+6g6ynOnvJD6p4E4y3+wwkScH9qEOla+BTHzcwB4xKgvWn816Iv0io5l3rAOBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  </head>
  <body>
         <!-- Navbar -->
        <%@include file="menu.jsp" %>
        <!-- Content -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-2">
                </div>
                <div class="col-8">
                    <br><br><br>
                    <form method='post' action=''>
                      Atualizar Status: <select name='agendamentosid'>
	                  <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conexao = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/natureza_viva","root","");
		                    PreparedStatement statement=conexao.prepareStatement("select * from agendamentos where status != 'usado'");
		                    int lin=0;
		                    ResultSet listar2=statement.executeQuery();
		                    out.print("<option value='' selected>Codigo Agendamento</option>");
		                    while(listar2.next()){
		                      out.println("<option value='"+listar2.getString("id")+"'>"+listar2.getString("id")+"</option>");	
		                      lin++;
                        }					
	                  %>
	                  </select>
                      <select name='status'>
                        <option value='' selected>Status</option>
                        <option value="aprovado">Aprovado</option>
                        <option value="pendente">Pendente</option>
                        <option value="cancelado">Cancelado</option>
                        <option value="usado">Usado</option>
                      </select>
	                  <%if(lin!=0){
	                	out.println("<input type='submit' value='Confirmar' onclick='alerta()'>");
	                  }%>
                    </form>
                    <br>
                    <%@ page import="java.sql.*" %>
					          <%
                      Object obj_user = session.getAttribute("usuario");
                      String user = obj_user.toString();

                      PreparedStatement statement2=conexao.prepareStatement("select * from agendamentos where status != 'usado'");
                      ResultSet listar=statement2.executeQuery();
                      int reg=1;

                      while(listar.next()){
	                      out.println("<b>AGENDAMENTO "+reg+":</b>");
                        out.println("<b><br>Codigo: </b>");
                        out.println(listar.getString("id"));
                        out.println("<b><br>Nome Local: </b>");
		                    out.println(listar.getString("nome_local"));
                        out.println("<b><br>Tipo: </b>");
		                    out.println(listar.getString("tipo"));
                        out.println("<b><br>Data: </b>");
		                    out.println(listar.getString("data"));
                        out.println("<b><br>Periodo: </b>");
                        out.println(listar.getString("periodo"));
                        out.println("<b><br>Status: </b>");
                        out.println(listar.getString("status"));

                        out.println("<b><br>Solicitante: </b>");
                        String responsavel = listar.getString("fk_responsavel");
                        PreparedStatement statement3=conexao.prepareStatement("select usuario from usuarios where id = ?");
                        statement3.setString(1,responsavel);
                        ResultSet listar3=statement3.executeQuery();
                        if(listar3.next()){
                          out.println(listar3.getString("usuario")+"<p>"+"<br>");
                        }
		                    reg++;
                      }
                    %>
                </div>
				<div class="col-2"></div>
			</div>
		</div>
    </body>
  <footer>
		<!-- jQuery and Bootstrap Bundle (includes Popper) -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
  </footer>
</html>

<%
   if (request.getMethod().equals("POST")) {
	   if(lin==0)
		   out.println("N??o h?? agendamentos cadastrados!<p>");
	   else{
		   String agendamento=request.getParameter("agendamentosid");
       String status=request.getParameter("status");		
		   PreparedStatement statement4=conexao.prepareStatement("update agendamentos set status=? where id=?");
		   statement4.setString(1,status);
       statement4.setString(2,agendamento);
		   statement4.execute();
		   response.setIntHeader("Refresh", 2);
	  }
  }
%>