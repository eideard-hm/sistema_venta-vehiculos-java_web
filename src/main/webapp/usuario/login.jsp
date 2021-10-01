<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="shortcut icon" href="../assets/img/Logo programa.ico" type="image/x-icon">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="../assets/img/Logo%20programa.png" alt="" width="50" height="50">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-3">
    <div class="row d-flex justify-content-center">
        <form class="row g-3 col-md-6" id="form-login" method="post">
            <input type="hidden" name="opcion" id="opcion" value="1"/>
            <div class="col-md-12">
                <label for="txtUsuario" class="form-label">Usuario</label>
                <input type="text" class="form-control" id="txtUsuario" name="txtUsuario" placeholder="Usuario">
            </div>
            <div class="col-md-12">
                <label for="txtPass" class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="txtPass" name="txtPass" placeholder="Contraseña">
            </div>

            <div class="col-12">
                <button type="submit" class="btn btn-primary boton_ingresar">Ingresar</button>
            </div>
        </form>
    </div>
</div>
<jsp:include page="../WEB-INF/pages/scripts.jsp"/>
<script src="../assets/js/usuario.js"></script>
</body>

</html>
