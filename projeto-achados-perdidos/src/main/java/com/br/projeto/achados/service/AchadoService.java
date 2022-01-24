package com.br.projeto.achados.service;

import com.br.projeto.achados.models.AchadoEntity;
import com.br.projeto.achados.repository.AchadoRepository;
import com.br.projeto.imagem.models.ImagemEntity;
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
public class AchadoService {
    @Autowired
    private AchadoRepository achadoRepository;

    public void salvar(AchadoEntity achadoEntity, @RequestParam MultipartFile[] files) throws IOException {
        if (files[0] != null) {
            ImagemEntity imagemEntity = new ImagemEntity();

            imagemEntity.setData(files[0].getBytes());

            achadoEntity.setImagem(imagemEntity);
        }

        achadoRepository.save(achadoEntity);
    }

    public AchadoEntity buscar(Long id) throws Exception {
        Optional<AchadoEntity> optionalAchadoEntity = achadoRepository.findById(id);

        if (optionalAchadoEntity.isPresent()) {
            AchadoEntity achadoEntity = optionalAchadoEntity.get();

            byte[] encodeBase64 = Base64.encodeBase64(achadoEntity.getImagem().getData());
            String base64Encoded = new String(encodeBase64, "UTF-8");

            achadoEntity.setImagem64(base64Encoded);

            return achadoEntity;
        }

        else
            throw new Exception("Usuario Nao encotrado");
    }

    public List<AchadoEntity> findAll() throws UnsupportedEncodingException {
        List<AchadoEntity> achadoEntities = achadoRepository.findAll();

        for (AchadoEntity achadoEntity: achadoEntities) {
            byte[] encodeBase64 = Base64.encodeBase64(achadoEntity.getImagem().getData());
            String base64Encoded = new String(encodeBase64, "UTF-8");

            achadoEntity.setImagem64(base64Encoded);
        }

        return achadoEntities;
    }

    public void excluir(Long idAchado) {
        achadoRepository.deleteById(idAchado);
    }

    public void atualizar(AchadoEntity achadoEntity, MultipartFile[] files) throws Exception {
        AchadoEntity achado = this.buscar(achadoEntity.getId());

        if (!files[0].isEmpty()) {
            ImagemEntity imagem = achado.getImagem();
            imagem.setData(files[0].getBytes());

            achadoEntity.setImagem(imagem);
        } else {
            achadoEntity.setImagem(achado.getImagem());
        }

        achadoRepository.save(achadoEntity);
    }
}
