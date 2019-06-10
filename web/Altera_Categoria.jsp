<%-- 
    Document   : Altera_Categoria
    Created on : 06/06/2019, 21:11:28
    Author     : danie
--%>

<%@page import="model.CategoriaBean"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="controller.CategoriaServlet"%>
<%@page import="java.util.List"%>
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
                    <li><a href="Logar.jsp">Login</a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="section">
                <!--   Icon Section   -->
                <div class="row">
                    <div class="col s12 m4">
                    </div>
                    <div class="col s12 m4">
                        <ul class="collapsible">
                            <li>
                                <div class="collapsible-header light-blue white-text">Selecione uma Categoria</div>
                                <%
                                    CategoriaDAO cdao = new CategoriaDAO();
                                    List<CategoriaBean> categorias = cdao.listarCategoriaCombo();
                                    for (CategoriaBean categoria : categorias) {
                                %>
                                <div class="collapsible-body light-blue lighten-5 light-blue-text">
                                    <a href="CategoriaServlet?acao=editar&id=<%=categoria.getId()%>" class="light-blue-text">Id: <%=categoria.getId()%><br> Nome: <%=categoria.getNome()%></a>
                                </div>
                                <%
                                    }
                                %>
                            </li>
                        </ul>
                            <a class="waves-effect light-blue btn" href="administrativa.jsp"><small>&laquo; </small>Voltar</a>
                        <br><br>
                    </div>
                </div><br><br>
            </div>
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
