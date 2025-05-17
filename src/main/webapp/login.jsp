<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.playmysongs.security.User" %>

<%
    User user = (User) session.getAttribute("user");
    boolean isLoggedIn = user != null;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="./assets/css/css.css" media="screen" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <title>Play My Songs!</title>
</head>
<body>
<div class="box-formulario">
    <ul class="menu-lateral">
        <li><span> <a href="./index.jsp">Voltar</a></span></li>
    </ul>
    <div class="formulario">
        <h1 class="title-form">Login

        </h1>
        <form action="./login-servlet" method="post">
            <span>
                <input type="text" class="input" name="login" id="login" placeholder="Nome" autocomplete="off" required=""/>
                <label for="login"> <span id="btn-login" class="material-symbols-outlined">login</span></label>
            </span>
            <span>
                <input type="password" class="input" name="pswd" id="pswd" placeholder="Senha" autocomplete="off" required=""/>
                <label for="pswd"> <span id="btn-login" class="material-symbols-outlined">vpn_key</span> </label>
            </span>
            <span class="botao-login">
                    <input type="submit" value="Entrar" class="botao rotacao">
                </span>
        </form>
    </div>
</div>

<script>
    // Executar após o carregamento completo da página
    document.addEventListener("DOMContentLoaded", function() {
        // Obter o estado de login
        var isLoggedIn = <%= isLoggedIn %>;

        // Desabilitar ou habilitar os botões com base no estado de login
        var enviarMusicaButton = document.getElementById("enviarMusica");
        var logoutButton = document.getElementById("logout");

        if (isLoggedIn) {
            enviarMusicaButton.disabled = false;
            logoutButton.disabled = false;
        } else {
            enviarMusicaButton.disabled = true;
            logoutButton.disabled = true;
        }
    });
</script>

</body>
</html>
