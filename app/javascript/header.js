window.addEventListener('load', function(){
  const headerMenus = document.querySelectorAll(".nav-item");
  const headerMenu3 = document.getElementById("header-menu3")
  const pullDownMenu = document.getElementById("menu3-pull-down");

  headerMenus.forEach(function(headerMenu) {
    headerMenu.addEventListener('mouseover', function(){
      this.style.textDecoration = 'underline';
    });

    headerMenu.addEventListener('mouseout', function(){
      this.style.textDecoration = 'none';
    });
  });

  headerMenu3.addEventListener('click', function(){
    if (pullDownMenu.getAttribute("style") == "display:block;") {
      pullDownMenu.removeAttribute("style", "display:block;");
    } else {
      pullDownMenu.setAttribute("style", "display:block;");
    }
  });
});