<%-- 
    Document   : Edita_Categoria
    Created on : 10/06/2019, 16:28:46
    Author     : danie
--%>

<%@page import="model.CategoriaBean"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
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
                    <li><a href="Altera_Categoria.jsp">Voltar</a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="section">
                <!--   Icon Section   -->
                <div class="row">
                    <div class="col s12 m4">
                        <div class="icon-block">
                        </div>
                    </div>
                    <%
                        CategoriaDAO cdao = new CategoriaDAO();
                        CategoriaBean cbean = (CategoriaBean) session.getAttribute("categoria");
                        List<CategoriaBean> categorias = cdao.selecionaCategoriaId(cbean.getId());
                        for (CategoriaBean categoria : categorias){
                    %>
                    <form method="post" class="col s12 m4" action="CategoriaServlet?acao=alterar_categoria&id=<%=categoria.getId()%>">
                        <h4>Alterando Categoria de Id:<%=categoria.getId()%></h4>
                        <div class="row">
                            <div class="input-field col s12">
                                <input name="nome" type="text" class="validate" value="<%=categoria.getNome()%>">
                                <label for="nome">Nome da Categoria</label>
                            </div>

                            <div class="icon-block">
                            </div>
                            <div class="buttons-set form-buttons">
                                <a class="waves-effect light-blue btn" href="administrativa.jsp"><small>&laquo; </small>Voltar</a>
                                <button class="waves-effect light-blue btn button" type="submit" title="Cadastrar"><span><span>Cadastrar</span></span></button>
                            </div>
                        </div>
                    </form>
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
