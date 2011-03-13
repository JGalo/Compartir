class FormulariosController < ApplicationController
	def ninoform
	end

	def padrinos
	end

	def padriform
	end

	def programas
	end

	def educaform
	end

	def centroform
	@centros = Centro.all
	end

	def loginform
	end

	def reporte
	end
end
