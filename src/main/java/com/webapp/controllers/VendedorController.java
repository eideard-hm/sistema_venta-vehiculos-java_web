package com.webapp.controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "VendedorController", value = "/Vendedor")
public class VendedorController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("idSession") == null) {
            response.sendRedirect(request.getContextPath() + "/usuario/login.jsp");
        }else{
            request.getRequestDispatcher("/menu/dashboardVendedor.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("idSession") == null) {
            response.sendRedirect(request.getContextPath() + "/usuario/login.jsp");
        }
    }
}
