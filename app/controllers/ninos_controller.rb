

class NinosController < ApplicationController
	protect_from_forgery :only => [:create, :update, :destroy]

	def index
		@ninos = Nino.all
		respond_to do |format|
		        format.html
					  format.db  { send_data (system "mysqldump -u compartir -pdatos AsocCompartir_development") }
		end
	end


	
	def manual
	end

	def show
		codigo = params[:id]
		@nino = Nino.find_by_codigo(codigo)
		unless	@nino.blank?
			@nino = Nino.find_by_codigo(codigo)
		 	@edad = Nino.encontrarEdad(codigo)
			@direccion = Nino.direccion(codigo)
			@descripcion = Nino.descripcion(codigo)
			@datos_vivienda = Nino.datos_vivienda(codigo)
			@familiares = Nino.buscar_familiares(codigo)
			@situacionAcademica = Nino.situacion_academica(codigo)
			@beneficios = Nino.beneficios(codigo)
			@programas = Nino.programas(codigo)
			@expediente = Nino.numeroExpediente(codigo)
		end
	
	end

	def entrada
	end
	def buscar
	end
	
	def crear
		Nino.salvar(params)

		redirect_to :action => "show", :id => params[:code]
	end

end
