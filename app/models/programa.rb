class Programa < ActiveRecord::Base

	def self.buscar_distintos
		filas = []
		s = ActiveRecord::Base.connection.execute("SELECT DISTINCT componente FROM programas")
		s.each do |row|
			filas << row
		end
		filas
	end
end
