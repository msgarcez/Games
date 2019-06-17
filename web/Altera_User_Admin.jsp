<%-- 
    Document   : Altera_User_Admin
    Created on : 17/06/2019, 16:24:08
    Author     : mathe
--%>

<%@page import="model.UsuarioBean"%>
<%@page import="dao.UsuarioDAO"%>
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
                    <li><a href="administrativa.jsp">Voltar</a></li>
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
                                <div class="collapsible-header light-blue white-text">Selecione um Usuario</div>
                                <%
                                    UsuarioDAO udao = new UsuarioDAO();
                                    List<UsuarioBean> usuarios = udao.listarUsuarioCombo();
                                    for (UsuarioBean usuario : usuarios) {
                                %>
                                <div class="collapsible-body light-blue lighten-5 light-blue-text">
                                    <a href="UsuarioServlet?acao=editar&id=<%=usuario.getId()%>" class="light-blue-text">Id: <%=usuario.getId()%><br> Nome: <%=usuario.getNome()%></a>
                                </div>
                                <%
                                    }
                                %>
                            </li>
                        </ul>
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
