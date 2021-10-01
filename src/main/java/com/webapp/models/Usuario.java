package com.webapp.models;

public class Usuario {
    private String usuId;
    private String usuLogin;
    private String usuPassword;
    private String usuRol;

    //constructor

    public Usuario() {
    }

    public Usuario(String usuId, String usuLogin, String usuPassword, String usuRol) {
        this.usuId = usuId;
        this.usuLogin = usuLogin;
        this.usuPassword = usuPassword;
        this.usuRol = usuRol;
    }

    //métodos get and set

    public String getUsuId() {
        return usuId;
    }

    public void setUsuId(String usuId) {
        this.usuId = usuId;
    }

    public String getUsuLogin() {
        return usuLogin;
    }

    public void setUsuLogin(String usuLogin) {
        this.usuLogin = usuLogin;
    }

    public String getUsuPassword() {
        return usuPassword;
    }

    public void setUsuPassword(String usuPassword) {
        this.usuPassword = usuPassword;
    }

    public String getUsuRol() {
        return usuRol;
    }

    public void setUsuRol(String usuRol) {
        this.usuRol = usuRol;
    }
}
