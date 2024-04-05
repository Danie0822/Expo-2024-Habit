document.addEventListener("DOMContentLoaded", function() {
    /* slider bar meter el html con js   */
    var sidebar = document.createElement("aside");
    sidebar.id = "sidebar";
    sidebar.innerHTML = `
        <div class="d-flex align-items-center">
            <a href="#" class="menu-link">
                <button class="toggle-btns" type="button">
                    <img src="../../recursos/img/privada/logito.png" alt="Imagen de menú">
                </button>
            </a>

            <div class="sidebar-logo">
                <a href="#">
                    HABBIT
                </a>
            </div>
        </div>

        <ul class="sidebar-menu">
            <li class="menu-item Paddding">
                <a href="#" class="menu-link">
                    <i class="mdi mdi-home"></i>
                    <span>Inicio</span>
                </a>
            </li>

            <li class="menu-item Paddding">
                <a href="#" class="menu-link collapsed has-dropdown" data-bs-toggle="collapse"
                    data-bs-target="#users" aria-expanded="false" aria-controls="users">
                    <i class="mdi mdi-account"></i>
                    <span>Usuario</span>
                </a>
                <ul id="users" class="menu-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                    <li class="menu-item">
                        <a href="#" class=" hover">Administradores</a>
                        <a href="#" class=" hover">Clientes</a>
                    </li>
                </ul>
            </li>

            <li class="menu-item Paddding">
                <a href="#" class="menu-link collapsed has-dropdown" data-bs-toggle="collapse"
                    data-bs-target="#classification" aria-expanded="false" aria-controls="classification">
                    <i class="mdi mdi-tag"></i>
                    <span>Clasificación</span>
                </a>
                <ul id="classification" class="menu-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                    <li class="menu-item">
                        <a href="#" class=" hover">Categorías</a>
                        <a href="#" class=" hover">Zonas</a>
                    </li>
                </ul>
            </li>

            <li class="menu-item Paddding">
                <a href="#" class="menu-link">
                    <i class="mdi mdi-home-city"></i>
                    <span>Propiedades</span>
                </a>
            </li>

            <li class="menu-item Paddding">
                <a href="ejemplo.html" class="menu-link">
                    <i class="mdi mdi-message"></i>
                    <span>Conversaciones</span>
                </a>
            </li>
            <li class="menu-item Paddding">
                <div class="switch-container light-mode">
                    <input type="checkbox" class="modo-switch" id="modo-switch" onclick="toggleMode()">
                    <label class="modo-label" for="modo-switch"></label>
                </div>  
            </li>
        </ul>
        <div class="sidebar-footer">
            <a href="./login.html" class="menu-link">
                <i class="mdi mdi-logout"></i>
                <span>Cerrar Sesión</span>
            </a>
        </div>
    `;
        // Hacer insert despues de menu"
        var menu = document.querySelector(".menu");
        menu.parentNode.insertBefore(sidebar, menu.nextSibling);
        const body = document.body;

         // poner el modo depediendo del usuario cambio "
        const savedMode = localStorage.getItem('mode');
        const modoSwitch = document.getElementById('modo-switch');
       // Validar el modo "
        if (savedMode === 'dark') {
          body.classList.add('dark-mode');
          modoSwitch.checked = true; 
        } else {
          body.classList.add('light-mode');
        }
    
        // boton de expandir el menu 
        document.querySelector(".toggle-btns").addEventListener("click", function() {
            document.getElementById("sidebar").classList.toggle("expand");
        });
    });
    
