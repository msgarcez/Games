<%-- 
    Document   : Ver_Cartao
    Created on : 20/06/2019, 15:33:06
    Author     : danie
--%>

<%@page import="model.UsuarioBean"%>
<%@page import="java.util.List"%>
<%@page import="model.CartaoCreditoBean"%>
<%@page import="dao.CartaoDAO"%>
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
        <link href="css/style.css" type="text/css" rel="stylesheet"/>
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
                    <center><h4 class="light-blue-text">Cartão/Cartões de Crédito(s)</h4></center>
                    <%
                        CartaoDAO cdao = new CartaoDAO();
                        UsuarioBean ubean = (UsuarioBean) session.getAttribute("usuario");
                        List<CartaoCreditoBean> cartao = cdao.selecionaCartaoId(ubean.getId());
                        for (CartaoCreditoBean cr : cartao) {
                    %>
                    <div class="col s12 m4">
                        <div class="card z-depth-3">
                            <form action="CartaoServlet?acao=editar_cartao&id=<%=cr.getId()%>">
                                <div class="card-content">
                                    <div class="divider"></div>
                                    <h6 class="black-text">Nº do Cartão: <%=cr.getNumero()%></h6>
                                    <h6 class="black-text">Data Validade: <%= cr.getData()%></h6>
                                    <h6 class="black-text">Nome Cartão: <%=cr.getNome_cartao()%></h6>
                                    <h6 class="black-text">Bandeira: <%=cr.getBandeira()%></h6>
                                    <h6 class="black-text">Vezes: <%=cr.getVezes()%></h6>
                                    <h6 class="black-text">CVV: <%=cr.getCvv()%></h6>
                                </div>
                                <div class="buttons-set form-buttons">
                                    <button class="waves-effect light-blue btn button" type="submit" title="Editar Cartão"><span><span>Editar</span></span></button>
                                    <a href="CartaoServlet?acao=remover_cartao&id=<%=cr.getId()%>" class="waves-effect light-blue btn button">Remover</a>
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
