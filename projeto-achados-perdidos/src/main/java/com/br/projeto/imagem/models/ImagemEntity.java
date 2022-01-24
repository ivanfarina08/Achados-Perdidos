package com.br.projeto.imagem.models;

import com.br.projeto.achados.models.AchadoEntity;
import com.br.projeto.perdidos.models.PerdidosEntity;
import com.br.projeto.usuario.models.UsuarioEntity;

import javax.persistence.*;

@Entity(name = "imagem")
public class ImagemEntity {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "docName")
    private String docName;

    @Column(name = "docType")
    private String docType;

    @Lob
    private byte[] data;

    @OneToOne(mappedBy = "imagem")
    private UsuarioEntity usuarios;

    @OneToOne(mappedBy = "imagem")
    private AchadoEntity achados;

    @OneToOne(mappedBy = "imagem")
    private PerdidosEntity perdidos;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDocName() {
        return docName;
    }

    public void setDocName(String docName) {
        this.docName = docName;
    }

    public String getDocType() {
        return docType;
    }

    public void setDocType(String docType) {
        this.docType = docType;
    }

    public byte[] getData() {
        return data;
    }

    public void setData(byte[] data) {
        this.data = data;
    }

    public UsuarioEntity getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(UsuarioEntity usuarios) {
        this.usuarios = usuarios;
    }

    public AchadoEntity getAchados() {
        return achados;
    }

    public void setAchados(AchadoEntity achados) {
        this.achados = achados;
    }

    public PerdidosEntity getPerdidos() {
        return perdidos;
    }

    public void setPerdidos(PerdidosEntity perdidos) {
        this.perdidos = perdidos;
    }
}
