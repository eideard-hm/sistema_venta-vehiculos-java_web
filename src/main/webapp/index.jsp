<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Página Inicio.</title>
    <link rel="shortcut icon" href="assets/img/Logo programa.ico" type="image/x-icon"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
          rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/estilos.css"/>
</head>
<body>
<header class="header">
    <div class="contenedor barra">
        <a href="#" class="content-logo">
            <img src="assets/img/Logo programa.png" alt="PonsLabor" class="logo"/>
            <h2>Pons<span>Labor.</span></h2>
        </a>
        <nav class="nav">
            <a href="#">Inicio</a>
            <a href="#">Proyectos</a>
            <a href="usuario/login.jsp" class="btn-init iniciar">Iniciar sesión</a>
            <a href="usuario/usuario.jsp" class="btn-init registro">Registrarse</a>
        </nav>
    </div>
</header>

<!-- barra de scroll horizontal -->
<div class="indicador-contenedor">
    <div class="indicador-scroll"></div>
</div>
<!-- seccion  -->

<section class="slider-img">
    <div class="slider active">
        <img src="assets/img/img2.svg" alt="Frameworks de js"/>
        <div class="info-slider">
            <h2>Sección 2</h2>
            <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur
                praesentium quia porro velit voluptatibus quam accusantium obcaecati
                sint? Expedita, quasi.
            </p>
        </div>
    </div>

    <div class="slider">
        <img src="assets/img/img3.svg" alt="React"/>
        <div class="info-slider">
            <h2>Sección 3</h2>
            <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur
                praesentium quia porro velit voluptatibus quam accusantium obcaecati
                sint? Expedita, quasi.
            </p>
        </div>
    </div>

    <div class="slider">
        <img src="assets/img/img4.svg" alt="Desarrollador"/>
        <div class="info-slider">
            <h2>Sección 4</h2>
            <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur
                praesentium quia porro velit voluptatibus quam accusantium obcaecati
                sint? Expedita, quasi.
            </p>
        </div>
    </div>

    <div class="slider">
        <img src="assets/img/img5.svg" alt="Programador"/>
        <div class="info-slider">
            <h2>Sección 5</h2>
            <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Tenetur
                praesentium quia porro velit voluptatibus quam accusantium obcaecati
                sint? Expedita, quasi.
            </p>
        </div>
    </div>

    <div class="btns">
        <div class="btn active"></div>
        <div class="btn"></div>
        <div class="btn"></div>
        <div class="btn"></div>
        <div class="btn"></div>
    </div>
</section>

<section class="contenedor seccion-scroll">
    <p>
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur
        adipisci porro nobis nam, molestias maiores exercitationem quia in
        dolore? Atque ea exercitationem quaerat impedit voluptate debitis, omnis
        molestiae a repudiandae harum eius est sed, dignissimos minima delectus
        eveniet earum perspiciatis libero ipsam totam. Cupiditate eum saepe quos
        modi repellendus doloremque mollitia, ipsa quod quas autem consectetur
        nostrum commodi culpa doloribus architecto et accusantium consequuntur
        optio. Impedit quae fugit veritatis delectus eveniet, enim blanditiis
        tenetur unde excepturi porro est illum ex, facilis nihil ipsum sed nulla
        hic optio! Neque dolorum, quae voluptas laborum sed expedita a, ex
        beatae quam ullam esse.
    </p>
    <br/>

    <p>
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur
        adipisci porro nobis nam, molestias maiores exercitationem quia in
        dolore? Atque ea exercitationem quaerat impedit voluptate debitis, omnis
        molestiae a repudiandae harum eius est sed, dignissimos minima delectus
        eveniet earum perspiciatis libero ipsam totam. Cupiditate eum saepe quos
        modi repellendus doloremque mollitia, ipsa quod quas autem consectetur
        nostrum commodi culpa doloribus architecto et accusantium consequuntur
        optio. Impedit quae fugit veritatis delectus eveniet, enim blanditiis
        tenetur unde excepturi porro est illum ex, facilis nihil ipsum sed nulla
        hic optio! Neque dolorum, quae voluptas laborum sed expedita a, ex
        beatae quam ullam esse.
    </p>
    <br/>

    <p>
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur
        adipisci porro nobis nam, molestias maiores exercitationem quia in
        dolore? Atque ea exercitationem quaerat impedit voluptate debitis, omnis
        molestiae a repudiandae harum eius est sed, dignissimos minima delectus
        eveniet earum perspiciatis libero ipsam totam. Cupiditate eum saepe quos
        modi repellendus doloremque mollitia, ipsa quod quas autem consectetur
        nostrum commodi culpa doloribus architecto et accusantium consequuntur
        optio. Impedit quae fugit veritatis delectus eveniet, enim blanditiis
        tenetur unde excepturi porro est illum ex, facilis nihil ipsum sed nulla
        hic optio! Neque dolorum, quae voluptas laborum sed expedita a, ex
        beatae quam ullam esse.
    </p>
</section>

<!-- botón de ir hacia arriba -->
<div id="ir-arriba" class="ocultar">
    <i class="fas fa-chevron-up"></i>
</div>

<script src="https://kit.fontawesome.com/ff77c957bf.js" crossorigin="anonymous"></script>
<script src="../assets/js/app.js"></script>
</body>
</html>

