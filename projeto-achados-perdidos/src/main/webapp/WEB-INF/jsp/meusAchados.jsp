<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <jsp:include page="_imports.jsp"/>
    <title>Achados e Perdidos</title>
</head>

<body>
    <div id="" class="perfil-fonte">
        <jsp:include page="_header.jsp"/>

        <div class="container col-6">

            <div class="row titulo-pag">
                <h1 class="text-center">Meus Achados</h1>
            </div>


            <div class="row">
                <div class="">

                    <div class="row g-3">

                        <a href="/cadastroAchado" class="btn btn-outline-success" style="font-weight: bold; font-size: 12pt;">Cadastrar novo achado</a>

                        <c:forEach items="${achados}" var="value">
                            <div class="card" style="height: 200px; padding: 0px;">
                                <div class="row">
                                    <div class="col-3" style="padding: auto;">
                                        <img src="data:image/jpg;base64,${value.imagem64}" alt="Log Cabin" style="height: 198px;width: 230px;object-fit: cover;" />
                                    </div>
                                    <div class="col-9" style="padding: auto;">
                                        <div class="card-body text-dark" style="height:10em;"> 
                                            <h5 class="card-title"><c:out value="${value.nome}"/></h5><hr>
                                            <p class="card-text"><c:out value="${value.descricao}"/></p>
                                        </div>
                                        <div class="card-body text-dark"> 
                                            <a href="/visualizarAchado?idAchado=<c:out value="${value.id}"/>" class="btn btn-primary">Ver mais</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        
                    
                    </div>
                    
                </div>
            </div>

    </div>
</body>
</html>