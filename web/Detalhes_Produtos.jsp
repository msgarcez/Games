<%-- 
    Document   : Detalhes_Produtos
    Created on : 08/06/2019, 17:12:45
    Author     : danie
--%>

<%@page import="java.util.List"%>
<%@page import="model.ProdutoBean"%>
<%@page import="dao.ProdutoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
        <title>Center Games</title>
        <!-- CSS  -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet"/>
        <link href="css/materialize.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="js/init.js" type="text/javascript"></script>
        <script src="js/materialize.js" type="text/javascript"></script>
    </head>
    <body>
        <nav class="light-blue lighten-1" role="navigation">
            <div class="nav-wrapper container"><a href="index.jsp">Bem Vindo</a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="index.jsp">Voltar</a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="section">
                <!--   Icon Section   -->
                <div class="row">
                    <%
                        ProdutoDAO pdao = new ProdutoDAO();
                        ProdutoBean pbean = (ProdutoBean) session.getAttribute("produto");
                        List<ProdutoBean> produto = pdao.selecionaProdutoId(pbean.getId());
                        for (ProdutoBean pr : produto) {
                    %>
                    <center><h4 class="light-blue-text">Descrição do Produto</h4></center>
                    <div class="col s12 m4">
                        <div class="icon-block">
                            <img src="img/<%=pr.getImg()%>" width="300" height="300">
                        </div>
                    </div>
                    <div class="col s12 m4">
                        <form method="post" class="col s12 m4" action="CategoriaServlet?acao=adicionar_carrinho&id=<%=pr.getId()%>">
                            <div class="row">

                                <h3><%=pr.getNome()%></h3>
                                <div class="input-field col s12">
                                    <input name="nome" type="text" class="validate" value="<%=pr.getNome()%>">
                                    <label for="nome">Nome da Categoria</label>
                                </div>

                                <div class="icon-block">
                                </div>
                                <div class="buttons-set form-buttons">
                                    <a class="waves-effect light-blue btn" href="index.jsp"><small>&laquo; </small>Voltar</a>
                                    <button class="waves-effect light-blue btn button" type="submit" title="Cadastrar"><span><span>Cadastrar</span></span></button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div><br><br>
        </div>
        <script>
            var dropdowns = document.querySelectorAll('.dropdown-trigger')
            for (var i = 0; i < dropdowns.length; i++) {
                M.Dropdown.init(dropdowns[i]);
            }
            var collapsibles = document.querySelectorAll('.collapsible')
            for (var i = 0; i < collapsibles.length; i++) {
                M.Collapsible.init(collapsibles[i]);
            }
        </script>
    </body>
</html>
