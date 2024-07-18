
function loadMessages() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'chat?ajax=true', true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            document.getElementById('messages').innerHTML = xhr.responseText;
        }
    };
    xhr.send();
}

function startLoadingMessages() {
    loadMessages();
    setInterval(loadMessages, 1000); // Refrescar cada 5 segundos
}

document.querySelector('.input-file').addEventListener('change', function (event) {
    const fileName = event.target.files[0].name;
    const nextSibling = event.target.nextElementSibling;
    nextSibling.innerText = fileName;
});