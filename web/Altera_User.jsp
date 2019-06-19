<%-- 
    Document   : Altera_User
    Created on : 05/06/2019, 20:19:53
    Author     : danie
--%>

<%@page import="dao.EnderecoDAO"%>
<%@page import="dao.CartaoDAO"%>
<%@page import="model.CartaoCreditoBean"%>
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
                    <li><a href="index.jsp">Voltar</a></li>
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
                        UsuarioDAO udao = new UsuarioDAO();
                        CartaoCreditoBean ccbean = new CartaoCreditoBean();
                        CartaoDAO cdao = new CartaoDAO();
                        EnderecoDAO edao = new EnderecoDAO();
                        int end = edao.existe(Integer.parseInt(String.valueOf(session.getAttribute("id_usuario"))));
                        int cat = cdao.existe(Integer.parseInt(String.valueOf(session.getAttribute("id_usuario"))));
                        UsuarioBean cbean = (UsuarioBean) session.getAttribute("usuario");
                        List<UsuarioBean> usuarios = udao.consultarUsuario_Nome(cbean.getId());
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
                                <%
                                    if(!cbean.getAdmin()){
                                %>
                                <button class="waves-effect light-blue btn button" type="submit" title="Alterar"><span><span>Alterar Dados</span></span></button><br><br>
                                <%
                                    }
                                %>
                                <%
                                    if(end > 0){
                                %>
                                <a class="waves-effect light-blue btn" href="Cadastro_Endereco.jsp">Ver Endereço</a><br><br>
                                <%
                                    }else{
                                %>
                                <a class="waves-effect light-blue btn" href="Cadastro_Endereco.jsp">Cadastro Endereço</a><br><br>
                                <%
                                    }
                                %>
                                <%
                                    if(cat > 0){
                                %>
                                <a class="waves-effect light-blue btn" href="index.jsp">Ver Cartão</a>
                                <%
                                    }else{
                                %>
                                <a class="waves-effect light-blue btn" href="Cadastro_Cartao.jsp">Cadastro Cartão</a>
                                <%
                                    }
                                %>
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
