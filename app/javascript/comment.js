window.addEventListener('load', () => {

  const paperPlane = document.querySelector('.fa-paper-plane');
  const commentBtn = document.querySelector('.comment-btn');

  paperPlane.addEventListener('click', (event) => {
    event.preventDefault();
    const form = document.querySelector('#comment-form');
    commentBtn.click();
    form.submit();
  });
});
