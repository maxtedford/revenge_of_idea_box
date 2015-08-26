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

function createIdea() {
  $('#idea-save').on('click', function() {
    var ideaParameters = {
      title: $('#idea-title').val(),
      body: $('#idea-body').val()
    };
    
    $.post("/ideas", ideaParameters).then(function(idea) {
      prependIdea(idea);
    });

    $('#idea-title').val("");
    $('#idea-body').val("");
  })
}

function prependIdea(idea) {
  $('#idea-list').prepend(
    '<li class="list-group-item" data-id=' + idea.id
    + '> <h3 class="idea-title">' + idea.title
    + '</h3><br><p class="idea-body">' + idea.body
    + '</p><br><p class="idea-quality">Quality: ' + idea.quality
    + '</p><br><button id="idea-edit" class="btn btn-default">Edit</button><br><button id="idea-delete" class="btn btn-default">Delete</button> </li>'
  );
  
  ideaList.truncateBodies();
}

function deleteIdea() {
  $('#idea-delete').on('click', function() {
    var listItem = $(this).closest('.list-group-item');
    var ideaID = ($(this).parent().data().id);
    
    $.ajax({
      method: "DELETE",
      url: "/ideas/" + ideaID,
      data: { id: ideaID }
    }).done(function() {
      listItem.remove();
    }).fail(function() {
      alert("Request failed")
    })
  })
}

$(document).ready(function() {
  createIdea();
  deleteIdea();
});
