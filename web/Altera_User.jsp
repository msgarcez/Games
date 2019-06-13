<%-- 
    Document   : Altera_User
    Created on : 05/06/2019, 20:19:53
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
        <link href="css/style.css" type="text/css" rel="stylesheet"/>
        <script src="js/materialize.js" type="text/javascript"></script>
    </head>
    <body>
        <nav class="light-blue lighten-1" role="navigation">
            <div class="nav-wrapper container"><a href="index.jsp">Bem Vindo</a>
                <ul class="right hide-on-med-and-down">
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
                        UsuarioDAO cdao = new UsuarioDAO();
                        UsuarioBean cbean = (UsuarioBean) session.getAttribute("usuario");
                        List<UsuarioBean> usuarios = cdao.consultarUsuario_Nome(cbean.getId());
                        for (UsuarioBean user : usuarios) {
                    %>
                    <form method="post" class="col s12 m4" action="CategoriaServlet?acao=alterar_categoria&id=<%=user.getId()%>">
                        <h4 class="light-blue-text">Informações do Usuário: <%=user.getNome()%></h4>
                        <div class="row">
                            <div class="input-field col s12">
                                <input name="nome_usuario" type="text" class="validate" disabled value="<%=user.getNome_usuario()%>">
                                <label for="nome_usuario">Nome do Usuário</label>
                            </div>
                            <div class="input-field col s12">
                                <input name="nome" type="text" class="validate" disabled value="<%=user.getNome()%>">
                                <label for="nome">Nome</label>
                            </div>
                            <div class="input-field col s12">
                                <input name="email" type="text" class="validate" disabled value="<%=user.getEmail()%>">
                                <label for="email">Email</label>
                            </div>
                            <div class="icon-block">
                            </div>
                            <div class="buttons-set form-buttons">
                                <a class="waves-effect light-blue btn" href="index.jsp"><small>&laquo; </small>Voltar</a>
                                <button class="waves-effect light-blue btn button" type="submit" title="Alterar"><span><span>Alterar</span></span></button>
                                <a class="waves-effect light-blue btn" href="Cadastro_Cartao.jsp">Cartao Crédito</a>
                                <br><br>
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
