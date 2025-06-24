package com.prueba.proyecto.mapper;

import java.util.List;

import com.prueba.proyecto.dto.UsuarioDto;
import com.prueba.proyecto.models.Usuario;

public interface UsuarioMapper {
    Usuario toUsuario(UsuarioDto usuarioDto);
    UsuarioDto toUsuarioDto(Usuario usuario);
    UsuarioDto toUsuarioinDto(Usuario usuario);
    List<UsuarioDto> toUsuarioDtos(List<Usuario> usuarios);
    void updateUsuario(Usuario usuario, UsuarioDto usuarioDto);
}

