<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <jsp:include page="_imports.jsp"/>
    <title>Visualizar Achado</title>
</head>

<body>
    <div class="perfil-fonte">
        <jsp:include page="_header.jsp"/>

        <div class="container col-7 espaco-cima-grande">

            <div class="row titulo-pag">
                <h1 class="text-center">Visualizar Achado</h1>
            </div>


            <form class="row g-3 espaco-cima justify-content-center" action="">
                
                <div class="col-12" style="margin: auto;padding: auto; border-radius: 20%;">
                    <img class="img-fluid rounded mx-auto d-block" src="data:image/jpg;base64,${imagem}" alt="Log Cabin" style="height: 20rem; border-radius: 100%;"/>
                </div>

            </form>

            <form class="row g-3 espaco-cima" action="#" style="margin-bottom: 50px;">

                <div class="col-md-12">
                    <label class="form-label">Nome</label>
                    <input type="text" class="form-control form-label" name="nome" readonly value='<c:out value="${value.nome}"/>' >
                </div>

                <div class="col-md-12">
                    <label class="form-label">Descrição</label>
                    <textarea class="form-control rounded-0" rows="10" readonly><c:out value="${value.descricao}"/></textarea>
                </div>

                <div class="col-md-2">
                    <label class="form-label">CEP</label>
                    <input type="text" class="form-control" name="cep" readonly
                        oninvalid="this.setCustomValidity('Digite seu CEP')" id="cep" oninput="this.setCustomValidity('')" 
                        value='<c:out value="${value.cep}"/>'>
                </div>

                <div class="col-10">
                    <label class="form-label">Rua</label>
                    <input type="text" class="form-control" name="rua" id="rua" readonly value='<c:out value="${value.rua}"/>'>
                </div>

                <div class="col-4">
                    <label class="form-label">Bairro</label>
                    <input type="text" class="form-control" name="bairro" id="bairro" readonly value='<c:out value="${value.bairro}"/>'>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Cidade</label>
                    <input type="text" class="form-control" name="cidade" id="cidade" readonly value='<c:out value="${value.cidade}"/>'>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Estado</label>
                    <input type="text" class="form-control" name="estado" id="estado" readonly value='<c:out value="${value.estado}"/>'>
                </div>
                
                <div class="col-md-2">
                    <label class="form-label"></label>
                    <a href="/editarAchado?idAchado=<c:out value="${value.id}"/>" class="btn btn-warning form-control">Alterar</a>
                </div>

                <div class="col-md-2">
                    <label class="form-label"></label>
                    <a href="/excluirAchado?idAchado=<c:out value="${value.id}"/>" class="btn btn-danger form-control">Excluir</a>
                </div>

            </form>


        </div>
    </div>
    </div>
</body>

</html>