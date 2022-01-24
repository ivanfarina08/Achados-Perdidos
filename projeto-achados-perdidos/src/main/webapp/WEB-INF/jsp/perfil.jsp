<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <jsp:include page="_imports.jsp"/>
    <title>Perfil</title>
</head>

<body>
    <div class="perfil-fonte">
        <jsp:include page="_header.jsp"/>

        <div class="container col-7 espaco-cima-grande">

            <div class="row titulo-pag">
                <h1 class="text-center">Perfil do usuário</h1>
                <span th:text="${message}"></span>
            </div>


            <form class="row g-3 espaco-cima justify-content-center" action="">
                
                <div class="col-12">
                    <img src="data:image/jpg;base64,${value.imagem64}" id="imagem-perfil" style="margin: auto;padding: auto; height:25em;width:25em;object-fit: cover;">
                </div>

            </form>


            <form class="row g-3 espaco-cima" style="margin-bottom: 50px;">

                <div class="offset">
                </div>

                <div class="col-md-8">
                    <label class="form-label">Nome</label>
                    <input type="text" class="form-control" name="nome" readonly value='<c:out value="${value.nome}"/>'
                        oninvalid="this.setCustomValidity('Digite seu nome')" oninput="this.setCustomValidity('')">
                </div>

                <div class="col-4">
                    <label class="form-label">E-mail</label>
                    <input type="text" class="form-control" name="email" readonly value='<c:out value="${value.email}"/>'>
                </div>
                
                <div class="col-4">
                    <label class="form-label">Telefone</label>
                    <input type="text" class="form-control" name="telefone" readonly value='<c:out value="${value.telefone}"/>'>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Celular</label>
                    <input type="text" class="form-control" name="celular" readonly value='<c:out value="${value.celular}"/>'>
                </div>

                <div class="col-4">
                    <label class="form-label">CPF</label>
                    <input type="text" class="form-control" name="cpf" readonly value='<c:out value="${value.cpf}"/>'>
                </div>

                <div class="col-md-2">
                    <label class="form-label">CEP</label>
                    <input type="text" class="form-control" name="cep"  readonly
                        oninvalid="this.setCustomValidity('Digite seu CEP')" id="cep" oninput="this.setCustomValidity('')" 
                        onblur="setEndereco()"
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
                    <a href="/editarUsuario" class="btn btn-warning form-control">Alterar</a>
                </div>

                <div class="col-md-2">
                    <label class="form-label"></label>
                    <a href="/excluirUsuario" class="btn btn-danger form-control">Excluir Conta</a>
                </div>

            </form>


        </div>
    </div>
    </div>
</body>

</html>