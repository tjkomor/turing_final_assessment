$(document).ready(function(){
  buttonListeners();
})

function buttonListeners(){
  $('.read').each(function(index, button){
    $(button).on('click', function(){
      changeStatus($(this).parent(), 'true');
    });
  });

  $('.unread').each(function(index, button){
    $(button).on('click', function(){
      changeStatus($(this).parent(), 'false');
    })
  });
}

function changeStatus(link, status) {
  if(link.attr('boolean-status') != status){
    var data = {link: {
      read: status
    }}
    $.ajax({
        url: "api/v1/links/" + link.attr('data-id'),
        method: "PUT",
        data: data,
        success: function(){
          $(link).attr('boolean-status', status);
          $(link).find('.read-status').text('Read? ' + status);
        },
        error: function(response){
          console.log(response, "update failed")
        }
    });
  }
}
