
$( document ).ready( function( ) {
  $( '#gamediv' ).on( "keydown" , "#gameboard input" , function( event ) {
    $( this ).val('')
    if ( notNumericInput( event ) ) {
      event.preventDefault();
    } ;
  }) ;

  $( 'nav' ).on( "click" , "#register" , function( event ) {
    event.preventDefault();

    $.ajax({
      url: $( this ).attr( 'href' )
    })
    .done(function(response) {
      console.log(response)
      $('#gamediv').append(response)
      $('#myModal').modal('show');
    })

  }) ;

  $( 'nav' ).on( "click" , "#login" , function( event ) {
    event.preventDefault();

    $.ajax({
      url: $( this ).attr( 'href' )
    })
    .done(function(response) {
      console.log(response)
      $('#gamediv').append(response)
      $('#myModal').modal('show');
    })
  }) ;

  $( 'nav' ).on( "click" , "#new" , function( event ) {
    event.preventDefault();

    $.ajax({
      url: $( this ).attr( 'href' )
    })
    .done(function(response) {
      console.log(response)
      $('#gamediv').empty()
      $('#gamediv').append(response)
    })
  }) ;
});


var notNumericInput = function( event ) {
  var inputCode
  if ( event.keyCode ) {
    inputCode = event.keyCode
  } else {
    inputCode = event.which
  };
  if ( inputCode < 49 || inputCode > 58 ) {
    return true
  } else {
    return false
  }
}


