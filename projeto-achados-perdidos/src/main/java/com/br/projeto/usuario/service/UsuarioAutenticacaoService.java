package com.br.projeto.usuario.service;


import com.br.projeto.usuario.models.UsuarioEntity;
import com.br.projeto.usuario.models.UsuarioEntrada;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

public interface UsuarioAutenticacaoService {
    UsuarioEntity findByLogin(String login);

    UsuarioEntity save(UsuarioEntrada usuarioEntrada, @RequestParam MultipartFile[] files);
}
