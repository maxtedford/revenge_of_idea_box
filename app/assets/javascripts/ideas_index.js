var ideaList = {
  truncateBodies: function() {
    $('.idea-body').each(function(index, idea) {
      if ($(this).text().length > 100) {
        return $(this).text().substr(0, 100);
      } else {
        return $(this).text()
      }
    });
  }
};

$(document).ready(function() {
  $('#idea-save').click(function(event) {
    event.preventDefault();
    console.log("fisst");
    var title = document.getElementById('idea-title');
    console.log("second");
    var body = document.getElementById('idea-body');
    console.log("third");
    $.ajax({
      method: "POST",
      url: "/ideas.json",
      data: { title: title, body: body }
    })
      .done(function( msg ) {
        alert( "Data Saved: " + msg );
      });
    console.log("fourth");
    $('#idea-title').val("");
    $('#idea-body').val("");
    ideaList.truncateBodies();
  });
});
