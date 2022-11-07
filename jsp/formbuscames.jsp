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
                            <form method='POST'  action="buscarmes.jsp">
                                <div class="form-group">
                                    <select name="mes" class="form-control" id="mes" required>
                                         <option value="" hidden selected>Escolha uma opcao</option>                                       
                                         <option value="1">Janeiro</option>                                       
                                         <option value="2">Fevereiro</option>                                       
                                         <option value="3">Marco</option>                                       
                                         <option value="4">Abril</option>                                       
                                         <option value="5">Maio</option>                                    
                                         <option value="6">Junho</option>                                    
                                         <option value="7">Julho</option>                                     
                                         <option value="8">Agosto</option>                                     
                                         <option value="9">Setembro</option>                                     
                                         <option value="10">Outubro</option>                                     
                                         <option value="11">Novembro</option>                                     
                                         <option value="12">Dezembro</option>                                     
                                    </select>
                                </div>                           
                        </div>
                        <div class="col-2">
                            <button class='btn btn-primary' type='submit'>Procurar</button>
                        </div>
                            </form>
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
