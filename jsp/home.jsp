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
    <link rel="stylesheet" type="text/css" href="../css/footer.css">
  </head>
  <body>
        <!-- Navbar -->
        <%@include file="menu.jsp"%>
        <!-- Content -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="row">
                        <div class="col-12">
                            <br>
                        </div>
                        <div class="col-lg-2 col-md-4 col-sm">                            
                            <%@ page import="java.sql.*" %>
                            <div class="card text-center">
                                <div class="bg-white rounded shadow-sm py-4">
                                    <img src="../img/profile/among.jpg" alt="imagem perfil" width="100" class="img-fluid rounded-circle mb-3 img-thumbnail shadow-sm">
                                        <h5 class="mb-0"><% out.println(session.getAttribute("usuario")); %></h5>
                                        <span class="small text-muted"><% out.println(session.getAttribute("email")); %></span>
                                        <div class="mt-2">
                                            <p class="card-text">
                                                <a class="btn btn-info" href="formalterar.jsp">Editar Perfil</a>
                                            </p>
                                        </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-10 col-md-8 col-sm">
                            <h2>
                                Titulo
                            </h2>
                            <p>
                                Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
                            </p>
                            <p>
                                <a class="btn btn-primary" href="#">Saber mais</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-2 col-md-4">
                </div>
                <div class="col-4">
                    <h2>
                        Titulo
                    </h2>
                    <p>
                        Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
                    </p>
                    <p>
                        <a class="btn btn-primary" href="#">Saber mais</a>
                    </p>
                </div>
                <div class="col-4">
                    <h2>
                        Titulo
                    </h2>
                    <p>
                        Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
                    </p>
                    <p>
                        <a class="btn btn-primary" href="#">Saber mais</a>
                    </p>
                </div>
            </div>
        </div>
        <br><br><br><br>
        <footer class="container-fluid bg-grey">
            <div class="row">
                <div class="col-12" style="background: #000;" id="footer">
                    <p class="text-center mt-3">
                        <i class="fa fa-copyright" aria-hidden="true"></i> Copyright 2022 Jonas Lima & Hailson Ferreira & Gustavo Xavier - All Right Reserved
                    </p>
                </div>
            </div>
        </footer>		
    </body>
<div>
    <!-- jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</div>
</html>