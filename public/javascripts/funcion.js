
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
	}
);
