$(document).ready(function() {
  $('#comment-form').hide();
  handleVote();
  handleCommentFormShow()
});

function handleVote() {
	$('.vote-form').on('submit', function() {
		event.preventDefault();

		var $form = $(this);
		var $url = $form.attr('action');
		var $data = $form.serialize();

		var $AJAX = $.ajax({
			url: $url,
			method:'POST',
			data: $data
		});

		$AJAX.done( function(response) {
			$form.parent().find('.vote-sum').text(response);
		});
	});
};

function handleCommentFormShow() {
	$('#add-comment').on('click', function() {
		event.preventDefault();
		$(this).hide();
		$('#comment-form').slideDown();
	})
}

function handleCommentFormSubmit() {
	$('#comment-form').on('submit', function() {
		event.preventDefault();

		var $form = $(this);
		var $url = $form.attr('action');
		var $data = $form.serialize();

		var $AJAX = $.ajax({
			url: $url,
			method: 'POST',
			data: $data
		})

		$AJAX.done( function(response) {

		});
	});
};
