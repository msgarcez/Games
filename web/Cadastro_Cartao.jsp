<%-- 
    Document   : Cadastro_Cartao
    Created on : 13/06/2019, 16:18:54
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
                    <form method="post" class="col s12 m4" action="CartaoServlet?acao=inserir">
                        <h4 class="light-blue-text">Cadastro do Cartão</h4>
                        <div class="row">
                            <div class="input-field col s12">
                                <input name="numero" type="tel" id="numero" class="validate" maxlength="19">
                                <label for="numero">Número do Cartão</label>
                            </div>
                            <div class="input-field col s12">
                                <input name="data_validade" type="date" class="validate">
                                <label for="data_validade">Data Validade</label>
                            </div>
                            <div class="input-field col s12">
                                <input name="nome_cartao" type="text" class="validate">
                                <label for="nome_cartao">Nome no Cartão</label>
                            </div>
                            <div class="input-field col s12">
                                <select name="bandeira">
                                    <option value="" disabled selected>Bandeira</option>
                                    <option value="Master">Master</option>
                                    <option value="Visa">Visa</option>
                                    <option value="Banrisul">Banrisul</option>
                                    <option value="Elo">Elo</option>
                                </select>
                            </div>
                            <div class="input-field col s12">
                                <input name="vezes" type="number" class="validate">
                                <label for="vezes">Número de Vezes</label>
                            </div>
                            <div class="input-field col s12">
                                <input name="cvv" type="number" class="validate" maxlength="3">
                                <label for="cvv">CVV</label>
                            </div>
                            <div class="buttons-set form-buttons">
                                <button class="waves-effect light-blue btn button" type="submit" title="Cadastrar"><span><span>Cadastrar</span></span></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div><br><br>
        </div>
        <script type="text/javascript">
            M.AutoInit();
            /* Máscaras ER */
            function mascara(o, f) {
                v_obj = o
                v_fun = f
                setTimeout("execmascara()", 1)
            }
            function execmascara() {
                v_obj.value = v_fun(v_obj.value)
            }
            function mcc(v) {
                v = v.replace(/\D/g, "");
                v = v.replace(/^(\d{4})(\d)/g, "$1 $2");
                v = v.replace(/^(\d{4})\s(\d{4})(\d)/g, "$1 $2 $3");
                v = v.replace(/^(\d{4})\s(\d{4})\s(\d{4})(\d)/g, "$1 $2 $3 $4");
                return v;
            }
            function id(el) {
                return document.getElementById(el);
            }
            window.onload = function () {
                id('numero').onkeypress = function () {
                    mascara(this, mcc);
                }
            }
        </script>
    </body>
</html>
