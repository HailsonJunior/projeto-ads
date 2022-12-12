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
                <section class="pt-5 pb-5 mt-0 align-items-center d-flex">
                    <div class="container-fluid">
                        <div class="row  justify-content-center align-items-center d-flex-row text-center h-100">
                            <%
                                String usuario = (String) session.getAttribute("usuario");
                                PreparedStatement statement = conexao.prepareStatement("select * from usuarios where usuario = ?");
                                statement.setString(1, usuario);
                                ResultSet consulta = statement.executeQuery();
                                while(consulta.next()){
                            %>
                            <div class="col-12 col-lg-4 col-md-8 h-50">
                            <div class="card shadow">
                                <div class="card-body mx-auto">
                                <div class="text-center">
                                    <img src="../img/profile/among.jpg" width="100" class="rounded-circle">
                                </div>
                                <h4 class="card-title mt-3 text-center">Editar Perfil</h4>
                                <form id="formCadastro" method="POST" action="formalterardados.jsp">
                                    <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                                    </div>
                                    <input type="text" class="form-control" value="<% out.println(consulta.getString("usuario")); %>" name="usuario" id="usuario" placeholder="Usuario" required>
                                    </div>
                                    <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                                    </div>
                                    <input type="email" class="form-control"value="<% out.println(consulta.getString("email")); %>" name="email" id="email" placeholder="Digite seu e-mail" required>
                                    </div>
                                    <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-key"></i> </span>
                                    </div>
                                    <input type="password" min="4" max="8" class="form-control" name="senha" id="password" placeholder="Nova senha" required>
                                    </div>
                                    <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-key"></i> </span>
                                    </div>
                                        <input type="password" min="4" max="8" class="form-control" name="senhaConfirme" id="confirmPassword" placeholder="Confirme a senha" required>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary btn-block"> 
                                            <i class="fa fa-floppy-o"></i> Alterar
                                        </button>
                                    </div>
                                </form>
                                </div>
                            </div>
                            </div>
                        </div>
                        <%
                         }					
                        %>
                    </div>
                </section>
                <%-- <div class="row">
                    <div class="col-10">
                        <form method='POST' action="formalterardados.jsp">
                            <div class="form-group">
                                <input hidden name="alterado" value="0">
                                <select name="alterar" class="form-control" id="selectAlterar" required>
                                    <%
                                        String usuario = session.getAttribute("usuario");
                                        PreparedStatement statement = conexao.prepareStatement("select * from usuarios where usuario = ?");
                                        statement.setString(1, usuario);
                                        ResultSet consulta = statement.executeQuery();
                                        out.print("<option value='' hidden selected> Escolha um cadastro </option>");
                                        while(consulta.next()){
                                            out.println("<option value='" + consulta.getString("nome") + "'>" + consulta.getString("nome") + "</option>");
                                        }					
                                    %>
                                </select>
                            </div>                           
                    </div>
                    <div class="col-2">
                        <button class='btn btn-outline-info' type='submit'>Alterar</button>
                    </div>
                        </form>
                </div> --%>
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
