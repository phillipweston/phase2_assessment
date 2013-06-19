function addNote() {
	var postNote = { url: '/addnote', method: 'post', data: $('#add-note').serialize() };
	$.ajax(postNote).done(function(response){
		$('#notes').append(response);
	});
}

function deleteNote(note) {
	var deleteNote = { url: '/' + $(note).closest('div').attr('id'), method: 'delete' }
	$.ajax(deleteNote);
	$(note).closest('div').remove();
}

function updateNote(note) {
	var updateNote = { url: '/' + $(note).closest('div').attr('id'), method: 'put', data: $('#update-form').serialize() }
	console.log(updateNote);
	$.ajax(updateNote).done(function(response){
		$(note).closest('div').children().first().html(response.title);
		$(note).closest('div').children().first().html(response.title);
		$(note).closest('#update-form').remove();
	});
}

function updateForm(note) {
		var title = $(note).parent().find('div').first().text();
		var content = $(note).parent().find('div').last().text();
		var form = $('#form-update').clone();
		$(note).parent().append(form.html());
		$(note).parent().find('input[name="title"]').val(title);
		$(note).parent().find('input[name="content"]').val(content);

}


$(document).ready(function() {
	$('#submit-button').on('click', function(e){
		e.preventDefault();
		addNote();
	});

	$('.delete').on('click', function(e){
		e.preventDefault();
		deleteNote(this);
	});

	$('.update').on('click', function(e){
		e.preventDefault();
		updateForm(this);
	});

	$('.note').on('click', '#update-button', function(e){
		e.preventDefault();
		updateNote(this);
	});

});
