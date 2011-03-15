
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
								}}
					else
					{
												$(".educ")[0].checked = false;
				}}
	);
	
	$("#BotonCodigo").click(function(event){

					
	s = "ninos/" + $("#codigoN")[0].value;				
	window.location=s ;});

	$("#descargar").click(function(event){     
		window.location="/busqueda.db"; 				
	});

	$("#numerotlf ").click(function(event){ $("#educForm").append('<br/> <INPUT id = "telefono" TYPE="text" NAME="telefono[]" class=":required"><br/>' )     }) ;
	
	}
);
