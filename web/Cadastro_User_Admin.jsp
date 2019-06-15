<%-- 
    Document   : Cadastro_User_Admin
    Created on : 14/06/2019, 21:11:21
    Author     : mathe
--%>

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
                    <li><a href="administrativa.jsp">Voltar</a></li>
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
                    <form method="post" class="col s12 m4" action="UsuarioServlet?acao=inserir_admin">
                        <h4 class="light-blue-text">Cadastro Cliente:</h4>
                        <div class="row">
                            <div class="input-field col s12">
                                <input name="nome_usuario" type="text" class="validate">
                                <label for="nome_usuario">Nome do Usuário</label>
                            </div>
                            <div class="input-field col s12">
                                <input name="senha" type="password" class="validate">
                                <label for="senha">Senha</label>
                            </div>
                            <div class="input-field col s12">
                                <input name="nome" type="text" class="validate">
                                <label for="nome">Nome</label>
                            </div>
                            <div class="input-field col s12">
                                <input name="email" type="email" class="validate">
                                <label for="email">E-mail</label>
                            </div>
                            <div class="switch">
                                <label>
                                    <input name="admin" type="checkbox" value="1">
                                    <span class="lever"></span>
                                    Administrador
                                </label>
                            </div>
                            <br>
                            <div class="buttons-set form-buttons">
                                <button class="waves-effect light-blue btn button" type="submit" title="Cadastrar"><span><span>Cadastrar</span></span></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div><br><br>
        </div>
        <script>
            $(document).ready(function () {
                $('input#input_text, textarea#textarea2').characterCounter();
            });
        </script>
    </body>
</html>
