<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <jsp:include page="_imports.jsp"/>
    <title>Cadastro Achados</title>
</head>

<body onload="carregarDadosCadastro('cadAchado')">
    <div class="perfil-fonte">
        <jsp:include page="_header.jsp"/>

        <div class="container col-6 espaco-cima fundo-cadastro">

            <div class="row titulo-pag">
              <h1 class="text-center">Cadastro de Achados</h1>
            </div>

            <form class="row g-3" method="post" encType="multipart/form-data">

              <div class="col-12 justify-content-center">
                <label class="form-label">Adicionar imagem</label>
                <input class="form-control" type="file" name="files" id="img" required />
              </div>
              
              <div class="col-md-12">
                <label class="form-label">Nome</label>
                <input type="text" class="form-control" name="nome" id="nome"
                      required oninvalid="this.setCustomValidity('Digite o nome do achado')" oninput="this.setCustomValidity('')">
              </div>
        
              <div class="col-md-12">
                <div class="form-group">
                    <label for="exampleFormControlTextarea1">Descrição</label>
                    <textarea class="form-control rounded-0" name="descricao" id="descricao" rows="10" required
                        oninvalid="this.setCustomValidity('Digite a descrição')" oninput="this.setCustomValidity('')"></textarea>
                  </div>
              </div>
        
              <div class="col-md-2">
                    <label class="form-label">CEP</label>
                    <input type="text" class="form-control" name="cep" required
                        oninvalid="this.setCustomValidity('Digite seu CEP')" id="cep" oninput="this.setCustomValidity('')" 
                        onblur="setEndereco()" maxlength="9" placeholder="00000-000" onkeypress="mascarar(this,mascaraCep)">
                        <a href="/pesquisacep" onclick="procurarCEP('cadAchado')">Pesquisar CEP</a>
                </div>

                <div class="col-10">
                    <label class="form-label">Rua</label>
                    <input type="text" class="form-control" name="rua" id="rua" readonly>
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
        
              <div class="col-12 espaco-cima">
                <button type="submit" class="btn btn-primary">Cadastrar</button>
              </div>
        
            </form>
        
        
          </div>
    </div>
</body>

</html>