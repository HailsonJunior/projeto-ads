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
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/cadastro.css">
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
                    <br><br><br><br>
                    <div class="card">
                        <div class="card-header bg-primary">
                            <h3 class="card-title text-center text-white">Cadastro Local</h3>
                        </div>
                        <form id="formCadastro" method="POST">
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="nome">Nome Local</label>
                                    <input type="text" class="form-control" name="nome" id="nome" placeholder="Informe o nome do local" required>
                                </div>
                                <div class="form-group">
                                    <label for="tipo">Tipo Local</label>
                                    <select class="form-control" id="tipo">
                                        <option value="salao" selected>Salao</option>
                                        <option value="auditorio">Auditorio</option>
                                    </select>
                                  </div>
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary">Enviar</button>
                            </div>
                        </form>
                    </div>
                </div>
				<div class="col-2"></div>
			</div>
            <br><br>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-8 pull-left">
                    <br><br><br>
                    <a class="btn btn-danger pull-left" href="home.jsp"> <!-- cadastrar.html -->
                        <i class="fa fa-arrow-circle-left"></i> Voltar
                    </a>
                </div>
            </div>
		</div>
    </body>
  <footer>
		<!-- jQuery and Bootstrap Bundle (includes Popper) -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <!-- Custom js -->
		<script src="js/cadastrar.js"></script>
  </footer>
</html>
<%@ page import="java.sql.*" %>
<%
   if (request.getMethod().equals("POST")) {
    String nome=request.getParameter("nome");
    String tipo=request.getParameter("tipo");

    Class.forName("com.mysql.jdbc.Driver");
    Connection conexao = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/natureza_viva","root","");
    Class.forName("com.mysql.jdbc.Driver");
    PreparedStatement statement=conexao.prepareStatement("insert into local (nome, tipo) values (?, ?)");
    statement.setString(1,nome);
    statement.setString(2,tipo);
    statement.execute();
    response.setIntHeader("Refresh", 2);
   }
%>