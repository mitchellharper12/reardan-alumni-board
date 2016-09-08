
	function add_overlay(data) {
		console.log(data);
		var overlay = $('<div>');
		overlay.attr("id", `overlay-${data.id}`);
		overlay.addClass('overlay');
		var x = data.x;
		var y = data.y;
		var width = data.x2 - x;
		var height = data.y2 - y;
		overlay.attr('style', `position: absolute; left: ${x}px; top: ${y}px; z-index: 500; width: ${width}px; height: ${height}px`);
		var span = $('<p>');
		span.text(data.firstname + ' ' + data.middlename + ' ' + data.lastname);
		overlay.append(span);
		var form = $('<form>');
		form.attr('action', '/graduates/' + data.id);
		form.attr('id', 'remove-grad-form-' + data.id);
		form.addClass('edit_graduate');
		form.attr('data-grad', data.id);
		form.attr('method', 'post');

		var _method = $('<input>');
		_method.attr('name', '_method');
		_method.attr('value', 'delete');
		_method.attr('type', 'hidden');
		form.append(_method);

		var token = $('<input>');
		token.attr('name', 'authenticity_token');
		token.attr('type', 'hidden');
		token.attr('value', $('meta[name="csrf-token"]')[0].content);
		form.append(token);

		var submit = $('<input>');
		submit.attr('id', 'delete-submit-' + data.id);
		submit.attr('name', 'commit');
		submit.attr('value', 'Remove');
		submit.attr('type', 'submit');
		form.append(submit);

		overlay.append(form);
		

		$('.jcrop-holder').append(overlay);

		register_delete_form(data.id);


	}

	function register_delete_form(id) {
		$('#remove-grad-form-' + id).submit(function(event) {
			return false;
		});
		$('#delete-submit-' + id).click(function(event) {
			var form = $('#remove-grad-form-' + id);
			var form_fields = form.serialize();
			var action_text = form.attr('action');
			$.ajax({
				url: action_text,
				method: 'delete',
				data:  form_fields,
				success: function(data) {
					$('#overlay-' + id).remove();
				},
				error: function(data) {
					// todo implement
				}
			});
			return false;
		});
	}

	function noteCoords(c) {
		var bubble = $('#bubble');
		bubble.attr('style', 'position: absolute; left: ' + (c.x2 + 10) + 'px; top: ' + c.y + 'px; z-index: 701;');
		crop_coords = {};
		crop_coords.x = c.x;
		crop_coords.x2 = c.x2;
		crop_coords.y = c.y;
		crop_coords.y2 = c.y2;
	}
