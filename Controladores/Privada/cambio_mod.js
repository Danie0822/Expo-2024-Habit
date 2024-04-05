/* funcion de cambio de modo   */
function toggleMode() {
    const body = document.body;
    const isLightMode = body.classList.contains('light-mode');
    if (isLightMode) {
      body.classList.remove('light-mode');
      body.classList.add('dark-mode');
      /* Guarda el cambio en local storage  */
      localStorage.setItem('mode', 'dark');
    } else {
      body.classList.remove('dark-mode');
      body.classList.add('light-mode');
      /* Guarda el cambio en local storage  */
      localStorage.setItem('mode', 'light');
    }
  }
  
  