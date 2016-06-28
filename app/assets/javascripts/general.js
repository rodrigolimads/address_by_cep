$( document ).ready(function() {
  $(document).on('click', "#show-history", function(e){
    var element   = $('.query-history');
    var css       = element.css('display');
    e.preventDefault()

    if (css === 'none') {
      element.collapse('show');
      $(this).text('Hide history');
    }else{
      element.collapse('hide');
      $(this).text('Show history');
    }    
  });

  $( "#new_query_form" ).submit(function( event ) {
    $('.query-result').html('');
    $('.alert-danger').remove();
    $('.text-error').remove();
    $('.form-group').removeClass('has-error');
  });
});