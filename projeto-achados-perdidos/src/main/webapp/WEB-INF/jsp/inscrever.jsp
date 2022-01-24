<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <jsp:include page="_imports.jsp"/>
    <title>Inscreva-se</title>
</head>

<body onload="carregarDadosCadastro('cadUsuario')">
    <div>
        <div class="container col-7 espaco-cima-grande">

            <div class="row titulo-pag">
                <h1 class="text-center">Criar sua Conta</h1>
            </div>


            <form name="form" method="post" class="row g-3" encType="multipart/form-data">

                <div class="col-md-12">
                    <label class="form-label">Nome</label>
                    <input type="text" class="form-control" name="nome" required id="nome"
                        oninvalid="this.setCustomValidity('Digite seu nome')" oninput="this.setCustomValidity('')" placeholder="Nome">
                </div>

                <div class="col-6">
                    <label class="form-label">E-mail</label>
                    <input type="email" class="form-control" name="email" required id="email"
                        oninvalid="this.setCustomValidity('Digite seu email')" oninput="this.setCustomValidity('')" placeholder="nome@exemplo.com">
                </div>

                <div class="col-6">
                    <label class="form-label">CPF</label>
                    <input type="text" class="form-control" name="cpf" required
                        oninvalid="this.setCustomValidity('Digite seu CPF')" oninput="this.setCustomValidity('')" 
                        id="cpf" maxlength="14" placeholder="000.000.000-00" onkeypress="mascarar(this,mascaraCpf)">
                </div>

                <div class="col-md-6">
                    <label class="form-label">Senha</label>
                    <div class="input-group has-validation">
                        <input type="password" class="form-control" name="senha" required id="senha"
                            oninvalid="this.setCustomValidity('Digite sua senha')" oninput="this.setCustomValidity('')" onblur="validarSenha()">
                        <div class="input-group-text" onclick="visualizarSenha()"><i class="fa fa-eye"></i></div>
                    </div>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Confirmar Senha</label>
                    <div class="input-group has-validation">
                        <input type="password" class="form-control" name="confirmarSenha" required id="confirmarSenha"
                            oninvalid="this.setCustomValidity('Digite sua senha novamente')" oninput="this.setCustomValidity('')" onblur="validarSenha()">
                        <div class="input-group-text" onclick="visualizarConfirmarSenha()"><i class="fa fa-eye"></i></div>
                    </div>
                    <div id="senhaDiferente" style="display:none; color:red">
                        Senhas diferentes
                    </div>
                </div>

                <div class="col-6">
                    <label class="form-label">Telefone</label>
                    <input type="text" class="form-control" name="telefone" required
                        oninvalid="this.setCustomValidity('Digite seu telefone')" oninput="this.setCustomValidity('')" uns 
                        id="telefone" placeholder="(00) 0000-0000" maxlength="14" onkeypress="mascarar(this,mascaraTel)">
                </div>

                <div class="col-md-6">
                    <label class="form-label">Celular</label>
                    <input type="text" class="form-control" name="celular" required id="celular"
                        oninvalid="this.setCustomValidity('Digite seu celular')" oninput="this.setCustomValidity('')" placeholder="(00) 00000-0000" maxlength="15" onkeypress="mascarar(this,mascaraTel)">
                </div>

                <div class="col-md-2">
                    <label class="form-label">CEP</label>
                    <input type="text" class="form-control" name="cep" required id="cep"
                        oninvalid="this.setCustomValidity('Digite seu CEP')" id="cep" oninput="this.setCustomValidity('')" 
                        onblur="setEndereco()" maxlength="9" placeholder="00000-000" onkeypress="mascarar(this,mascaraCep)">
                    <a href="/pesquisacep" onclick="procurarCEP('cadUsuario')">Pesquisar CEP</a>
                </div>

                <div class="col-10">
                    <label class="form-label">Rua</label>
                    <input type="text" class="form-control" name="rua" id="rua" readonly>
                </div>

                <div class="col-1">
                    <label class="form-label">Número</label>
                    <input type="text" class="form-control" name="numero"
                        oninvalid="this.setCustomValidity('Digite o numero')" oninput="this.setCustomValidity('')" >
                </div>

                <div class="col-3">
                    <label class="form-label">Complemento</label>
                    <input type="text" class="form-control" name="complemento" required
                        oninvalid="this.setCustomValidity('Digite o complemento')" oninput="this.setCustomValidity('')" >
                </div>

                <div class="col-4">
                    <label class="form-label">Bairro</label>
                    <input type="text" class="form-control" name="bairro" id="bairro" readonly>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Cidade</label>
                    <input type="text" class="form-control" name="cidade" id="cidade" readonly>
                </div>

                <div class="col-md-4">
                    <label class="form-label">Estado</label>
                    <input type="text" class="form-control" name="estado" id="estado" readonly>
                </div>

                <div class="col-md-6">
                    <label class="form-label">Foto</label>
                    <input class="form-control" type="file" name="files" required />
                </div>

                <button class="btn btn-primary" style="margin-top: 100px; padding:10px" id="btsalvar" type="submit">Salvar</button>

            </form>

        </div>
    </div>
</body>

</html>
