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
    <link rel="stylesheet" href="css/cadastro.css">
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
                    <div class="card">
                        <div class="card-header bg-primary">
                            <h3 class="card-title text-center text-white">Agendamento</h3>
                        </div>
                        <form id="formCadastro" method="POST">
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="nome">Nome Local</label>
                                    <input type="text" class="form-control" name="nome" id="nome" placeholder="Informe o nome do local" required>
                                </div>
                                <div class="form-group">
                                    <label for="tipo">Tipo Local</label>
                                    <select class="form-control" id="tipo">
                                        <option value="salao" selected>Salao</option>
                                        <option value="auditorio">Auditorio</option>
                                    </select>
                                  </div>
                                <div class="form-group">
                                    <label for="data">Data</label>
                                    <input type="date" class="form-control"  name="data" id="data" placeholder="Informe a data" required>
                                </div>
                                <div class="form-group">
                                    <label for="periodo">Periodo</label><br>
                                    <select class="form-control" id="periodo" name='periodo'>
                                      <option value="manha" selected>Manha</option>
                                      <option value="tarde">Tarde</option>
                                      <option value="noite">Noite</option>
                                    </select>
                                </div>
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-primary">Enviar</button>
                            </div>
                        </form>
                    </div>
                </div>
				<div class="col-2"></div>
			</div>
        <br><br>
        <%@ page import="java.sql.*" %>
		    <%
              Object obj_user = session.getAttribute("usuario");
              String user = obj_user.toString();

              Class.forName("com.mysql.jdbc.Driver");
              Connection conexao = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/natureza_viva","root","");
              PreparedStatement statement1=conexao.prepareStatement("select id from usuarios where usuario = ?");
              statement1.setString(1,user);
              ResultSet listar=statement1.executeQuery();

              while(listar.next()){
                String user_id = listar.getString("id");
                PreparedStatement statement2=conexao.prepareStatement("select * from agendamentos where fk_responsavel=?");
                statement2.setString(1,user_id);
                ResultSet listar2=statement2.executeQuery();
                int reg=1;

                

                while(listar2.next()){
                  out.println("<div class='row'>");
		              out.println("<div class='col-2'></div>");
                  out.println("<div class='col-8'>");
                  out.println("<div class='card'>");
                  out.println("<div class='card-body'>");
                  out.println("<b>AGENDAMENTO "+reg+":</b>");
                  out.println("<b><br>Codigo: </b>");
                  out.println(listar2.getString("id"));
                  out.println("<b><br>Nome Local: </b>");
                  out.println(listar2.getString("nome_local"));
                  out.println("<b><br>Tipo: </b>");
                  out.println(listar2.getString("tipo"));
                  out.println("<b><br>Data: </b>");
                  out.println(listar2.getString("data"));
                  out.println("<b><br>Periodo: </b>");
                  out.println(listar2.getString("periodo"));
                  out.println("<b><br>Status: </b>");
                  out.println(listar2.getString("status"));
                  out.println("<b><br>Codigo Usuario Responsavel: </b>");
                  out.println(listar2.getString("fk_responsavel")+"<p>"+"<br>");
                  out.println("</div>");
                  out.println("</div>");
                  reg++;
                  out.println("</div>");
                  out.println("<div class='col-2'></div>");
                  out.println("</div>");
                }
              }
            %>
            <div class="row">
                <div class="col-1"></div>
                <div class="col-8 pull-left">
                    <br><br><br>
                    <a class="btn btn-danger pull-left" href="home.jsp"> <!-- cadastrar.html -->
                        <i class="fa fa-arrow-circle-left"></i> Voltar
                    </a>
                </div>
            </div>
		</div>
    </body>
  <footer>
		<!-- jQuery and Bootstrap Bundle (includes Popper) -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <!-- Custom js -->
		<script src="js/cadastrar.js"></script>
  </footer>
</html>
<%@ page import="java.sql.*" %>
<%
   if (request.getMethod().equals("POST")) {
    Object obj_user2 = session.getAttribute("usuario");
    String user2 = obj_user2.toString();
    String nome=request.getParameter("nome");
    String tipo=request.getParameter("tipo");
    String data=request.getParameter("data");
    String periodo=request.getParameter("periodo");
    String status="pendente";

    Class.forName("com.mysql.jdbc.Driver");
    PreparedStatement statement3=conexao.prepareStatement("select id from usuarios where usuario = ?");
    statement3.setString(1,user2);
    ResultSet listar3=statement3.executeQuery();

    while(listar3.next()){
      String fk_responsavel = listar3.getString("id");
      PreparedStatement statement4=conexao.prepareStatement("select * from agendamentos where status != ? and fk_responsavel = ?");
      statement4.setString(1,"usado");
      statement4.setString(2,fk_responsavel);
      ResultSet listar4=statement4.executeQuery();

      if(listar4.next()){
        out.println("<div class='row'>"
                  + "<div class='col-2'></div>"
                  + "<div class='col-8'>"
                  + "<div class='alert alert-danger'>Nao e possivel realizar o agendamento. Ha outro agendamento em aberto.</div>"
                  + "</div>"
                  + "<div class='col-2'></div>"
                  + "</div>"
        );
      } else {
        PreparedStatement statement5=conexao.prepareStatement("insert into agendamentos (nome_local, tipo, data, periodo, status, fk_responsavel) values (?, ?, ?, ?, ?, ?)");
        statement5.setString(1,nome);
        statement5.setString(2,tipo);
        statement5.setString(3,data);
        statement5.setString(4,periodo);
        statement5.setString(5,status);
        statement5.setString(6,fk_responsavel);
        statement5.execute();
        response.setIntHeader("Refresh", 2);
      }      
    }
   }
%>