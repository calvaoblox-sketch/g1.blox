/* =====================================================================
   BloxG1 - Portal de notícias do Roblox (estilo G1)
   Arquivo: script.js
   ---------------------------------------------------------------------
   Funcionalidades:
     1. Data atual em tempo real (formato brasileiro).
     2. Relógio com atualização a cada segundo.
     3. Ano automático no rodapé.
     4. Menu mobile (abrir/fechar).
     5. Destaque do link ativo na navegação.

   COMO PERSONALIZAR:
     - Mudar o formato da data/hora: edite as funções abaixo.
     - O código está comentado parte a parte para facilitar ajustes.
   ===================================================================== */

document.addEventListener('DOMContentLoaded', function () {
  // Elementos do DOM que serão atualizados
  var dateEl = document.getElementById('current-date');
  var timeEl = document.getElementById('current-time');
  var yearEl = document.getElementById('current-year');
  var menuToggle = document.getElementById('menu-toggle');
  var mainNav = document.getElementById('main-nav');
  var navLinks = document.querySelectorAll('.main-nav__link');

  /* -------------------------------------------------------------------
     1 e 2. DATA E RELÓGIO EM TEMPO REAL
     Usa Intl.DateTimeFormat para exibir no padrão brasileiro,
     independentemente do idioma do navegador do visitante.
     ------------------------------------------------------------------- */
  var dateFormatter = new Intl.DateTimeFormat('pt-BR', {
    weekday: 'long',
    day: '2-digit',
    month: 'long',
    year: 'numeric'
  });

  var timeFormatter = new Intl.DateTimeFormat('pt-BR', {
    hour: '2-digit',
    minute: '2-digit',
    second: '2-digit',
    hour12: false
  });

  // Capitaliza a primeira letra (ex.: "domingo" -> "Domingo")
  function capitalize(text) {
    return text.charAt(0).toUpperCase() + text.slice(1);
  }

  // Atualiza os elementos de data e hora
  function updateClock() {
    var now = new Date();

    if (dateEl) {
      dateEl.textContent = capitalize(dateFormatter.format(now));
    }
    if (timeEl) {
      timeEl.textContent = timeFormatter.format(now);
    }
  }

  // Executa imediatamente e depois a cada segundo
  updateClock();
  setInterval(updateClock, 1000);

  /* -------------------------------------------------------------------
     3. ANO AUTOMÁTICO NO RODAPÉ
     Evita ter que atualizar o copyright manualmente todo ano.
     ------------------------------------------------------------------- */
  if (yearEl) {
    yearEl.textContent = new Date().getFullYear();
  }

  /* -------------------------------------------------------------------
     3-B. TICKER DE ÚLTIMAS (loop infinito)
     Duplicamos as manchetes: a animação CSS desloca -50%, então a
     segunda cópia entra exatamente quando a primeira sai de cena.
     ------------------------------------------------------------------- */
  var tickerTrack = document.getElementById('ticker-track');
  if (tickerTrack) {
    // Clona todos os itens originais e adiciona ao final da faixa
    var originalItems = Array.prototype.slice.call(
      tickerTrack.querySelectorAll('.ticker__item')
    );
    originalItems.forEach(function (item) {
      var clone = item.cloneNode(true);
      clone.setAttribute('aria-hidden', 'true'); // evita leitura duplicada
      tickerTrack.appendChild(clone);
    });
  }

  /* -------------------------------------------------------------------
     4. MENU MOBILE
     Alterna a classe "is-open" no menu e no botão hambúrguer.
     ------------------------------------------------------------------- */
  if (menuToggle && mainNav) {
    menuToggle.addEventListener('click', function () {
      var isOpen = mainNav.classList.toggle('is-open');
      menuToggle.classList.toggle('is-open', isOpen);
      menuToggle.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
    });

    // Fecha o menu ao clicar em uma categoria (útil no mobile)
    navLinks.forEach(function (link) {
      link.addEventListener('click', function () {
        mainNav.classList.remove('is-open');
        menuToggle.classList.remove('is-open');
        menuToggle.setAttribute('aria-expanded', 'false');
      });
    });
  }

  /* -------------------------------------------------------------------
     5. DESTAQUE DO LINK ATIVO
     Ao clicar numa categoria, marca apenas ela como ativa.
     ------------------------------------------------------------------- */
  navLinks.forEach(function (link) {
    link.addEventListener('click', function (event) {
      event.preventDefault(); // impede o "#" de pular a página
      navLinks.forEach(function (l) { l.classList.remove('is-active'); });
      link.classList.add('is-active');
    });
  });
});
