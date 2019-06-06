<%-- 
    Document   : Cadastro_User
    Created on : 01/06/2019, 18:08:46
    Author     : danie
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
                    <form method="post" class="col s12 m4" action="UsuarioServlet?acao=inserir">
                        <h4>Cadastro Cliente:</h4>
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
                            <div class="buttons-set form-buttons">
                                <p class="waves-effect waves-light btn" class="back-link"><a href="index.jsp"><small>&laquo; </small>Voltar</a></p>
                                <button class="waves-effect waves-light btn" type="button" class="button" title="Voltar"><span><span>Voltar</span></span></button>
                                <button class="waves-effect waves-light btn" type="submit" class="button" title="Cadastrar"><span><span>Cadastrar</span></span></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div><br><br>
        </div>
    </body>

    <script>

        $(document).ready(function () {
            $('input#input_text, textarea#textarea2').characterCounter();
        });

    </script>

</html>
