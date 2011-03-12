class ListadosController < ApplicationController
	def busqueda
	  p params
		@educador = Educador.all
		@centros = Centro.all
		@ninos = Nino.buscar_por_parametros params
		@programas = Programa.buscar_distintos
	end
	def educador
		@educador = Educador.all
		@centro = Centro.all
	end
	def padrino
		@padrinos = Padrino.all
	end
end
