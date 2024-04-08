// *Método del evento para cuando el documento ha cargado.
document.addEventListener('DOMContentLoaded', async () => {
  // *Llamada a la función para mostrar el encabezado y pie del documento.
  loadTemplate();
  ocultarContenedor();
});

// Función para ocultar el contenedor y la imagen cuando la pantalla tiene un ancho mínimo de 760px
function ocultarContenedor() {
  var anchoPantalla = window.innerWidth;
  var elementos = document.getElementsByClassName('as');

  if (anchoPantalla <= 760) {
      document.getElementById('divImg').classList.add('d-none');
      document.getElementById('divImgContacs').classList.add('d-none');
      document.getElementById('divContactosTexts').classList.remove('col-6');
      document.getElementById('divContactosTexts').classList.add('col-12');
      for (var i = 0; i < elementos.length; i++) {
          elementos[i].classList.remove('col-5');
          elementos[i].classList.add('col-10');
      }

  } else {
      document.getElementById('divImg').classList.remove('d-none');
      document.getElementById('divImgContacs').classList.remove('d-none');
      document.getElementById('divContactosTexts').classList.add('col-6');
      document.getElementById('divContactosTexts').classList.remove('col-12');
      for (var i = 0; i < elementos.length; i++) {
          elementos[i].classList.remove('col-10');
          elementos[i].classList.add('col-5');
      }
  }

}

// Ejecutar la función al cargar la página y al cambiar el tamaño de la ventana
window.onload = ocultarContenedor;
window.onresize = ocultarContenedor;