package com.prueba.proyecto.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class UsuarioDto {
    private int id;
    private String identificacion;
    private String nombre;
    private String apellido;
    private String email;
    private String telefono;
    private String direccion;
}
