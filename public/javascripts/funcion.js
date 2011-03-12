
$(document).ready(function (){
	
	$("#desde").keyup(function (event){

			if(!isFinite($("#desde").val()))
			{
				$("#desde")[0].value = "";
			}
		}
	);
	$("#hasta").keyup(function (event){

			if(!isFinite($("#hasta").val()))
			{
				$("#hasta")[0].value = "";		
			}
		}
	);

	$(".educ").click(function(event){ 
					if(event.target.id == "todosEducadores"){ 
								
								 $(".educ").each( function(elemento){
										elem.checked = false				 
										}
								  );
								
								 
								 //elem.checked = false;
					} 
			}
	);
	
	}
);
