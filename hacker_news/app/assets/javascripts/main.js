$(document).ready(function(){
  $('.post').on('submit', function(event) {
    event.preventDefault;
    $.ajax({
      url: event.target.action,
      method: event.target.method,
      data: $(event.target).serialize(),
      dataType: 'json'
    }).done(function(response){
      console.log(response);
      $("#span" + response.post_id).text(response.vote_count);
    }).fail(function(error){
      console.log(error);
    });
  });
});