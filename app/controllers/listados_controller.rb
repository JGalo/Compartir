class ListadosController < ApplicationController
	def busqueda
	  
		@educador = Educador.all
		@centros = Centro.all
		@ninos = Nino.buscar_por_parametros params
		@programas = Programa.buscar_distintos
	  respond_to do |format|
	 	 	  format.html
		    format.xls { send_data @ninos.to_xls_data, :filename => 'ninos.xls' }
	  end

	end
	def educador
		@educador = Educador.all
		@centro = Centro.all
	end
	def padrino
		@padrinos = Padrino.all
	end
end
