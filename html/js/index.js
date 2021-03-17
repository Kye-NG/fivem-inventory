$(function() {
  function display(bool) {
    if (bool) {
      $("#test").show();
    } else {
      $("#test").hide();
    }
  }

  display(false);

  $.post('https://fivem-inventory/main', JSON.stringify({ text: 'Loaded'}));


  document.onkeyup = function (data) {
    if (data.which == 9) {
      $.post('https://fivem-inventory/exit', JSON.stringify({}));
    }
  };

  // $.post('http://fivem-inventory/main', JSON.stringify({ text: 'hello'}));

  window.addEventListener('message', function(event) {
    const item = event.data;

    if (item.type === "ui") {
      if (item.status == true) {
        display(true)
      } else {
        display(false)
      }
    }
  })
})

console.log('test');