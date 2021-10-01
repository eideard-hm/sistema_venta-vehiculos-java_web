<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    if (session.getAttribute("idSession") == null) {
        response.sendRedirect(request.getContextPath()+"/usuario/login.jsp");
    }
%>
