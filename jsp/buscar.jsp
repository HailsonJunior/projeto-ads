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
				<div class="col-lg-2 col-md-1 col-sm-1">
                </div>
                <div class="col-lg-8 col-md-10 col-sm-10">
                    <br><br><br>
                     <table class="table table-striped table-bordered text-center">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Nome</th>
                                 <th scope="col">Telefone</th>
                                <th scope="col">Email</th>
                                <th scope="col">Data Nascimento</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%@ page import="java.sql.*" %>
                        <%@include file="conectar.jsp" %>
                        <%
                            String nome = request.getParameter("nome");
                            PreparedStatement amigos = conexao.prepareStatement("select * from amigos where nome like ?");
                            amigos.setString(1, "%" + nome + "%");
                            ResultSet resultado = amigos.executeQuery();
                            int count = 0;
                            while(resultado.next()){
                                out.println("<tr><th scope='row'>" + resultado.getString("nome") + "</th>");
                                out.println("<td>" + resultado.getString("telefone") + "</td>");
                                out.println("<td>" + resultado.getString("email") + "</td>");
                                out.println("<td>" + resultado.getString("datanasc") + "</td></tr>");
                                count++;
                            }	
                        %>
                        </tbody>
                    </table>
                    <%
                        out.println("<hr>");
                        out.println("<div class='alert alert-info'><b><i class='fa fa-info-circle'></i> Foram localizados <br>" + count + "</b> registros</div>");
                    %>

                </div>
				<div class="col-lg-2 col-md-1 col-sm-1"></div>
			</div>
		</div>
    </body>
  <footer>
		<!-- jQuery and Bootstrap Bundle (includes Popper) -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
  </footer>
</html>