/* funcionalidad de modo oscuros y claro   */

document.addEventListener("DOMContentLoaded", function() {
    const body = document.body;
    const savedMode = localStorage.getItem('mode');
    const logoImage = document.querySelector('.imagen_logo');

    if (savedMode === 'dark') {
        body.classList.add('dark-mode');
        /* cambio de imagen   */
        logoImage.src = '../../recursos/img/privada/logo-dark.png';
    } else {
        body.classList.add('light-mode');
            /* cambio de imagen   */
        logoImage.src = '../../recursos/img/privada/logo.png';
    }
    
});
