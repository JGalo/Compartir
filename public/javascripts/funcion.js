
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
								
								 x = $(".educ").length;
								 for ( i =1; i < x; i ++){
												 $(".educ")[i].checked = false;
								}
								 
								 //elem.checked = false;
					} 
					else
					{
												$(".educ")[0].checked = false;
				}}
	);
	
	}
);
