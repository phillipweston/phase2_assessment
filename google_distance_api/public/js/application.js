// function 


$(document).ready(function () {

  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  });

  $('.add').on('click', function(e){
  	e.preventDefault();
  	var updateTrips = $.ajax({ url: '/update', method: 'post', data: { 'id': $(this).prev().attr('id')}});
  	updateTrips.done(function(new_total){ $('#' + new_total.id).html(new_total.times) });
  });

});
