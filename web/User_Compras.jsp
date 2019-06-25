<%-- 
    Document   : User_Compras
    Created on : 25/06/2019, 14:32:09
    Author     : danie
--%>

<%@page import="java.util.List"%>
<%@page import="model.UsuarioBean"%>
<%@page import="dao.UsuarioDAO"%>
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
                    <%
                        UsuarioDAO udao = new UsuarioDAO();
                        List<UsuarioBean> usuarios = udao.usuariosSemCompras();
                        for (UsuarioBean usuario : usuarios) {%>
                    <div class="col s3">
                        <div class="card z-depth-3">
                            <form method="post" action="ProdutoServlet?acao=verProduto&id=<%=usuario.getId()%>">
                                <div class="card-content">
                                    <div class="divider"></div>
                                    <h6 class="black-text">Id: <%=usuario.getId()%></h6>
                                    <h6 class="black-text">Nome: <%=usuario.getNome()%></h6>
                                    <small class="black-text">Email: <%=usuario.getEmail()%></small>
                                </div>
                            </form>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div><br><br>
        </div>
    </body>
</html>
