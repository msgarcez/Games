<%-- 
    Document   : carrinho
    Created on : 05/06/2019, 19:34:30
    Author     : danie
--%>

<%@page import="model.ProdutoBean"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="model.UsuarioBean"%>
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
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="js/init.js" type="text/javascript"></script>
        <script src="js/materialize.js" type="text/javascript"></script>
    </head>
    <body>
        <nav class="light-blue lighten-1" role="navigation">
            <div class="nav-wrapper container"><a href="index.jsp">Bem Vindo</a>
                <ul class="right hide-on-med-and-down">
                    <%
                        if (session.getAttribute("usuario") != null) {
                            UsuarioBean usuario = new UsuarioBean();
                            usuario = (UsuarioBean) session.getAttribute("usuario");
                    %>
                    <li><a href="Altera_User.jsp"><%=usuario.getNome_usuario()%></a></li>
                    <li><a href="index.jsp">Voltar</a></li>
                        <%
                            if (usuario.getAdmin()) {

                        %>
                    <li><a href="administrativa.jsp">Área administrativa</a></li>
                        <%                                } else {
                                }
                            }
                        %>
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="section">
                <!--   Icon Section   -->
                <div class="row">
                    <%
                        if (session.getAttribute("carrinho") != null) {
                    %>
                    <center><h4 class="light-blue-text">Carrinho de Compras</h4></center>
                        <%
                            List<ProdutoBean> produto = (List<ProdutoBean>) session.getAttribute("carrinho");
                            for (ProdutoBean pr : produto) {
                        %>
                    <div class="col s3">
                        <div class="card z-depth-3">
                            <form method="post" action="VendaServlet?acao=adicionar_venda&id=<%=pr.getId()%>&quantidade=<%=pr.getQuantidade()%>">
                                <div class="card-content">
                                    <div class="divider"></div>
                                    <img src="img/<%=pr.getImg()%>" width="200" height="200" />
                                    <h6 class="black-text"><%=pr.getNome()%></h6>
                                    <h6 class="black-text">Preço: <%=(pr.getPreco() * pr.getQuantidade())%></h6>
                                    <h6 class="black-text">Plataforma: <%=pr.getNome_categoria()%></h6>
                                    <h6 class="black-text">Categoria: <%=pr.getEspecificacao()%></h6>
                                    <small class="black-text">Estoque: <%=pr.getEstoque()%></small>
                                </div>
                                <div class="buttons-set form-buttons">
                                    <button class="waves-effect light-blue btn button" type="submit" title="Add Carrinho"><span><span>Comprar</span></span></button>
                                    <a href="ProdutoServlet?acao=remover_carrinho&id=<%=pr.getId()%>" class="waves-effect light-blue btn button">Remover</a>
                                </div>  
                            </form>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <div class="col s12 m4">
                        <div class="icon-block">
                        </div>
                    </div>
                    <div class="col s12 m4">
                        <div class="card">
                            <div class="card-image center">
                                <img src="img_icons/cart.png">
                            </div>
                            <div class="card-content center">
                                <p>Carrinho Vazio.</p>
                            </div>
                            <div class="card-action center">
                                <a class="light-blue-text" href="index.jsp">Voltar</a>
                            </div>
                        </div>
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