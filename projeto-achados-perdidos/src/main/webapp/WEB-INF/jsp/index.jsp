<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <jsp:include page="_imports.jsp"/>
    <title>Perfil</title>
</head>

<body>
<%@ page session= "true" %>

    <div id="perfil" class="perfil-fonte">
        <jsp:include page="_header.jsp"/>

        <div class="centralizar-pagina">
            <div class="card" id="card-bemvindo">
                <div>
                    <h1 class="bem-vindo">Bem vindo!</h1>
                </div>
                <div>
                    <a href="/cadastroAchado" class="btn bem-vindo-btn">Encontrou algo?</a>
                </div>
            </div>
        </div>
    </div>
</body>

</html>