package com.prueba.proyecto.mapper;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Component;
import com.prueba.proyecto.dto.UsuarioDto;
import com.prueba.proyecto.models.Usuario;

@Component
public class UsuarioMapperImple implements UsuarioMapper {

    @Override
    public Usuario toUsuario(UsuarioDto usuarioDto) {
        if (usuarioDto == null) return null;
        Usuario u = new Usuario();
        u.setId(usuarioDto.getId());
        u.setIdentificacion(usuarioDto.getIdentificacion());
        u.setNombre(usuarioDto.getNombre());
        u.setApellido(usuarioDto.getApellido());
        u.setEmail(usuarioDto.getEmail());
        u.setTelefono(usuarioDto.getTelefono());
        u.setDireccion(usuarioDto.getDireccion());
        return u;
    }

    @Override
    public UsuarioDto toUsuarioDto(Usuario usuario) {
        if (usuario == null) return null;
        UsuarioDto dto = new UsuarioDto();
        dto.setId(usuario.getId());
        dto.setIdentificacion(usuario.getIdentificacion());
        dto.setNombre(usuario.getNombre());
        dto.setApellido(usuario.getApellido());
        dto.setEmail(usuario.getEmail());
        dto.setTelefono(usuario.getTelefono());
        dto.setDireccion(usuario.getDireccion());
        return dto;
    }

    @Override
    public UsuarioDto toUsuarioinDto(Usuario usuario) {
        return toUsuarioDto(usuario);
    }

    @Override
    public List<UsuarioDto> toUsuarioDtos(List<Usuario> usuarios) {
        if (usuarios == null) return null;
        List<UsuarioDto> list = new ArrayList<>(usuarios.size());
        for (Usuario u : usuarios) list.add(toUsuarioDto(u));
        return list;
    }

    @Override
    public void updateUsuario(Usuario usuario, UsuarioDto usuarioDto) {
        if (usuarioDto == null) return;
        usuario.setId(usuarioDto.getId());
        usuario.setIdentificacion(usuarioDto.getIdentificacion());
        usuario.setNombre(usuarioDto.getNombre());
        usuario.setApellido(usuarioDto.getApellido());
        usuario.setEmail(usuarioDto.getEmail());
        usuario.setTelefono(usuarioDto.getTelefono());
        usuario.setDireccion(usuarioDto.getDireccion());
    }
}
