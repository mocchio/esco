window.addEventListener('load', function(){
  const headerMenu1 = document.getElementById("header-menu1");
  const headerMenu2 = document.getElementById("header-menu2");
  const headerMenu3 = document.getElementById("header-menu3");
  const pullDownMenu = document.getElementById("menu3-pull-down");
  const userName = document.getElementById("user-name");
  const logOut = document.getElementById("log-out-btn");
  const logIn = document.getElementById("log-in-btn");
  const userRegistration = document.getElementById("user-registration");

  headerMenu1.addEventListener('mouseover', function(){
    this.style.textDecoration = 'underline';
  });

  headerMenu1.addEventListener('mouseout', function(){
    this.style.textDecoration = 'none';
  });

  headerMenu2.addEventListener('mouseover', function(){
    this.style.textDecoration = 'underline';
  });

  headerMenu2.addEventListener('mouseout', function(){
    this.style.textDecoration = 'none';
  });

  headerMenu3.addEventListener('mouseover', function(){
    this.style.textDecoration = 'underline';
  });

  headerMenu3.addEventListener('mouseout', function(){
    this.style.textDecoration = 'none';
  });

  headerMenu3.addEventListener('click', function(){
    if (pullDownMenu.getAttribute("style") == "display:block;") {
      pullDownMenu.removeAttribute("style", "display:block;");
    } else {
      pullDownMenu.setAttribute("style", "display:block;");
    }
  });

  userName.addEventListener('mouseover', function(){
    this.style.textDecoration = 'underline';
  });

  userName.addEventListener('mouseout', function(){
    this.style.textDecoration = 'none';
  });

  logOut.addEventListener('mouseover', function(){
    this.style.textDecoration = 'underline';
  });

  logOut.addEventListener('mouseout', function(){
    this.style.textDecoration = 'none';
  });

  logIn.addEventListener('mouseover', function(){
    this.style.textDecoration = 'underline';
  });

  logIn.addEventListener('mouseout', function(){
    this.style.textDecoration = 'none';
  });

  userRegistration.addEventListener('mouseover', function(){
    this.style.textDecoration = 'underline';
  });

  userRegistration.addEventListener('mouseout', function(){
    this.style.textDecoration = 'none';
  });
});