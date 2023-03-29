window.addEventListener('load', function(){
  const roomNames = document.querySelectorAll(".room_name");

  roomNames.forEach(function(roomName) {
    roomName.addEventListener('click', function(){
      const headerRoomName = document.getElementById("header-room-name");
      headerRoomName.textContent = roomName.textContent;

      const roomId = roomName.dataset.roomId;
      const currentUrl = window.location.href;
      const baseUrl = currentUrl.split('?')[0];
      const newUrl = `${baseUrl}?room_id=${roomId}`;
      window.history.pushState({path: newUrl}, '', newUrl);

      fetch(`/rooms/${roomId}/chats`)
        .then(response => response.text())
        .then(data => {
          const parser = new DOMParser();
          const html = parser.parseFromString(data, 'text/html');
          const chatBody = html.querySelector(".chat-body");
          const chatBodyHtml = chatBody.innerHTML;
          const chatBodyElement = document.querySelector(".chat-body");
          chatBodyElement.innerHTML = chatBodyHtml;
        });
    });
  });
})