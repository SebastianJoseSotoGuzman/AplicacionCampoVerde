// Modal
var modal = document.getElementById("paymentModal");

var img = document.getElementById("cardImage");
var span = document.getElementsByClassName("close")[0];

img.onclick = function() {
  modal.style.display = "flex";
}
span.onclick = function() {
  modal.style.display = "none";
}

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
