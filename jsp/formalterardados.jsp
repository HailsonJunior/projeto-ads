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
                    <%@page import="java.sql.*" %>
					<%@include file="conectar.jsp"%>
					<%
						String id = "";
						String usuario = "";
						String email = "";
						String senha = request.getParameter("senha");
						String senha2 = request.getParameter("senhaConfirme");

						if(!senha.equals(senha2)){
							out.println("<div class='alert alert-danger'>As senhas sao diferentes!</div>");
							return;
						}

						usuario = request.getParameter("usuario") != null ? request.getParameter("usuario").trim() : "";
						
						if (request.getMethod().equals("POST") && usuario.length() > 0) {
							id = (String) session.getAttribute("id_usuario");
							usuario = request.getParameter("usuario");
							email = request.getParameter("email");				
	
							PreparedStatement amigos = conexao.prepareStatement("update usuarios set usuario = ?, email = ?, senha = ? where id = ?");
							amigos.setString(1, usuario);
							amigos.setString(2, email);
							amigos.setString(3, senha);
							amigos.setString(4, id);
							amigos.executeUpdate();
							amigos.close();

							//atualiza info da sessao
							session.setAttribute("usuario", usuario);
							session.setAttribute("email", email);
							out.println("<br><br>");
							out.println("<div class='alert alert-success text-center'><i class='fa fa-check-circle'></i> Dados alterados com sucesso!</div>");
						} else {
							out.println("<br><br>");
							out.println("<div class='alert alert-danger text-center'><i class='fa fa-times-circle'></i> Erro ao atualizar! Tente Novamente.</div>");
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
