<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <jsp:include page="_imports.jsp"/>
    <title>Inscreva-se</title>
</head>

<body>
    <div>
        <div class="container col-7 espaco-cima-grande fundo-inscrever">

            <div class="row titulo-pag">
                <h1 class="text-center">Pesquisar CEP</h1>
            </div>


            <form name="form" class="row g-3">

                <div class="col-md-12">
                    <label class="form-label">Estado</label>
                    <input type="text" class="form-control" id="estado" required placeholder="UF" value="SP">
                </div>

                <div class="col-6">
                    <label class="form-label">Cidade</label>
                    <input type="text" class="form-control" id="cidade" required value="hortolandia">
                </div>

                <div class="col-6">
                    <label class="form-label">Rua</label>
                    <input type="text" class="form-control" id="rua" required value="lirios">
                </div>

                <input type="button" value="Buscar" onclick="buscarCEP()">

            </form>

            <div class="row" id="resultado" style="margin-top: 50px;">
            </div>

        </div>
    </div>
</body>

</html>
