window.addEventListener('load', function(){
  const headerMenus = document.querySelectorAll('#header-menu1, #header-menu2, #header-menu3, #header-menu4');
  const pullDownMenu = document.getElementById('menu3-pull-down');
  const links = document.querySelectorAll('#user-name, #log-out-btn, #log-in-btn, #user-registration');

  for (let i = 0; i < headerMenus.length; i++) {
    headerMenus[i].addEventListener('mouseover', function(){
      this.style.textDecoration = 'underline';
    });
    headerMenus[i].addEventListener('mouseout', function(){
      this.style.textDecoration = 'none';
    });
  }

  headerMenu3.addEventListener('click', function(){
    pullDownMenu.style.display = pullDownMenu.style.display === 'block' ? 'none' : 'block';
  });

  for (let i = 0; i < links.length; i++) {
    links[i].addEventListener('mouseover', function(){
      this.style.textDecoration = 'underline';
    });
    links[i].addEventListener('mouseout', function(){
      this.style.textDecoration = 'none';
    });
  }
});