document.addEventListener("DOMContentLoaded", function() {
    const body = document.body;
    const savedMode = localStorage.getItem('mode');
    const logoImage = document.querySelector('.imagen_logo');

    if (savedMode === 'dark') {
        body.classList.add('dark-mode');
        logoImage.src = '../../recursos/img/privada/logo-dark.png';
    } else {
        body.classList.add('light-mode');
        logoImage.src = '../../recursos/img/privada/logo.png';
    }
    
});
