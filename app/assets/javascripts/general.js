$( document ).ready(function() {
  $(document).on('click', "#show-history", function(e){
    var element   = $('.query-history');
    var css       = element.css('display');
    e.preventDefault()

    if (css === 'none') {
      element.collapse('show');
      $(this).text('Ocultar histórico');
    }else{
      element.collapse('hide');
      $(this).text('Visualizar histórico');
    }    
  });
});