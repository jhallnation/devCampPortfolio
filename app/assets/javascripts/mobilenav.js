$(document).on('turbolinks:load', function(){
  $('.mobile-nav').hide();
  $('.mobile-icon').click(function() {
  $('.mobile-nav').slideToggle(500);
})})

