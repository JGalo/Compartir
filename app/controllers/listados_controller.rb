class ListadosController < ApplicationController
	def busqueda
	  
		@educador = Educador.all
		@centros = Centro.all
		@ninos = Nino.buscar_por_parametros params
		@programas = Programa.buscar_distintos
	  respond_to do |format|
	 	 	  format.html

		    format.xls { send_data Nino.tabSeparated(@ninos), :filename => 'ninos.txt' }
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
