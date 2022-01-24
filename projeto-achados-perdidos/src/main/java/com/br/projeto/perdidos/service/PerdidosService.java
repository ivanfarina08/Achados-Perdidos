package com.br.projeto.perdidos.service;

import com.br.projeto.achados.models.AchadoEntity;
import com.br.projeto.imagem.models.ImagemEntity;
import com.br.projeto.perdidos.models.PerdidosEntity;
import com.br.projeto.perdidos.repository.PerdidosRepository;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Optional;

@Service
public class PerdidosService {
    @Autowired
    private PerdidosRepository perdidosRepository;

    public void salvar(PerdidosEntity perdidosEntity, @RequestParam MultipartFile[] files) throws IOException {
        if (files[0] != null) {
            ImagemEntity imagemEntity = new ImagemEntity();

            imagemEntity.setData(files[0].getBytes());

            perdidosEntity.setImagem(imagemEntity);
        }

        perdidosRepository.save(perdidosEntity);
    }

    public PerdidosEntity buscar(Long idAchado) throws Exception {
        Optional<PerdidosEntity> perdidosEntity = perdidosRepository.findById(idAchado);

        if (perdidosEntity.isPresent()) {
            PerdidosEntity perdidos = perdidosEntity.get();

            byte[] encodeBase64 = Base64.encodeBase64(perdidos.getImagem().getData());
            String base64Encoded = new String(encodeBase64, "UTF-8");

            perdidos.setImagem64(base64Encoded);

            return perdidos;
        }

        else throw new Exception("Perdido não encontrado");
    }

    public List<PerdidosEntity> findAll() throws UnsupportedEncodingException {
        List<PerdidosEntity> perdidosEntities = perdidosRepository.findAll();

        for (PerdidosEntity perdidosEntity: perdidosEntities) {
            byte[] encodeBase64 = Base64.encodeBase64(perdidosEntity.getImagem().getData());
            String base64Encoded = new String(encodeBase64, "UTF-8");

            perdidosEntity.setImagem64(base64Encoded);
        }

        return perdidosEntities;
    }

    public void excluir(Long idAchado) {
        perdidosRepository.deleteById(idAchado);
    }

    public void atualizar(PerdidosEntity perdidosEntity, MultipartFile[] files) throws Exception {
        PerdidosEntity perdido = this.buscar(perdidosEntity.getId());

        if (!files[0].isEmpty()) {
            ImagemEntity imagem = perdido.getImagem();
            imagem.setData(files[0].getBytes());

            perdidosEntity.setImagem(imagem);
        } else {
            perdidosEntity.setImagem(perdido.getImagem());
        }

        perdidosRepository.save(perdidosEntity);
    }
}
