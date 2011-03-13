class Padrino < ActiveRecord::Base

	def self.existe(params)
		 filas = []
		 s = ActiveRecord::Base.connection.execute("SELECT * FROM padrinos WHERE padrinos.codigo ='#{params[:codigo]}'")
		 s.each do |row|
		 		filas << row
		 end 
		return filas != []
	end
	
	def self.insertar(params)
			unless params[:codigo].blank?
				unless self.existe(params)
				 	ActiveRecord::Base.connection.execute("INSERT INTO padrinos VALUES ('#{params[:codigo]}','#{params[:nombre]}','#{params[:nacionalidad]}','#{params[:titulo]}');")
					return true
				end
			end
			return false
	end
end
