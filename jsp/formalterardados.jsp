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
					<%@include file="conectar.jsp" %>

					<% 
						String nome = "";
						String fone = "";
						String email = "";
						String dataNasc = "";
						String foto = "";
						String amigo = request.getParameter("selectAlterar");
						PreparedStatement statement = conexao.prepareStatement("select * from amigos where nome=?");
						statement.setString(1, amigo); 
						ResultSet verificar = statement.executeQuery(); 
						if(verificar.next()){ 
							nome = verificar.getString("nome");
							fone = verificar.getString("telefone");
							email = verificar.getString("email");
							dataNasc = verificar.getString("dataNasc");
						}
						statement.close(); 

						PreparedStatement statement2 = conexao.prepareStatement("select * from login where nome=?");
						statement2.setString(1, amigo);
						ResultSet resultado = statement2.executeQuery(); 
						if(resultado.next()){ 
							foto = resultado.getString("foto");
						}
					%>
					 <div class="card">
                        <div class="card-header bg-info">
                            <h3 class="card-title text-center text-white">Cadastro de Amigo</h3>
                        </div>
                        <form method="POST">
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="nome">Nome:</label>
                                    <input type="text" class="form-control" name="nome" value="<%= nome %>" id="nome" placeholder="Digite seu nome" required>
                                </div>
                                <div class="form-group">
                                    <label for="tel">Telefone</label>
                                    <input type="text" class="form-control" name="tel" value="<%= fone %>" id="tel" placeholder="Digite seu telefone" required>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <input type="email" class="form-control" name="email" value="<%= email %>" id="email" placeholder="Digite seu e-mail" required>
                                </div>
                                <div class="form-group">
                                    <label for="data">Data de Nascimento:</label>
                                    <input type="date" class="form-control" name="data" value="<%= dataNasc %>" id="data" placeholder="Entre com sua data" required>
                                </div>
								<div class="form-group">
                                    <label for="foto">Nome Foto:</label>
                                    <input type="text" class="form-control" name="foto" value="<%= foto %>" id="data" placeholder="Entre com sua data" required>
                                </div>
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-success btn-block">Alterar</button>
                            </div>
                        </form>
                    </div>
					<%
						nome = request.getParameter("nome") != null ? request.getParameter("nome").trim() : "";
						
						if (request.getMethod().equals("POST") && nome.length() > 0) {
							nome = request.getParameter("nome");
							fone = request.getParameter("tel");
							email = request.getParameter("email");
							dataNasc = request.getParameter("data");
	
							PreparedStatement amigos = conexao.prepareStatement("update amigos set telefone=?, email=?, dataNasc=? where nome=?");
							amigos.setString(1,fone);
							amigos.setString(2,email);
							amigos.setString(3,dataNasc);
							amigos.setString(4,nome);
							amigos.executeUpdate();
							amigos.close();

							//atualiza nome da foto
							foto = request.getParameter("foto");
							PreparedStatement login = conexao.prepareStatement("update login set foto=? where nome=?");
							login.setString(1, foto);
							login.setString(2, nome);
							login.executeUpdate();
							login.close();
							session.setAttribute("foto", foto);
							out.println("<br><br>");
							out.println("<div class='alert alert-success text-center'><i class='fa fa-check-circle'></i> Contato editado com sucesso!</div>");
							
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
		<%-- Jquery Mask --%>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.16/jquery.mask.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                 $('#tel').mask('(00)00000-0000', {placeholder: "(00)00000-0000"});
            });
        </script>
  </footer>
</html>
