// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function () {
	$('label').addClass('control-label');
	
	$( "#dashboard tbody tr" ).draggable({
		helper: "clone"
	});
	$("#dashboard tbody tr, #dashboard thead").droppable({
		activeClass: "ui-state-default",
		hoverClass: "ui-state-hover",
		accept: ":not(.ui-sortable-helper)",
		drop: function(event, ui) {
			$(this).find( ".placeholder" ).remove();
			
			var draggedElement = $(ui.draggable); 
			draggedElement.insertAfter(this);
			
			var taskId = draggedElement.attr('rel');
			
			var parentElement = $(this).parent();
			if (parentElement.get(0).tagName == 'TBODY') {
				parentElement = parentElement.parent();
			}
			var statusId = parentElement.attr('rel');
			
			//alert('Task ' + taskId + ' was dropped into the status ' + statusId);
			
			$.ajax({
				type: "POST",
				url: '/move_task/',
				data: {
					'task_id': taskId,
					'status_id': statusId,
					'user_id': $('#user_id').val()
				},
				dataType: 'html',
				success: function(msg) {
					//alert( "Data Saved: " + msg );
				}
			});
		}
	});
	
});
