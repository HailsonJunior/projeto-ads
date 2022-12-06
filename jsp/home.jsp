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
        <!-- Navbar -->
        <%@include file="menu.jsp" %>
        <!-- Content -->
		<div class="container-fluid">
			<div class="row">
				<div class="col-4">
					<br><br><br>
				</div>		
				<div class="col-4">
					<br><br><br><br>
                    <div class="row">
                        <div class="col-lg-4 col-md-2 col-sm-2"></div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <h3>Logado!</h3>
                            <%@ page import="java.sql.*" %>
                            <%
                               /* int vezes;
                                Integer valor = (Integer)(session.getAttribute("vezes"));
                                if(valor == null){
                                    vezes = 1;
                                    session.setAttribute("vezes", new Integer(vezes));
                                }
                                else{
                                    vezes = valor.intValue();
                                    vezes++;
                                    session.setAttribute("vezes", new Integer(vezes));
                                }*/
                            %>
                           <%--  <div class="card text-center" style="width: 18rem;">
                                <img src="../img/among.jpg" class="card-img-top" alt="img_perfil">
                                <div class="card-body">
                                    <h5 class="card-title"><% out.println(session.getAttribute("username")); %></h5>
                                    <p class="card-text">
                                        Esta eh a <b><%= vezes %></b> vez que voce acessa esta pagina.
                                        Seja bem vindo! <b><% out.println(session.getAttribute("nome")); %></b>
                                    </p>
                                </div>
                            </div> --%>
                            <br>
                        </div>
                        <div class="col-4"></div>
                    </div>
				</div>
				<div class="col-4"></div>		
			</div>
		</div>
    </body>
  <footer>
		<!-- jQuery and Bootstrap Bundle (includes Popper) -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
  </footer>
</html>