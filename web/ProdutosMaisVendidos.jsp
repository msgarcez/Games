<%-- 
    Document   : ProdutosMaisVendidos
    Created on : 25/06/2019, 14:31:37
    Author     : danie
--%>

<%@page import="model.ItemVendaBean"%>
<%@page import="dao.ItemVendaDAO"%>
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
                    <%
                        ItemVendaDAO vdao = new ItemVendaDAO();
                        List<ItemVendaBean> itemvenda = vdao.produtosMaisVendidos();
                        for (ItemVendaBean venda : itemvenda) {%>
                    <div class="col s3">
                        <div class="card z-depth-3">
                            <form method="post" action="">
                                <div class="card-content">
                                    <div class="divider"></div>
                                    <h6 class="black-text">Id: <%=venda.getId_produto()%></h6>
                                    <h6 class="black-text">Quantidade: <%=venda.getQuantidade()%></h6>
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
