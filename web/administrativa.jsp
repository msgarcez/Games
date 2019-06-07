<%-- 
Document   : administrativa
Created on : 05/06/2019, 18:36:49
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
    <!--produto(cadastrar, alterar produto, excluir produto), usuario(cadastrar,editar,excluir).-->
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
                    </div>
                    <div class="col s12 m4">
                        <ul class="collapsible">
                            <li>
                                <div class="collapsible-header light-blue white-text">
                                    Registro de Categorias
                                </div>
                                <div class="collapsible-body light-blue lighten-5 light-blue-text">
                                    <a href="Cadastro_Categoria.jsp" class="light-blue-text">Cadastrar Categorias</a>
                                </div>
                                <div class="collapsible-body light-blue lighten-5 light-blue-text">
                                    <a href="Altera_Categoria.jsp" class="light-blue-text">Alterar Categorias</a>
                                </div>
                                <div class="collapsible-body light-blue lighten-5 light-blue-text">
                                    <a href="#!" class="light-blue-text">Excluir Categorias</a>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header light-blue white-text">
                                    Registro de Produtos
                                </div>
                                <div class="collapsible-body light-blue lighten-5 light-blue-text">
                                    <a href="#!" class="light-blue-text">Cadastrar Produtos</a>
                                </div>
                                <div class="collapsible-body light-blue lighten-5 light-blue-text">
                                    <a href="#!" class="light-blue-text">Alterar Produtos</a>
                                </div>
                                <div class="collapsible-body light-blue lighten-5 light-blue-text">
                                    <a href="#!" class="light-blue-text">Excluir Produtos</a>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header light-blue white-text">
                                    Registro de Clientes
                                </div>
                                <div class="collapsible-body light-blue lighten-5 light-blue-text">
                                    <a href="#!" class="light-blue-text">Cadastrar Cliente</a>
                                </div>
                                <div class="collapsible-body light-blue lighten-5 light-blue-text">
                                    <a href="#!" class="light-blue-text">Alterar Cliente</a>
                                </div>
                                <div class="collapsible-body light-blue lighten-5 light-blue-text">
                                    <a href="#!" class="light-blue-text">Excluir Cliente</a>
                                </div>
                            </li>
                        </ul>
                    </div>
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
