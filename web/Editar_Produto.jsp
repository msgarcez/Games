<%-- 
    Document   : Editar_Produto
    Created on : 14/06/2019, 10:23:15
    Author     : mathe
--%>

<%@page import="model.CategoriaBean"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="model.UsuarioBean"%>
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
                    <li><a href="Alterar_Produto.jsp">Voltar</a></li>
                    <%
                        if (session.getAttribute("usuario") != null) {
                            UsuarioBean usuario = new UsuarioBean();
                            usuario = (UsuarioBean) session.getAttribute("usuario");
                    %>

                        <%
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
                        ProdutoDAO pdao = new ProdutoDAO();
                        ProdutoBean pbean = (ProdutoBean) session.getAttribute("produto");
                        List<ProdutoBean> produto = pdao.selecionaProdutoId(pbean.getId());
                        for (ProdutoBean pr : produto) {
                    %>
                    <center><h4 class="light-blue-text">Altere Seu Produto</h4></center>
                    <div class="col s12 m4">
                        <div class="icon-block">
                            <img src="img/<%=pr.getImg()%>" width="300" height="300">
                        </div>
                    </div>
                    <div class="col s12 m4">
                        <form method="post" action="ProdutoServlet?acao=editar&id=<%=pr.getId()%>">
                            <div class="row">
                                <div class="input-field col s12">
                                    <input name="nome" type="text" class="validate" value="<%=pr.getNome()%>">
                                    <label for="nome">Nome: </label>
                                </div>
                                <div class="input-field col s12">
                                    <input name="preco" type="text" class="validate" value="<%=pr.getPreco()%>">
                                    <label for="preco">Preço: </label>
                                </div>

                                <div class="input-field col s12">
                                    <select name="categoria">
                                        <option value="<%=pr.getId_categoria()%>" disabled selected><%=pr.getNome_categoria()%></option>
                                        <%
                                            CategoriaDAO cdao = new CategoriaDAO();
                                            List<CategoriaBean> categorias = cdao.listarCategoriaCombo();
                                            for (CategoriaBean categoria : categorias) {
                                        %>
                                        <option value="<%=categoria.getId()%>"><%=categoria.getNome()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>

                                <div class="input-field col s12">
                                    <input name="especificacao" type="text" class="validate" value="<%=pr.getEspecificacao()%>">
                                    <label for="especificacao">Especificação </label>
                                </div>
                                <div class="input-field col s12">
                                    <input name="estoque" type="number" class="validate" value="<%=pr.getEstoque()%>">
                                    <label for="estoque">Estoque: </label>
                                </div>
                                <div class="icon-block">
                                </div>
                                <%
                                    if (session.getAttribute("usuario") == null) {
                                %>
                                <div class="buttons-set form-buttons">
                                    <a class="waves-effect light-blue btn" href="index.jsp"><small>&laquo; </small>Voltar</a>
                                    <a class="waves-effect light-blue btn" href="Logar.jsp">Add Carrinho</a>
                                </div>
                                <%
                                } else {
                                %>
                                <div class="buttons-set form-buttons">
                                    <button class="waves-effect light-blue btn button" type="submit" title="Alterar Produto"><span><span>Alterar Produto</span></span></button>
                                </div>
                                <%
                                    }
                                %>
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
        <script>
            M.AutoInit();
        </script>
    </body>
</html>