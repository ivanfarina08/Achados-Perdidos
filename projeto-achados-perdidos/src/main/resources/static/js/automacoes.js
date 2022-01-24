function mascarar(o,f){
   v_obj=o
   v_fun=f
   setTimeout("execmascara()",1)
}

function execmascara(){
   v_obj.value=v_fun(v_obj.value)
}



function mascaraCpf(v){
       v=v.replace(/\D/g,"");
       v=v.replace(/(\d{3})(\d)/, '$1.$2'); 
       v=v.replace(/(\d{3})(\d)/, '$1.$2'); 
       v=v.replace(/(\d{3})(\d{1,2})/, '$1-$2');
       v=v.replace(/(-\d{2})\d+?$/, '$1');
       return v;
}

function mascaraTel(v){
       v=v.replace(/\D/g,"");
       v=v.replace(/^(\d{2})(\d)/g,"($1) $2");
       v=v.replace(/(\d)(\d{4})$/,"$1-$2");
       return v;
}

function mascaraCep(v){
   v=v.replace(/\D/g,"")
   v=v.replace(/(\d{5})(\d{1,2})/, '$1-$2');
   return v;
}


function validarSenha() {
   if(document.getElementById('confirmarSenha').value){
      if (document.getElementById('senha').value != document.getElementById('confirmarSenha').value) {
         document.getElementById('btsalvar').readonly = true;
         document.getElementById('senhaDiferente').style.display = "block";
      }
      else{
         document.getElementById('btsalvar').readonly = false;
         document.getElementById('senhaDiferente').style.display = "none";
      }
   }
}

function visualizarSenha(){
   var input = document.getElementById("senha");
   //alert(input.type);
   if(input.type == "password"){
      input.type = "text";
   }
   else{
      input.type = "password";
   }
}

function visualizarConfirmarSenha(){
   var input = document.getElementById("confirmarSenha");
   //alert(input.type);
   if(input.type == "password"){
      input.type = "text";
   }
   else{
      input.type = "password";
   }
}

function visualizarSenhaAtual(){
   var input = document.getElementById("senhaAtual");
   //alert(input.type);
   if(input.type == "password"){
      input.type = "text";
   }
   else{
      input.type = "password";
   }
}




function setEndereco(){
   var cep = document.getElementById("cep").value.replace(/\D/g,"");
   var url = "https://viacep.com.br/ws/"+cep+"/json/"
   var request = new XMLHttpRequest();

   request.open('GET', url);
   request.responseType = 'json';
   request.send();

   request.onload = function() {
      var valores = request.response;
      if(valores.logradouro==undefined){
        document.getElementById("rua").removeAttribute("readonly");
        document.getElementById("rua").value = "";
      }
      else{
        document.getElementById("rua").value = valores.logradouro;
      }
      if(valores.bairro == undefined){
        document.getElementById("bairro").removeAttribute("readonly");
        document.getElementById("bairro").value = "";
      }
      else{
        document.getElementById("bairro").value = valores.bairro;
      }
      if(valores.localidade == undefined){
        document.getElementById("cidade").removeAttribute("readonly");
        document.getElementById("cidade").value = "";
      }
      else{
        document.getElementById("cidade").value = valores.localidade;
      }
      if(valores.uf == undefined){
        document.getElementById("estado").removeAttribute("readonly");
        document.getElementById("estado").value = "";
      }
      else{
        document.getElementById("estado").value = valores.uf;
      }
      
   }
}


function buscarCEP(){
   var estado = document.getElementById("estado");
   var cidade = document.getElementById("cidade");
   var rua = document.getElementById("rua");
   var resultado = document.getElementById("resultado");
   resultado.innerHTML="";

   var url = "https://viacep.com.br/ws/"+estado.value+"/"+cidade.value+"/"+rua.value+"/json/"
   var request = new XMLHttpRequest();

   request.open('GET', url);
   request.responseType = 'json';
   request.send();

   request.onload = function() {
      var valores = request.response;
      for(var i=0;i<valores.length; i++){
           resultado.innerHTML +=  '<div class="card col-4" style="margin-top:10px;"> <div class="card-header" id="cep'+i+'"> '+valores[i].cep+' </div> <ul class="list-group list-group-flush"> <li class="list-group-item">'+valores[i].logradouro+'</li>  <li class="list-group-item" id="bairro">'+valores[i].bairro+'</li> <li class="list-group-item">'+valores[i].localidade+'</li> <li class="list-group-item">'+valores[i].uf+'</li> <li class="list-group-item"><button class="btn btn-primary" onclick="getCEP('+i+')">Escolher</button></li> </ul> </div>';
      }
   }

}

function getCEP(o){
   var cepid = "cep"+o;
   let cep = document.getElementById(cepid).innerText;
   localStorage.setItem('cep', JSON.stringify(cep));
   location.href = document.referrer;
}

function alterarCorImagem(){
   document.getElementById("botao-alterar-imagem").style.display = "block";
}

function voltarCorImagem(){
  document.getElementById("botao-alterar-imagem").style.display = "none";
}

function alterarImagem(){
  document.getElementById("botaoAlteraImagem").style.display = "block";
}

function procurarCEP(tipo){
   //cadastrar
   if(tipo=="cadUsuario"){
      guardarInscrever();
   }
   if(tipo=="cadAchado"){
      guardarAchado();
   }
   if(tipo=="cadPerdido"){
      guardarPerdido();
   }

   //alterar
   if(tipo=="editUsuario"){
      guardarEditPerfil();
   }
   if(tipo=="editAchado"){
      guardarEditAchado();
   }
   if(tipo=="editPerdido"){
      guardarEditPerdido();
   }
}

function carregarDadosCadastro(tipo){
   //cadastrar
   if(tipo=="cadUsuario"){
      setInscrever();
   }
   if(tipo=="cadAchado"){
      setCadAchadoPerdido();
   }
   if(tipo=="cadPerdido"){
      setCadAchadoPerdido();
   }
}

function guardarInscrever(){
   var nome = document.getElementById("nome").value;
   var email = document.getElementById("email").value;
   var cpf = document.getElementById("cpf").value;
   var senha = document.getElementById("senha").value;
   var confirmarsenha = document.getElementById("confirmarSenha").value;
   var telefone = document.getElementById("telefone").value;
   var celular = document.getElementById("celular").value;
 
   localStorage.setItem('nome', JSON.stringify(nome));
   localStorage.setItem('email', JSON.stringify(email));
   localStorage.setItem('cpf', JSON.stringify(cpf));
   localStorage.setItem('senha', JSON.stringify(senha));
   localStorage.setItem('confirmarsenha', JSON.stringify(confirmarsenha));
   localStorage.setItem('telefone', JSON.stringify(telefone));
   localStorage.setItem('celular', JSON.stringify(celular));
 }

 function setInscrever(){
   if ( localStorage.getItem('cep') ) {
      let cep = JSON.parse(localStorage.getItem('cep'));
      document.getElementById("cep").value = cep;
      localStorage.removeItem('cep')
      setEndereco();
   }
 
   if ( localStorage.getItem('nome') ) {
      let nome = JSON.parse(localStorage.getItem('nome'));
      document.getElementById("nome").value = nome;
   }
 
   if ( localStorage.getItem('email') ) {
      let email = JSON.parse(localStorage.getItem('email'));
      document.getElementById("email").value = email;
   }
 
   if ( localStorage.getItem('cpf') ) {
      let cpf = JSON.parse(localStorage.getItem('cpf'));
      document.getElementById("cpf").value = cpf;
   }
 
   if ( localStorage.getItem('senha') ) {
      let senha = JSON.parse(localStorage.getItem('senha'));
      document.getElementById("senha").value = senha;
   }
 
   if ( localStorage.getItem('confirmarsenha') ) {
      let confirmarsenha = JSON.parse(localStorage.getItem('confirmarsenha'));
      document.getElementById("confirmarSenha").value = confirmarsenha;
   }
 
   if ( localStorage.getItem('telefone') ) {
      let telefone = JSON.parse(localStorage.getItem('telefone'));
      document.getElementById("telefone").value = telefone;
   }
 
   if ( localStorage.getItem('celular') ) {
      let celular = JSON.parse(localStorage.getItem('celular'));
      document.getElementById("celular").value = celular;
   }
   localStorage.removeItem('nome');
   localStorage.removeItem('email');
   localStorage.removeItem('cpf');
   localStorage.removeItem('senha');
   localStorage.removeItem('confirmarsenha');
   localStorage.removeItem('telefone');
   localStorage.removeItem('celular');   
 }

 function guardarAchado(){
   var nome = document.getElementById("nome").value;
   var descricao = document.getElementById("descricao").value;
 
   localStorage.setItem('nome', JSON.stringify(nome));
   localStorage.setItem('descricao', JSON.stringify(descricao));
 }

 function setCadAchadoPerdido(){
   if ( localStorage.getItem('cep') ) {
      let cep = JSON.parse(localStorage.getItem('cep'));
      document.getElementById("cep").value = cep;
      localStorage.removeItem('cep')
      setEndereco();
   }
 
   if ( localStorage.getItem('nome') ) {
      let nome = JSON.parse(localStorage.getItem('nome'));
      document.getElementById("nome").value = nome;
   }

   if ( localStorage.getItem('descricao') ) {
      let descricao = JSON.parse(localStorage.getItem('descricao'));
      document.getElementById("descricao").value = descricao;
   }
   
   localStorage.removeItem('nome');
   localStorage.removeItem('descricao');
 }

 function carregarCEP(){
   if ( localStorage.getItem('cep') ) {
      let cep = JSON.parse(localStorage.getItem('cep'));
      document.getElementById("cep").value = cep;
      localStorage.removeItem('cep');
      setEndereco();
   }
}

 

