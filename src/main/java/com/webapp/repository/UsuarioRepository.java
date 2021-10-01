package com.webapp.repository;

import com.webapp.models.Usuario;
import com.webapp.util.Conexion;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioRepository implements Repository<Usuario> {
    private String sql = "";
    private int r = 0;

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        return Conexion.getConnection();
    }

    @Override
    public List<Usuario> findAll() {
        List<Usuario> usuarios = new ArrayList<>();
        sql = "SELECT usuid, usulogin, usupassword FROM usuario";
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Usuario usuario = rsUsuario(rs);
                usuarios.add(usuario);
            }
        } catch (SQLException | ClassNotFoundException exception) {
            exception.printStackTrace();
        }
        return usuarios;
    }

    @Override
    public Usuario findById(Integer id) {
        Usuario usuario = null;
        sql = "SELECT usuid, usulogin, usupassword FROM usuario WHERE usuid = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    usuario = rsUsuario(rs);
                }
            }
        } catch (SQLException | ClassNotFoundException exception) {
            exception.printStackTrace();
        }
        return usuario;
    }

    @Override
    public int save(Usuario usuario) {
        String query = "";
        if (!(usuario.getUsuId().isEmpty())) {
            sql = "UPDATE usuario SET usulogin = ?, usupassword = ? WHERE usuid = ?";
        } else {
            query = "SELECT usuid, usulogin, usupassword FROM usuario WHERE usulogin = ?";
            sql = "INSERT INTO usuario(usulogin,usupassword) VALUES(?,?)";
        }

        List<Usuario> usuarios = selectAllUsers(query, usuario.getUsuLogin());
        if (usuarios.isEmpty()) {
            try (Connection conn = getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, usuario.getUsuLogin());
                ps.setString(2, usuario.getUsuPassword());
                if (usuario.getUsuId() != null && !(usuario.getUsuId().isEmpty())) {
                    ps.setString(3, usuario.getUsuId());
                }
                r = ps.executeUpdate();
            } catch (SQLException | ClassNotFoundException exception) {
                exception.printStackTrace();
                r = 0;
            }
        } else {
            r = -1;
        }
        return r;
    }

    @Override
    public void delete(Integer id) {

    }

    public boolean iniciarSesion(String username, String password) {
        boolean r = false;
        sql = "SELECT usuid, usulogin, usupassword FROM USUARIO WHERE usulogin = ? AND usupassword = ?";
        try (PreparedStatement ps = getConnection().prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                r = true;
            }
            rs.close();
        } catch (SQLException | ClassNotFoundException exception) {
            exception.printStackTrace(System.out);
        }
        return r;
    }

    private Usuario rsUsuario(ResultSet rs) throws SQLException {
        Usuario usuario = new Usuario();
        usuario.setUsuId(rs.getString("usuid"));
        usuario.setUsuLogin(rs.getString("usulogin"));
        usuario.setUsuPassword(rs.getString("usupassword"));
        return usuario;
    }

    private List<Usuario> selectAllUsers(String sql, String usuLogin) {
        List<Usuario> usuarios = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, usuLogin);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Usuario usuario = rsUsuario(rs);
                    usuarios.add(usuario);
                }
            }
        } catch (SQLException | ClassNotFoundException exception) {
            exception.printStackTrace();
        }
        return usuarios;
    }

    public Usuario getDataLogin(String usuLogin) {
        sql = "SELECT usuid, usulogin, usupassword FROM usuario WHERE usulogin = ?";
        Usuario usuario = null;
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, usuLogin);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    usuario = rsUsuario(rs);
                }
            }
        } catch (SQLException | ClassNotFoundException exception) {
            exception.printStackTrace();
        }
        return usuario;
    }

    public void insertRolUsuario(String usurol, String usuid) {
        sql = "INSERT INTO USUARIO_ROL(rolid, usuid) VALUES(?,?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, usurol);
            ps.setString(2, usuid);
            ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException exception) {
            exception.printStackTrace();
        }
    }

    public Usuario dataUserSession(String usuLogin) {
        sql = "SELECT u.usuid, u.usulogin, u.usupassword, r.rolid, r.roltipo " +
                "FROM USUARIO u INNER JOIN USUARIO_ROL ur " +
                "ON u.usuid = ur.usuid INNER JOIN ROL r " +
                "ON r.rolid = ur.rolid " +
                "WHERE usulogin = ?";
        Usuario usuario = null;
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, usuLogin);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Usuario user = new Usuario();
                    user.setUsuId(rs.getString("u.usuid"));
                    user.setUsuLogin(rs.getString("u.usulogin"));
                    user.setUsuPassword(rs.getString("u.usupassword"));
                    user.setUsuRol(rs.getString("r.roltipo"));
                    usuario = user;
                }
            }
        } catch (SQLException | ClassNotFoundException exception) {
            exception.printStackTrace();
        }
        return usuario;
    }
}
