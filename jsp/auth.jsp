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
    <link rel="stylesheet" href="css/index.css" crossorigin="anonymous">
  </head>
  <body>
		<div class="container-fluid">
			<div class="row">
				<div class="col-1">
					<br><br><br>
				</div>		
				<div class="col-10">
					<br><br>
					<%@ page import="java.sql.*" %>
                    <%@include file="conectar.jsp" %>
                    <% request.setCharacterEncoding("UTF8");
                        
                        //se não for uma tentiva de login redirect para login 
                        if(!request.getMethod().equals("POST")){
                            response.sendRedirect("../index.html");
                        }

                        String usuario = request.getParameter("usuario");
                        String senha = request.getParameter("senha");

                        PreparedStatement login = conexao.prepareStatement("select * from usuarios where usuario = ? and senha = ?");
                        login.setString(1, usuario);
                        login.setString(2, senha);
                        ResultSet consulta = login.executeQuery();

                        if(consulta.next()){
                            String username = "";
                            String user = consulta.getString("usuario");
                            session.setAttribute(username, user);
                            response.sendRedirect("home.jsp"); // login success
                        } 
                        
                        //login failed!
                        out.println("<div class='alert alert-danger'>Falha no Login!<br>Usuario nao cadastrado!</div>");
                    %>
					<br>
                    <div>
                        <a class="btn btn-primary pull-left" href="../index.html"> <!-- login -->
                            <i class="fa fa-arrow-circle-left"></i> Voltar
                        </a>
                        <a class="btn btn-success pull-right" href="../cadastrar.html"> <!-- cadastrar.html -->
                            <i class="fa fa-plus-circle"></i> Cadastrar
                        </a>
                    </div>
				</div>
				<div class="col-1"></div>		
			</div>
		</div>
    </body>
  <footer>
		<!-- jQuery and Bootstrap Bundle (includes Popper) -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
  </footer>
</html>

