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
    <div class="formulario" id="uploadForm">
        <h1 class="title-form">Play My Songs

        </h1>

            <form id="formEnviarMusica" enctype="multipart/form-data" method="post" action="./upload">
                <h2>Enviar Música</h2>

                <span>
                <input type="text" class="input" name="nomeMusica" id="nomeMusica" placeholder="Nome da música" autocomplete="off" required=""/>
                <label for="nomeMusica"> <span id="btn-login" class="material-symbols-outlined">login</span></label>
            </span>


                <span>
                <select type="text" class="input" name="estiloMusica" id="estiloMusica" required=""/>
                    <option value="Pop">Pop</option>
                    <option value="Rock">Rock</option>
                    <option value="Hip Hop">Hip Hop</option>
                    <option value="Eletrônica">Eletrônica</option>
                    <option value="Sertanejo">Sertanejo</option>
                    </select>
                <label for="estiloMusica"> <span id="btn-login" class="material-symbols-outlined">login</span></label>
            </span>

                <span>
                <input type="text" class="input" name="cantor" id="cantor" placeholder="Artista" autocomplete="off" required=""/>
                <label for="cantor"> <span id="btn-login" class="material-symbols-outlined">login</span></label>
            </span>

                <span>
                <input type="file" class="input" name="file" id="file" required=""/>
                <label for="file"> <span id="btn-login" class="material-symbols-outlined">login</span></label>
            </span>


                <span class="botao-login">
                    <input type="submit" value="Enviar" class="botao rotacao">
                </span>
            </form>

    </div>
</div>
</body>
</html>