package com.br.projeto.achados.repository;

import com.br.projeto.achados.models.AchadoEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AchadoRepository extends JpaRepository<AchadoEntity, Long> {
}
