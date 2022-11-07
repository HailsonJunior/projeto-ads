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
                    <%@ page import="java.sql.*" %>
                    <%@include file="conectar.jsp" %>
                   <div class="row">
                        <div class="col-10">
                            <%
                                if (request.getMethod().equals("POST")) {
                                    String nome = request.getParameter("excluir");	
                                    PreparedStatement amigo = conexao.prepareStatement("delete from amigos where nome = ?");
                                    amigo.setString(1, nome);
                                    amigo.execute();

                                    out.println("<div class='alert alert-success text-center'><i class='fa fa-check-circle'></i> Registro excluido com sucesso!</div>");
                                } else {
                                    PreparedStatement amigos = conexao.prepareStatement("select * from amigos");
                                    ResultSet resultado = amigos.executeQuery();
                                    
                                    if(!resultado.next()){
                                        out.println("<div class='alert alert-danger text-center'><i class='fa fa-times-circle'></i> Nao ha contatos cadastrados!</div>"); 
                                        return;
                                    }
                            %> 
                            <form method='POST'>
                                <div class="form-group">
                                    <select name="excluir" class="form-control" id="selectExclusao" required>
                                        <%
                                            PreparedStatement statement = conexao.prepareStatement("select * from amigos");
                                            ResultSet consulta = statement.executeQuery();
                                            out.print("<option value='' hidden selected> Escolha uma opcao </option>");
                                            while(consulta.next()){
                                                out.println("<option value='" + consulta.getString("nome") + "'>" + consulta.getString("nome") + "</option>");
                                            }					
                                        %>
                                    </select>
                                </div>                           
                        </div>
                        <div class="col-2">
                            <button class='btn btn-danger' type='submit'>Excluir</button>
                        </div>
                            </form>
                            <%}%>
                   </div>
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
