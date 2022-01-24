<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <jsp:include page="_imports.jsp"/>
    <title>Alterar Perfil</title>
</head>

<body onload="carregarCEP()">
    <div class="perfil-fonte">
        <jsp:include page="_header.jsp"/>

        <div class="container col-7 espaco-cima-grande">

            <div class="row titulo-pag">
                <h1 class="text-center">Perfil do usuário</h1>
            </div>


            <form class="row g-3 espaco-cima" style="margin-bottom: 50px;" method="post" encType="multipart/form-data">

                <div class="col-12" style="margin: auto;padding: auto; border-radius: 20%;">
                    <img class="img-fluid rounded mx-auto d-block" src="data:image/jpg;base64,${value.imagem64}" alt="Log Cabin" style="height: 20rem; border-radius: 100%;"/>
                </div>
                
                <div class="col-12 justify-content-center">
                    <label class="form-label">Alterar Foto</label>
                    <input class="form-control" type="file" name="files"/>
                </div>

                <div class="col-md-8">
                    <label class="form-label">Nome</label>
                    <input type="text" class="form-control" name="nome" required value='<c:out value="${value.nome}"/>'
                        oninvalid="this.setCustomValidity('Digite seu nome')" oninput="this.setCustomValidity('')">
                </div>

                <div class="col-4">
                    <label class="form-label">E-mail</label>
                    <input type="text" class="form-control" name="email" value='<c:out value="${value.email}"/>'>
                </div>
                
                <div class="col-4">
                    <label class="form-label">Telefone</label>
                    <input type="text" class="form-control" name="telefone" value='<c:out value="${value.telefone}"/>'>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Celular</label>
                    <input type="text" class="form-control" name="celular" value='<c:out value="${value.celular}"/>'>
                </div>

                <div class="col-4">
                    <label class="form-label">CPF</label>
                    <input type="text" class="form-control" name="cpf" value='<c:out value="${value.cpf}"/>'>
                </div>

                <div class="col-md-2">
                    <label class="form-label">CEP</label>
                    <input type="text" class="form-control" name="cep" 
                        oninvalid="this.setCustomValidity('Digite seu CEP')" id="cep" oninput="this.setCustomValidity('')" 
                        onblur="setEndereco()"
                        value='<c:out value="${value.cep}"/>'>
                        <a href="/pesquisacep">Pesquisar CEP</a>
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
                    <button type="submit" class="form-control btn btn-primary">Atualizar</button>
                </div>
            </form>


        </div>
    </div>
    </div>
</body>

</html>