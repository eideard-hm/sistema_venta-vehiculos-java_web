<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Usuario</title>
    <link href="../assets/img/Logo%20programa.ico" rel="icon">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Venta Vehiculos</a>
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
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        Dropdown
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>

<div class="container mt-3">
    <div class="row d-flex justify-content-center">
        <form class="row g-3 col-md-8" id="form">
            <input type="hidden" id="txtIdUsu" name="txtIdUsu">
            <input type="hidden" name="opcion" id="opcion" value="2"/>
            <div class="col-md-12">
                <label for="txtUsuario" class="form-label">Usuario</label>
                <input type="text" class="form-control" id="txtUsuario" name="txtUsuario" placeholder="Usuario">
            </div>
            <div class="col-md-12">
                <label for="txtPass" class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="txtPass" name="txtPass" placeholder="Contraseña">
            </div>
            <div class="col-md-12">
                <select class="form-select" name="rol" id="rol">
                    <option value="1" selected>Comprador</option>
                    <option value="2">Vendedor</option>
                </select>
            </div>

            <div class="col-12">
                <button type="submit" class="btn btn-success boton_ingresar">Registrarme</button>
            </div>
        </form>
    </div>
</div>
<jsp:include page="../WEB-INF/pages/scripts.jsp"/>
<script src="../assets/js/usuario.js"></script>
</body>
</html>
