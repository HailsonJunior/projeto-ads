<style>
  span {
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    outline: 0;
  }
</style>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
  <h5 class="my-0 mr-3 font-weight-normal">
  	<a class="text-dark" href="home.jsp" style="text-decoration: none; cursor: pointer">
      <i class="fa fa-home"></i> Home
  	</a>
  </h5>
  <div class="disableSelection pt-1 mr-md-auto font-weight-normal text-left" style="cursor: pointer; font-family: Times New Roman">
      <span id="aumentar" title="Aumentar Fonte" alt="Aumentar">
        <b>A +</b>
      </span>
      <span id="diminuir" title="Diminuir Fonte" alt="Diminuir">
        <b>A -</b>
      </span>
  </div>
  <%@ page session="true" %>
  <script>
    var isAdmin = parseInt('${sessionScope.admin}');
  </script>
  <nav class="my-2 my-md-0 mr-md-3">
    <a class="p-2 text-dark" href="locais.jsp">Locais</a>
    <%-- Opc Admin --%>
    <span id="admin">
      <a class="p-2 text-dark" href="formcadastro.jsp">Cadastrar Local</a>
      <a class="p-2 text-dark" href="agendamentos.jsp">Agendamentos</a>
      <a class="p-2 text-dark" href="ocorrencias.jsp">Ocorrencias</a>
    </span>
    <%-- Opc User --%>
    <span id="user">
      <a class="p-2 text-dark" href="ocorrencias_user.jsp">Ocorrencias</a>
      <a class="p-2 text-dark" href="agendamentos_user.jsp">Agendamentos</a>
    </span>
    <a class="p-2 text-dark" href="formalterar.jsp">Alterar dados</a>
  </nav>
  <a class="btn btn-danger" href="sair.jsp">
    <i class="fa fa-sign-out"></i> Sair
  </a>
</div>
<!-- jQuery and Bootstrap Bundle (includes Popper) -->
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="../js/menu.js"></script>

<%-- <c:if test="${sessionScope.admin == 1}">
</c:if> --%>