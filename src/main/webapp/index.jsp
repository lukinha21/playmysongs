<%@ page import="com.example.playmysongs.security.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
    String usuario = "";
%>
<%
    // Controle de acesso
    User user = (User) session.getAttribute("user");
    if (user == null) {
        usuario = "Usuário não autenticado";
    } else {
        usuario = user.getName(); // Obtém o nome do usuário autenticado
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./assets/css/css.css" media="screen" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <title>Play My Songs!</title>
    <script>
        function tocarMusica(nomeMusica) {
            var audio = new Audio("musicas/" + nomeMusica);
            audio.play();
        }

        function searchMusic() {
            var searchQuery = document.getElementById("searchQuery").value;
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("musicList").innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", "searchMusic?searchQuery=" + searchQuery, true);
            xhttp.send();
        }

        // Função para verificar se o usuário está logado e controlar a visibilidade dos botões
        function verificarLogin() {
            var usuario = "<%= usuario %>";
            var botaoEnviar = document.getElementById("btnEnviar");
            var botaoLogout = document.getElementById("btnLogout");
            var botaoLogin = document.getElementById("btnLogin");

            if (usuario === "Usuário não autenticado") {
                botaoEnviar.style.display = "none";
                botaoLogout.style.display = "none";
                botaoLogin.style.display = "inline";
            } else {
                botaoEnviar.style.display = "inline";
                botaoLogout.style.display = "inline";
                botaoLogin.style.display = "none";
            }
        }
    </script>
</head>
<body>
<div class="box-formulario">
    <ul class="menu-lateral">
        <li><span> <a href="enviamusica.jsp">Envie uma música</a> </span></li>
        <li><span> <a href="login.jsp">Login</a> </span></li>

        <li>Usuario: <%= usuario %> <span> <a href="./logout-servlet" id="btnLogout" style="display:none;">logout</a> </span></li>
    </ul>
    <div class="formulario">
        <h1 class="title-form">Play My Songs
            <span class="subtitle-form">Busque aqui as melhores músicas!!!</span>
        </h1>


        <form action="#" method="post">

                    <span>
                        <input type="text" class="input" id="searchQuery" name="searchQuery" placeholder="Busque por nome, artistas, genêro, e muito mais" autocomplete="off" required=""/>
                        <span id="btn" class="material-symbols-outlined" onclick="searchMusic()">search</span>
                    </span>

        </form>

    </div>


    <div class="tbl-header">
        <table cellpadding="0" cellspacing="0" border="0">
            <thead>
            <tr>
                <th>Nome</th>
                <th>Reprodutor</th>

            </tr>
            </thead>
        </table>
    </div>


    <div class="tbl_content" id="musicList">
        <table>
            <tbody id="musicTableBody">
            <!-- A tabela será preenchida dinamicamente -->
            </tbody>
        </table>
    </div>

    <script>
        // Verifica o status do login ao carregar a página
        window.onload = function () {
            verificarLogin();
        };
    </script>
</div>


</body>
</html>
