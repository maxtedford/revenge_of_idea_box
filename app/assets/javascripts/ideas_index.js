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
    var body = document.getElementById('idea-body');
    $.post("/ideas.json", {idea: {title: title, body: body}}).then(function(idea) {
      $('#idea-list').prepend('<li class="list-group-item" id="' + idea.id + 
      '"><h3 class="idea-title">' + 
      title.value + '</h3><br><p class="idea-body">' + 
      body.value + '</p><br><p class="idea-quality">Quality: ' + idea.quality + 
      '</p></li>');
    });
    $('#idea-title').val("");
    $('#idea-body').val("");
    ideaList.truncateBodies();
  });
});
