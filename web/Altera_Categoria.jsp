<%-- 
    Document   : Altera_Categoria
    Created on : 06/06/2019, 21:11:28
    Author     : danie
--%>

<%@page import="model.CategoriaBean"%>
<%@page import="dao.CategoriaDAO"%>
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
                        <div class="icon-block">
                        </div>
                    </div>
                    <form method="post" class="col s12 m4" action="CategoriaServlet?acao=cadastrar">
                        <h4>Alterar Categoria:</h4>
                        <div class="row">
                            <div class="icon-block">
                            </div>
                            <table align="center" border="1px" width="80%">
                                <tr>
                                    <th>Id</th>
                                    <th>Nome</th>
                                </tr>
                                <%
                                    CategoriaDAO cdao = new CategoriaDAO();
                                    List<CategoriaBean> categorias = cdao.listarCategoriaCombo();
                                    for (CategoriaBean categoria : categorias){
                                %>
                                <tr>
                                    <th><%=categoria.getId()%></th>
                                    <th><a href="#"><%=categoria.getNome()%></a></th>
                                </tr>
                                <%
                                    }
                                %>
                            </table>
                            <!--<div class="buttons-set form-buttons">
                                <a class="waves-effect light-blue btn" href="administrativa.jsp"><small>&laquo; </small>Voltar</a>
                                <button class="waves-effect light-blue btn button" type="submit" title="Cadastrar"><span><span>Cadastrar</span></span></button>
                            </div>-->
                        </div>
                    </form>
                </div>
            </div><br><br>
        </div>
    </body>
</html>
