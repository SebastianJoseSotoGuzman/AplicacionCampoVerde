package com.cv.model.entity;

public class Subcategoria {

    private Integer Idsubc;
    String Codigo, Nombre, Estado;

    public Subcategoria(Integer Idsubc, String Codigo, String Nombre, String Estado) {
        this.Idsubc = Idsubc;
        this.Codigo = Codigo;
        this.Nombre = Nombre;
        this.Estado = Estado;
    }

    public Subcategoria() {
    }

    public Integer getIdsubc() {
        return Idsubc;
    }

    public void setIdsubc(Integer Idsubc) {
        this.Idsubc = Idsubc;
    }

    public String getCodigo() {
        return Codigo;
    }

    public void setCodigo(String Codigo) {
        this.Codigo = Codigo;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    }
