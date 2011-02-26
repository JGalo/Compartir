class ListadosController < ApplicationController
	def index
		@educador = Educador.all
		@centros = Centro.all
	end

	def busqueda
		@imprime = params[:educ]
	end
end
