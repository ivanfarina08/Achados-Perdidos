package com.br.projeto.perdidos.repository;

import com.br.projeto.perdidos.models.PerdidosEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PerdidosRepository extends JpaRepository<PerdidosEntity, Long> {
}
