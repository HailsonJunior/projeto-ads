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
                      Abrir Ocorrencia: <select name='agendamentosid'>
	                  <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conexao = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/natureza_viva","root","");
		                    PreparedStatement statement2=conexao.prepareStatement("select * from agendamentos");
		                    int lin=0;
		                    ResultSet listar2=statement2.executeQuery();
		                    out.print("<option value='' selected>Codigo Agendamento</option>");
		                    while(listar2.next()){
		                      out.println("<option value='"+listar2.getString("id")+"'>"+listar2.getString("id")+"</option>");	
		                      lin++;
                            }					
	                  %>
	                  </select>
                      <br>
                      <label>Comentario:</label>
                      <input type="text" class="form-control" name="comentario" placeholder="Deixe um comentario" required><br>
	                  <%if(lin!=0){
	                	out.println("<input type='submit' value='Confirmar' onclick='alerta()'>");
	                  }%>
                    </form>
                    <br>
                    <%@ page import="java.sql.*" %>
					<%
                      PreparedStatement statement=conexao.prepareStatement("select * from agendamentos where status='usado'");
                      ResultSet listar=statement.executeQuery();
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
                        out.println("<b><br>Codigo Usuario Responsavel: </b>");
                        out.println(listar.getString("fk_responsavel")+"<p>"+"<br>");
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
		out.println("Não há agendamentos usados!<p>");
	else{
		String agendamento=request.getParameter("agendamentosid");
        String comentario=request.getParameter("comentario");		
		PreparedStatement statement3=conexao.prepareStatement("insert into ocorrencias (id_agendamento, comentario) values (?, ?)");
		statement3.setString(1,agendamento);
        statement3.setString(2,comentario);
		statement3.execute();
		response.setIntHeader("Refresh", 2);
	}
  }
%>