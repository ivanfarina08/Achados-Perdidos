<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <jsp:include page="_imports.jsp"/>
    <title>Login</title>
</head>

<body id="login">
<div class="fundo">
    <div class="img-cel">
        <img src="img/celular.png" alt="Celular">
    </div>
    <div class="fundo-login">
        <div class="grupo">
            <h1 class="margin-abaixo" id="h1-login">ACHADOS E PERDIDOS</h1>
            <form class="margin-abaixo" method="post" action="loginSenha">
                <input type="text" name="cpf" class="form-text" value="${cpf}" placeholder="CPF" readonly><br>
                <input type="password" name="senha" class="form-text" placeholder="Senha"><br>
                <center><button type="submit" class="form-botao">Entrar</button></center>
            </form>
            <div>
                <a href="#" class="">Esqueceu a senha?</a>
            </div>
        </div>
        <div class="grupo">
            <p class="">Não tem uma conta?</p>
            <p class=""><a href="/inscrever">Inscreva-se</a></p>
        </div>
        <div class="baixe-app">
            <p class="">Baixe o aplicativo</p>
            <div class="download-fundo">
                <a href="#" class="download"></a>
                <a href="#" class="download"></a>
            </div>
        </div>
    </div>
</div>
</body>

</html>