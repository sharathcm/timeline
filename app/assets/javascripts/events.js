 $(document).ready(function(){

	if (typeof(FullcalendarEngine) === 'undefined') { 
		FullcalendarEngine = {}; 
	}

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