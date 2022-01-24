package com.br.projeto.usuario.service;

import com.br.projeto.imagem.models.ImagemEntity;
import com.br.projeto.usuario.models.SenhaModel;
import com.br.projeto.usuario.models.UsuarioEntity;
import com.br.projeto.usuario.repository.UsuarioRepository;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

@Service
public class UsuarioService {
    @Autowired
    private UsuarioRepository userRepository;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    public UsuarioEntity buscarPorCpf(String cpf){
        return userRepository.findByCpf(cpf);
    }

    public UsuarioEntity buscarPorId(Long idUsuario) throws UnsupportedEncodingException {
        UsuarioEntity usuarioEntity = userRepository.findById(idUsuario).get();

        byte[] encodeBase64 = Base64.encodeBase64(usuarioEntity.getImagem().getData());
        String base64Encoded = new String(encodeBase64, "UTF-8");

        usuarioEntity.setImagem64(base64Encoded);

        return usuarioEntity;
    }

    public void atualizar(UsuarioEntity usuarioEntity, MultipartFile[] files) throws IOException {
        UsuarioEntity usuario = this.buscarPorId(usuarioEntity.getId());

        if (!files[0].isEmpty()) {
            ImagemEntity imagem = usuario.getImagem();
            imagem.setData(files[0].getBytes());

            usuarioEntity.setImagem(imagem);
        } else {
            usuarioEntity.setImagem(usuario.getImagem());
        }

        userRepository.save(usuarioEntity);
    }

    public void excluirCadastros(Long idUsuario) {
        userRepository.deleteById(idUsuario);
    }

    public String alterarSenha(SenhaModel entrada, Long idUsuario) throws Exception {
        UsuarioEntity usuarioEntity = this.buscarPorId(idUsuario);

        String senhaAntiga = usuarioEntity.getSenha();
        String senhaAntigaDigitada = passwordEncoder.encode(entrada.getSenhaAntiga());

        if (!senhaAntiga.equals(senhaAntigaDigitada))
            throw new Exception("Senha Antiga Inválida");

        if (!entrada.getSenhaNova().equals(entrada.getConfirmarSenha()))
            throw new Exception("As senha nova não é igual a confirmação de senha");

        usuarioEntity.setSenha(passwordEncoder.encode(entrada.getSenhaNova()));

        userRepository.save(usuarioEntity);

        return "Alterado com sucesso!";
    }
}
