package com.prueba.proyecto.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.prueba.proyecto.dto.UsuarioDto;
import com.prueba.proyecto.mapper.UsuarioMapper;
import com.prueba.proyecto.models.Usuario;
import com.prueba.proyecto.repositoryes.UsuarioRepository;

@Service
public class UsuarioServiceImple implements UsuarioServices {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private UsuarioMapper usuarioMapper;

    @Override
    public UsuarioDto save(UsuarioDto usuarioDto) {
        Usuario u = usuarioMapper.toUsuario(usuarioDto);
        Usuario saved = usuarioRepository.save(u);
        return usuarioMapper.toUsuarioDto(saved);
    }

    @Override
    public List<UsuarioDto> getUsuarios() {
        return usuarioMapper.toUsuarioDtos(usuarioRepository.findAll());
    }

    @Override
    public UsuarioDto getUsuario(Integer usuarioid) {
        return usuarioRepository.findById(usuarioid)
            .map(usuarioMapper::toUsuarioDto)
            .orElse(null);
    }

    @Override
    public UsuarioDto update(Integer usuarioid, UsuarioDto dto) {
        return usuarioRepository.findById(usuarioid).map(u -> {
            usuarioMapper.updateUsuario(u, dto);
            return usuarioMapper.toUsuarioDto(usuarioRepository.save(u));
        }).orElse(null);
    }

    @Override
    public UsuarioDto deleteUsuario(Integer usuarioid) {
        return usuarioRepository.findById(usuarioid)
            .map(u -> {
                usuarioRepository.delete(u);
                return usuarioMapper.toUsuarioDto(u);
            }).orElse(null);
    }
}

