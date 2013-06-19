$(document).ready(function(){

	var playSimonSays = '#get_color';

	$(playSimonSays).on('click', function(e){

		var colorRoute = { url:'/color', method: 'post'};
		
		$.ajax(colorRoute).done(function(box){

			$('ul li').eq(box.position).css('background-color', box.color);

		});
	});

}); 