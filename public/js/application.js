
$( document ).ready( function( ) {
  $('#gettweets').on("submit",function(event) {
    event.preventDefault() ;
    var $form = $(this)

    var url = $form.attr("action")
    var type = $form.attr("method")




  }) ;
});


