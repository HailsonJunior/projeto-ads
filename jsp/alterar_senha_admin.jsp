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
					<%
						String senha = request.getParameter("senha");
						String senha2 = request.getParameter("senhaConfirme");

						if(!senha.equals(senha2)){
							out.println("<div class='alert alert-danger'>As senhas sao diferentes!</div>");
						} else {
							if(senha.equals("123456")){
							  out.println("<div class='alert alert-danger'>A senha deve ser diferente da anterior!</div>");
							} else{
								try {
								  String usuario = "admin";
								  Class.forName("com.mysql.jdbc.Driver");
								  Connection conexao = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/natureza_viva","root","");
                                  PreparedStatement admin = conexao.prepareStatement("select * from usuarios where usuario like ?");
                                  admin.setString(1, "admin");
                                  ResultSet resultado = admin.executeQuery();
                                  if(!resultado.next()){
								    out.println("<div class='alert alert-danger'>Usuário admin não cadastrado no banco!</div>");
								  }
								} catch (ClassNotFoundException erroClass){
								    out.println("<div class='alert alert-danger'><b><i class='fa fa-times-circle'></i> Class Driver nao foi localizado! <br>Erro</b>: " + erroClass + "</div>");
							      } catch (SQLException e){
								      if (e.getSQLState().equals("23000")){
								      	out.println("<div class='alert alert-danger text-center'><i class='fa fa-times-circle'></i> Falha ao tentar alterar a senha!</div>");
								      } else {
								      	  out.println("<div class='alert alert-danger text-center'><b><i class='fa fa-times-circle'></i> Falha na conexao ao banco de dados!Erro</b>: " + e + "</div>");
								      }
							      }

								try{
								  Class.forName("com.mysql.jdbc.Driver");
								  Connection conexao = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/natureza_viva","root","");
								  PreparedStatement inserir = conexao.prepareStatement("update usuarios set senha = ? where usuario = 'admin'");
								  inserir.setString(1, senha); 
								  inserir.execute();
								  out.println("<div class='alert alert-success text-center'><i class='fa fa-check-circle'></i> Senha alterada com sucesso!</div>");
								  inserir.close();		
							    } catch (ClassNotFoundException erroClass){
								    out.println("<div class='alert alert-danger'><b><i class='fa fa-times-circle'></i> Class Driver nao foi localizado! <br>Erro</b>: " + erroClass + "</div>");
							      } catch (SQLException e){
								      if (e.getSQLState().equals("23000")){
								      	out.println("<div class='alert alert-danger text-center'><i class='fa fa-times-circle'></i> Falha ao tentar alterar a senha!</div>");
								      } else {
								      	  out.println("<div class='alert alert-danger text-center'><b><i class='fa fa-times-circle'></i> Falha na conexao ao banco de dados!Erro</b>: " + e + "</div>");
								        }
							        }	
							  }
						}						
					%>
					<br>
					<a class="btn btn-danger pull-left" href="./form_alterar_senha.jsp"> <!-- cadastrar.html -->
                        <i class="fa fa-arrow-circle-left"></i> Voltar
                    </a>
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