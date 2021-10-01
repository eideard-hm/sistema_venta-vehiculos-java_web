package com.webapp.controllers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Logout", value = "/Logout")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().removeAttribute("idSession");
        req.getSession().removeAttribute("user");
        req.getSession().removeAttribute("rol");
        req.getSession().invalidate();

        resp.sendRedirect(req.getContextPath() + "/usuario/login.jsp");
    }
}
