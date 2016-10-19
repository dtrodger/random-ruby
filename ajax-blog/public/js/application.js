$(document).ready(function() {
  voteSubmit();
  postDelete();
  postCreate();
  showPostForm();
});

function voteSubmit() {
	$(".vote-form").on('submit', function() {
		event.preventDefault();

		var $form = $(this)
		var $ajax = $.ajax({
			url: $form.attr('action'),
			method: $form.attr('method')
		});

		$ajax.done(function(response) {
			$form.closest('.post').find('.points').text(response['num_votes'])
			$form.find('.upvote-button').addClass('voted');
		});

		$ajax.fail(function(response) {
			alertErrors(response['errors']);
		})
	});
};


function showPostForm() {
	$('#new-post').on('click', function() {
		event.preventDefault();
		$aTag = $(this)

		var $ajax = $.ajax({
			url: $aTag.attr('href')
		})

		$ajax.done(function(response) {
			$aTag.hide();
			$('.new-post-section').append(response);
		})
	})
}


function postCreate() {
	$('.new-post-section').on('click', '#submit-post', function() {
		event.preventDefault();

		var $form = $(this).closest('form');

		var $ajax = $.ajax({
			url: $form.attr('action'),
			method: $form.attr('method'),
			data: $form.serialize()
		});

		$ajax.success(function(response) {
			$('.post-container').append(response);
			$form.remove()
			$('#new-post').show();
		});

		$ajax.fail(function(response) {
			alertErrors([response.responseText]);
		})
	});
};


function postDelete() {
	$('.post-container').on('click', '.delete', function() {
		event.preventDefault();

		var $aTag = $(this)

		var $ajax = $.ajax({
			url: $aTag.attr('href'),
			method: 'delete'
		})

		$ajax.done(function() {
			$aTag.parent().parent().remove();
		})

		$ajax.fail(function(response) {

		}) 
	})
}

function alertErrors(errors) {
	var message = "ERROR: ";
	for (index in errors) {
		message += errors[index] + ". ";
	}
	alert(message);
};
