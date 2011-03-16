class ExpedientesController < ApplicationController

	def create
	end

	def edit
	end

	def show
		@codigoExpediente = params[:id]
		p @codigoExpediente
		unless @codigoExpediente.blank?
		  @codigo = Nino.encontrarCodigoPorExpediente(@codigoExpediente)
		  @nino = Nino.find_by_codigo(@codigo)
		 	@edad = Nino.encontrarEdad(@codigo)
			@direccion = Nino.direccion(@codigo)
			@expediente = Expediente.find_by_codigo(@codigoExpediente)
		else
			@nino = nil
		end


	end

	def update
	end

end
