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
                    <br><br><br><br>
                    <%@ page import="java.sql.*" %>
                    <%@include file="conectar.jsp" %>
                    <%
                    int fk_tipo = request.getParameter("fk_tipo");
                    date dataAgenda = request.getParameter("dataAgenda");
                    String hora = request.getParameter("hora");
                    PreparedStatement espaco = conexao.prepareStatement("SELECT * FROM espaço WHERE fk_tipo = ? AND dataAgenda = ? AND hora = ?");
                    espaco.setInt(1, fk_tipo);
                    espaco.setDate(2, dataAgenda);
                    espaco.setString(3, hora);
                    ResultSet resultado = espaco.executeQuery();
                    int count = 0;
                    while(resultado.next()){
                        count++;
                    }
                    if(count>0){
                        out.println("Este espaço já foi cadastrado. Escolha outra data.")
                    } else{
                        try{
                            PreparedStatement inserir = conexao.prepareStatement("insert into espaço (fk_tipo, dataAgenda, hora) values(?,?,?)");
                            inserir.setInt(1, fk_tipo); 
                            inserir.setDate(2, dataAgenda);
                            inserir.setString(3, hora);
                            inserir.execute();
                            out.println("<div class='alert alert-success text-center'><i class='fa fa-check-circle'></i> Espaço cadastrado com sucesso!</div>");
                            inserir.close();
                        }catch (ClassNotFoundException erroClass){
                            out.println("<div class='alert alert-danger'><b>Class Driver nao foi localizado! <br>Erro</b>: " + erroClass + "</div>");
                        }catch (SQLException e){
                            out.println("<div class='alert alert-danger'><b><i class='fa fa-times-circle'></i> Falha na conexao ao banco de dados!Erro</b>: " + e + "</div>");
                        }
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