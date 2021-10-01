package com.webapp.controllers;

import com.webapp.models.Usuario;
import com.webapp.repository.UsuarioRepository;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CompradorController", value = "/Comprador")
public class CompradorController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("idSession") == null) {
            response.sendRedirect(request.getContextPath() + "/usuario/login.jsp");
        }else{
            request.getRequestDispatcher("/menu/dashboardComprador.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("idSession") == null) {
            response.sendRedirect(request.getContextPath() + "/usuario/login.jsp");
        }
    }
}
