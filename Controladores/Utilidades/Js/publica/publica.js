/*
*   Controladores de uso general en las páginas web del sitio público.
*   Sirve para manejar las plantillas del encabezado y pie del documento.
*/

//* Constante para establecer el elemento del contenido principal.
const MAIN = document.querySelector('main');

/* Función asíncrona para cargar el encabezado y pie del documento.
*   Parámetros: ninguno.
*   Retorno: ninguno.*/

const loadTemplate = async () => {
    // *Se agrega el encabezado de la página web antes del contenido principal.
    MAIN.insertAdjacentHTML('beforebegin', `
    <header class="sticky-top">
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid ms-4 mt-2">
                <a class="navbar-brand" href="../Publica/index.html">
                    <img src="../../Recursos/Img/Publica/logoAmarrillo.svg" alt="Logo de habbit" width="50" height="50">
                </a>
                <button class="navbar-toggler justify-content-center" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-center" id="navbarText">
                    <div class="col-9">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 col-10 d-flex justify-content-center">
                            <li class="nav-item m-3">
                                <a class="nav-link azul1" aria-current="page" href="#sobreNosotros">Acerca de habit</a>
                            </li>
                            <li class="nav-item m-3">
                                <a class="nav-link azul1" href="#nuestroEquipo">Nuestro equipo</a>
                            </li>
                            <li class="nav-item m-3">
                                <a class="nav-link azul1" href="#">Proyectos</a>
                            </li>
                            <li class="nav-item m-3">
                                <a class="nav-link azul1" href="#">Servicios</a>
                            </li>
                        </ul>
                    </div>
                    <span class="navbar-text col-2 justify-content-center">
                        <a href="#contactanos" class="col-12">
                            <button id="btnContactanos" type="button" class="btn amarrilo1 contactanosButton col-12 text-white">
                                Contáctanos
                            </button>
                        </a>
                    </span>
                </div>
            </div>
        </nav>
    </header>
    `);
    //* Se agrega el pie de la página web después del contenido principal.
    MAIN.insertAdjacentHTML('afterend', `
    
`);
}