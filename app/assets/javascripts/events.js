 $(document).ready(function(){

	if (typeof(FullcalendarEngine) === 'undefined') { 
		FullcalendarEngine = {}; 
	}


	  $('[data-toggle="tooltip"]').tooltip();

	  $('#tasks-notes').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) 
	  var day = button.data('date')

	  $("input[name='task[task_date]']").val(day);
	  $("input[name='task_date']").val(day);

	  

		$("#new_task").submit(function(){
		      $.ajax({
		            type: "POST",
		            url: "/tasks", 
		            data: $('form#new_task').serialize(),
  		        });
		  });

	  });

   });



























 FullcalendarEngine = {
  Form: {
	    display: function(options) {
		      if (typeof(options) == 'undefined') { options = {} }
		      FullcalendarEngine.Form.fetch(options)
		    },
	    render: function(options){
	      
	      $('#create_event_dialog').dialog({
		        title: 'New Task',
		        modal: true,
		        width: 500,
		        close: function(event, ui) { $('#create_event_dialog').dialog('destroy') }
	      	});
	      },
	    fetch: function(options){
	      $.ajax({
	        type: 'get',
	        dataType: 'script',
	        async: true,
	        url:"/todos/new",
	        success: function(){ FullcalendarEngine.Form.render(options) }
	      });
	    },
	    
  	}
 } 