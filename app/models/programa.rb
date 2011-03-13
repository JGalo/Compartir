class Programa < ActiveRecord::Base

	def self.buscar_distintos
		filas = []
		s = ActiveRecord::Base.connection.execute("SELECT DISTINCT componente FROM programas")
		s.each do |row|
			filas << row
		end
		filas
	end

	def self.existe(params)
		 filas = []
		 s = ActiveRecord::Base.connection.execute("SELECT * FROM programas WHERE programas.tipo ='#{params[:programa]}' and programas.componente = '#{params[:componente]}'")
		 s.each do |row|
		 	filas << row
		 end 
			return filas != []
	end
	def self.insertar(params)
			unless params[:componente].blank?
				unless self.existe(params)
				 	ActiveRecord::Base.connection.execute("INSERT INTO programas VALUES ('#{params[:programa]}','#{params[:componente]}');")
					return true
				end
			end
			return false
	end
end
