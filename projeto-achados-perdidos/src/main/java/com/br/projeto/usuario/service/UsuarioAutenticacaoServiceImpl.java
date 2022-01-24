package com.br.projeto.usuario.service;

import com.br.projeto.imagem.models.ImagemEntity;
import com.br.projeto.usuario.models.UsuarioEntity;
import com.br.projeto.usuario.models.UsuarioEntrada;
import com.br.projeto.usuario.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashSet;


@Service
public class UsuarioAutenticacaoServiceImpl implements UsuarioAutenticacaoService {
    @Autowired
    private UsuarioRepository usuarioRepository;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Override
    public UsuarioEntity findByLogin(String id) {
        return usuarioRepository.findByCpf(id);
    }

    @Override
    public UsuarioEntity save(UsuarioEntrada usuarioEntrada, @RequestParam MultipartFile[] files) {
        UsuarioEntity usuarioEntity = new UsuarioEntity();

        if (files[0] != null) {
            ImagemEntity imagemEntity = new ImagemEntity();
            try {
                imagemEntity.setData(files[0].getBytes());
            } catch (IOException e) {
                System.out.println("ERRO AO SALVAR IMAGEM USUARIO");
            }

            usuarioEntity.setImagem(imagemEntity);
        }

        usuarioEntity.setNome(usuarioEntrada.getNome());
        usuarioEntity.setEmail(usuarioEntrada.getEmail());
        usuarioEntity.setUsuario(usuarioEntrada.getUsuario());
        usuarioEntity.setSenha(passwordEncoder.encode(usuarioEntrada.getSenha()));
        usuarioEntity.setTelefone(usuarioEntrada.getTelefone());
        usuarioEntity.setCelular(usuarioEntrada.getCelular());
        usuarioEntity.setCpf(usuarioEntrada.getCpf());
        usuarioEntity.setRua(usuarioEntrada.getRua());
        usuarioEntity.setBairro(usuarioEntrada.getBairro());
        usuarioEntity.setCidade(usuarioEntrada.getCidade());
        usuarioEntity.setEstado(usuarioEntrada.getEstado());
        usuarioEntity.setCep(usuarioEntrada.getCep());
        usuarioEntity.setRoles(new HashSet<>(usuarioEntrada.getRoles()));

        UsuarioEntity save = usuarioRepository.save(usuarioEntity);

        return save;
    }
}
