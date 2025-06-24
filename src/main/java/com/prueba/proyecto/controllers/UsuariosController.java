package com.prueba.proyecto.controllers;

import org.springframework.web.bind.annotation.RestController;

import com.prueba.proyecto.dto.UsuarioDto;
import com.prueba.proyecto.models.Usuario;
import com.prueba.proyecto.repositoryes.UsuarioRepository;
import com.prueba.proyecto.services.UsuarioServices;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PutMapping;

@RestController
public class UsuariosController {

    @Autowired
    private UsuarioRepository c;

    @Autowired
    private UsuarioServices usuarioservice;

    @GetMapping("/")
    public String Inicio() {
        return "Hola Mundo desde Spring Boot";
    }

    @GetMapping("/usuario")
    public String ListarUsuario() {
        return c.findAll().toString();
    }

    @GetMapping("/usuario2")
    public List<Usuario> ListarUsuario2() {
        return c.findAll();
    }

    @GetMapping("/user/{id}")
    public Usuario getUserById(@PathVariable Integer id) {
        return c.findById(id).orElse(null);
    }

    @PostMapping("/usuario")
    public Usuario crearususuario(@RequestBody Usuario usuario) {
        return c.save(usuario);
    }

    @DeleteMapping("/user/{id}")
    public String eliminarUsuario(@PathVariable Integer id) {
        c.deleteById(id);
        return "Usuario eliminado con Exito";
    }

    @PutMapping("user/{id}")
    public Usuario UserUpdate(@PathVariable String id, @RequestBody Usuario usuario) {
        Usuario u = c.findById(Integer.parseInt(id)).orElse(null);
        if (u == null) return null;
        u.setNombre(usuario.getNombre());
        u.setApellido(usuario.getApellido());
        u.setEmail(usuario.getEmail());
        u.setTelefono(usuario.getTelefono());
        u.setDireccion(usuario.getDireccion());
        return u;
    }

    @GetMapping("/inicio")
    public String Inicio2() {
        return "Hola Mundo desde Spring Boot";
    }

    @PostMapping("/usuarioDto")
    public ResponseEntity<UsuarioDto> saveUsuario(@RequestBody UsuarioDto usuarioDto) {
        return new ResponseEntity<>(usuarioservice.save(usuarioDto), HttpStatus.CREATED);
    }

    @GetMapping("/usuarios1")
    public ResponseEntity<List<UsuarioDto>> getUsuarios() {
        return new ResponseEntity<>(usuarioservice.getUsuarios(), HttpStatus.OK);
    }

    @GetMapping("/usuario/{usuarioId}")
    public ResponseEntity<UsuarioDto> getUsuario(@PathVariable Integer usuarioId) {
        return new ResponseEntity<>(usuarioservice.getUsuario(usuarioId), HttpStatus.OK);
    }

    @PutMapping("/usuario/{usuarioId}")
    public ResponseEntity<UsuarioDto> updateUser(@PathVariable Integer usuarioId, @RequestBody UsuarioDto usuarioDto) {
        return new ResponseEntity<>(usuarioservice.update(usuarioId, usuarioDto), HttpStatus.OK);
    }

    @DeleteMapping("usuario/{usuarioId}")
    public ResponseEntity<UsuarioDto> delete(@PathVariable Integer usuarioId) {
        return new ResponseEntity<>(usuarioservice.deleteUsuario(usuarioId), HttpStatus.OK);
    }
}