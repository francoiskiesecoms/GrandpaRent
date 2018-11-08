function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-grandparents');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-grandparents-white');
      } else {
        navbar.classList.remove('navbar-grandparents-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
