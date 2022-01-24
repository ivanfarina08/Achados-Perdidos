<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <jsp:include page="_imports.jsp"/>
    <title>Alterar Senha</title>
</head>

<body>
<jsp:include page="_header.jsp"/>
<div class="col-3 container espaco-cima-grande">

    <div class="card" style="border-radius: 20px;">

        <div class="card-header text-center">
            Alterar Senha
        </div>

        <div class="card-body">

            

            <form class="row g-3" method="post">

                <div class="col-md-12">
                    <label class="form-label">Senha Atual</label>
                    <div class="input-group has-validation">
                        <input type="password" class="form-control" name="senhaAntiga" required id="senhaAtual"
                                oninvalid="this.setCustomValidity('Digite sua senha')" oninput="this.setCustomValidity('')" onblur="validarSenha()">
                        <div class="input-group-text" onclick="visualizarSenhaAtual()"><i class="fa fa-eye"></i></div>
                    </div>
                    <div style="color: red;">
                        <c:out value="${message}"/>
                    </div>
                </div>

                <div class="col-md-12">
                    <label class="form-label">Nova Senha</label>
                    <div class="input-group has-validation">
                        <input type="password" class="form-control" name="senhaNova" required id="senha"
                                oninvalid="this.setCustomValidity('Digite sua senha')" oninput="this.setCustomValidity('')" onblur="validarSenha()">
                        <div class="input-group-text" onclick="visualizarSenha()"><i class="fa fa-eye"></i></div>
                    </div>
                </div>

                <div class="col-md-12">
                    <label class="form-label">Confirmar Nova Senha</label>
                    <div class="input-group has-validation">
                        <input type="password" class="form-control" name="confirmarSenha" required id="confirmarSenha"
                            oninvalid="this.setCustomValidity('Digite sua senha novamente')" oninput="this.setCustomValidity('')" onblur="validarSenha()">
                        <div class="input-group-text" onclick="visualizarConfirmarSenha()"><i class="fa fa-eye"></i></div>
                    </div>
                    <div id="senhaDiferente" style="display:none; color:red">
                        Senhas diferentes
                    </div>
                </div>

                <div class="offset-md-4 col-md-4">
                    <input type="submit" class="form-control btn btn-primary" value="Alterar">
                </div>

            </form>

        </div>

    </div>

</div>

</body>

</html>