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
  $('#idea-save').on('click', function(event) {
    event.preventDefault();
    var ideaParameters = {
      title: $('#idea-title').val(),
      body: $('#idea-body').val()
    };
    
    $.post("/ideas", ideaParameters).then(function(idea) {
      prependIdea(idea);
    }).then(function() {
      deleteIdea();
      increaseQuality();
      decreaseQuality();
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
    + '</p><button type="button" class="btn btn-default" id="thumbs-up" aria-label="Thumbs Up">'
    + '<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span></button>'
    + '<button type="button" class="btn btn-default" id="thumbs-down" aria-label="Thumbs Down">'
    + '<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span>'
    + '</button><br><p class="idea-quality">Quality: ' + idea.quality
    + '</p><br><button id="idea-edit" class="btn btn-default">Edit</button><br><button id="idea-delete" class="btn btn-default">Delete</button> </li>'
  );
  
  ideaList.truncateBodies();
}

function deleteIdea() {
  $('#idea-delete').on('click', function(event) {
    event.preventDefault();
    var listItem = $(this).closest('.list-group-item');
    var ideaId = $(this).parent().data().id;
    
    $.ajax({
      method: "DELETE",
      url: "/ideas/" + ideaId,
      data: { id: ideaId }
    }).done(function() {
      listItem.remove();
      deleteIdea();
    }).fail(function() {
      alert("Request failed")
    })
  })
}

function increaseQuality() {
  $('#thumbs-up').on('click', function(event) {
    event.preventDefault();
    var ideaId = $(this).parent().data().id;
    var ideaParameters = {
      id: ideaId
    };
    var paragraph = $(this).parent().find('.idea-quality');
    
    $.post('/increase', ideaParameters).then(function(idea) {
      updatePage(idea, paragraph);
    })
  })
}

function decreaseQuality() {
  $('#thumbs-down').on('click', function(event) {
    event.preventDefault();
    var ideaId = $(this).parent().data().id;
    var ideaParameters = {
      id: ideaId
    };
    var paragraph = $(this).parent().find('.idea-quality');

    $.post('/decrease', ideaParameters).then(function(idea) {
      updatePage(idea, paragraph);
    })
  })
}

function updatePage(idea, paragraph) {
  paragraph.html(
    '<p class="idea-quality">Quality: ' + idea.quality + '</p>'
  )
}

$(document).ready(function() {
  createIdea();
  deleteIdea();
  increaseQuality();
  decreaseQuality();
});
