package com.webapp.controllers;

import com.google.gson.Gson;
import com.webapp.models.Usuario;
import com.webapp.repository.Repository;
import com.webapp.repository.UsuarioRepository;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "UsuarioController", value = "/Usuario")
@MultipartConfig
public class UsuarioController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("idSession") == null) {
            resp.sendRedirect(req.getContextPath() + "/usuario/login.jsp");
        } else if (req.getSession().getAttribute("rol").equals("Comprador")) {
            req.getRequestDispatcher("/menu/dashboardComprador.jsp").forward(req, resp);
        } else if (req.getSession().getAttribute("rol").equals("Vendedor")) {
            req.getRequestDispatcher("/menu/dashboardVendedor.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer accion = Integer.parseInt(req.getParameter("opcion"));
        String usuId = req.getParameter("txtIdUsu");
        String usuLogin = req.getParameter("txtUsuario");
        String usuPassword = req.getParameter("txtPass");
        String usuRol = req.getParameter("rol");

        //enviar los datos de forma segura al modelo
        Usuario usuario = new Usuario(usuId, usuLogin, usuPassword, usuRol);
        Repository<Usuario> usuarioRepository = new UsuarioRepository();
        UsuarioRepository usuarioRepository1 = new UsuarioRepository();
        Map response = new HashMap<>();

        switch (accion) {
            //va a inicar sesión
            case 1:
                if (usuarioRepository1.iniciarSesion(usuLogin, usuPassword)) {
                    HttpSession session = req.getSession();
                    session.setAttribute("idSession", session.getId());
                    session.setAttribute("user", usuLogin);
                    usuario = usuarioRepository1.dataUserSession(usuario.getUsuLogin());
                    session.setAttribute("rol", usuario.getUsuRol());
                    response.put("status", true);
                    response.put("msg", usuario.getUsuRol());
                } else {
                    response.put("status", false);
                    response.put("msg", "Usuario o contraseña son incorrectos. Por favor intenta nuevamente !!");
                }
                break;
            //va a registrar un nuevo usuario
            case 2:
                try {
                    if (usuarioRepository.save(usuario) > 0) {
                        if (usuId.isEmpty()) {
                            usuario = usuarioRepository1.getDataLogin(usuLogin);
                            usuarioRepository1.insertRolUsuario(usuRol, usuario.getUsuId());
                            response.put("status", true);
                            response.put("msg", "El usuario ha sido insertado correctamente :D");
                        } else if (Integer.parseInt(usuId) > 0) {
                            response.put("status", true);
                            response.put("msg", "El usuario ha sido modificado correctamente :D");
                        } else {
                            response.put("status", false);
                            response.put("msg", "Ha ocurrido un error. No se ha podido agregar el usuario :C");
                        }
                    } else if (usuarioRepository.save(usuario) == -1) {
                        response.put("status", false);
                        response.put("msg", "El usuario ya se encuentra registrado. Intente con otro.");
                    } else {
                        response.put("status", false);
                        response.put("msg", "Ha ocurrido un error en el servidor. No se ha podido agregar el usuario :C");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
        }
        Gson gson = new Gson();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter pw = resp.getWriter();
        pw.println(gson.toJson(response));
        pw.close();
    }
}
