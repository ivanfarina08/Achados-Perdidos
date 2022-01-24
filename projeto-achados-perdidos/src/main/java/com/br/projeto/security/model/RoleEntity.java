package com.br.projeto.security.model;



import com.br.projeto.usuario.models.UsuarioEntity;

import javax.persistence.*;
import java.util.Set;

@Entity(name = "role")
public class RoleEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    @ManyToMany(mappedBy = "roles")
    private Set<UsuarioEntity> users;

    public RoleEntity() {
    }

    public RoleEntity(String role) {
        this.name = role;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<UsuarioEntity> getUsers() {
        return users;
    }

    public void setUsers(Set<UsuarioEntity> users) {
        this.users = users;
    }


}
