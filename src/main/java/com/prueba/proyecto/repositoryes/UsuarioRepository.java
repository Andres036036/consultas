package com.prueba.proyecto.repositoryes;

import org.springframework.data.jpa.repository.JpaRepository;

import com.prueba.proyecto.models.Usuario;

public interface UsuarioRepository extends JpaRepository<Usuario,Integer>{

}
