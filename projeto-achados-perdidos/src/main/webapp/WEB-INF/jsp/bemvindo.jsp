<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <jsp:include page="_imports.jsp"/>
    <title>Achados e Perdidos</title>
</head>

<body>
    <div id="perfil" class="perfil-fonte">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav w-100">
                    <li class="nav-item">
                        <a class="nav-link" id="nav-item1" href="bemvindo.html">Achados e Perdidos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Doações</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Sobre nós</a>
                    </li>
                </ul>
                <div class="dropdown">
                    <button class="dropbtn">Nome do Usuário</button>
                    <div class="dropdown-content">
                        <a href="perfil.html">Perfil</a>
                        <a href="#">Meus Achados</a>
                        <a href="#">Meus Perdidos</a>
                        <a href="#">Doações</a>
                        <a href="#">Sair</a>
                    </div>
                </div>
        </nav>

        <div class="centralizar-pagina">
            <div class="card" id="card-bemvindo">
                <div>
                    <h1 class="bem-vindo">Bem vindo!</h1>
                </div>
                <div>
                    <a href="cadachado.html" class="btn bem-vindo-btn">Encontrou algo?</a>
                </div>
            </div>
        </div>
    </div>
</body>

</html>