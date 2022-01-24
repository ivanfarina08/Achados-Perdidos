<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <jsp:include page="_imports.jsp"/>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav w-100">
                <li class="nav-item">
                    <a class="nav-link" id="nav-item1" href="/">Achados e Perdidos</a>
                </li>
            </ul>
        <div class="dropdown">

        <button class="dropbtn"><%= session.getAttribute("nomeUsuario") %></button>
        <div class="dropdown-content">
            <a href="/dadosUsuario">Perfil</a>
            <a href="/meusAchados">Meus Achados</a>
            <a href="/listarPerdidos">Meus Perdidos</a>
            <a href="/logout">Sair</a>
        </div>
    </nav>
</body>

</html>