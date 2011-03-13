class FormulariosController < ApplicationController
	protect_from_forgery :only => [:create, :update, :destroy]
	
	def ninoform
	end

	def padrinos
		@padrinos = Padrino.all
	end

	def padriform
	end

	def programas
		@programas = Programa.all
	end

	def savePrograma
		Programa.insertar params
		@programas = Programa.all
		render "/formularios/programas"
	end

	def savePadrino
		Padrino.insertar params
		@padrinos = Padrino.all
		render "/formularios/padrinos"
	end

	def saveEducador
	  @educador = Educador.all
		render "/formularios/educaform"
	end
	def educaform
		@educador = Educador.all
	end

	def centroform
	@centros = Centro.all
	end

	def loginform
	end

	def reporte
		@nombre = "Juan"
		@codigo = "1232190349"
		@apellido = "Perez"
		@fechaNac = "1997-10-10"
		@edad = "13"
		@educador = "E00001"
		@direccion = "blah blah blah"
		@sexo = "m"
	end
end
