class ListadosController < ApplicationController
	def index
		@educador = Educador.all
		@centros = Centro.all
		@ninos = Nino.all
	end
	def educador
		@educador = Educador.all
		@centro = Centro.all
	end
	def padrino
		@padrinos = Padrino.all
	end
end
