class NinosController < ApplicationController
	def index
		@ninos = Nino.all
		respond_to do |format|
		        format.html
		        format.xls { send_data @ninos.to_xls_data, :filename => 'ninos.xls' }
					  format.db  { send_data system "mysqldump -u compartir -pdatos AsocCompartir_development"}
		end
	end

	def show
		codigo = params[:id]
		@nino = Nino.find_by_codigo(codigo)
		@edad = Nino.edad_Nino(codigo)
	end

	def entrada
	end
end
