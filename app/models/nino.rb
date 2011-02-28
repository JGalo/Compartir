class Nino < ActiveRecord::Base
	validates_uniqueness_of :codigo
	validates_presence_of :codigo

	def self.buscar_por_maestro(codigo_educador)
		 s = ActiveRecord::Base.connection.execute("SELECT ninos.codigo, ninos.nombre, ninos.apellido FROM ninos INNER JOIN educadors ON ninos.codigoEducador = educadors.codigo WHERE educadors.codigo='#{codigo_educador}'")
		 filas = []
		 s.each do |row|
			 filas << row
		 end
		 filas
	end

	def self.buscar_por_maestros(educadores)
			filas = []
			educadores.each do |codigo|
			s = ActiveRecord::Base.connection.execute("SELECT ninos.codigo, ninos.nombre, ninos.apellido FROM ninos INNER JOIN educadors ON ninos.codigoEducador = educadors.codigo WHERE educadors.codigo='#{codigo}'")
			s.each do |row|
			   filas << row
				end
			end
			filas
	end

	def self.buscar_familiares(codigo)
	filas = []
	s = ActiveRecord::Base.connection.execute("SELECT familiars.nombre,familiars.apellido FROM (ninos INNER JOIN esfamiliars ON ninos.codigo = esfamiliars.codigoNino) INNER JOIN familiars ON esfamiliars.nombreFamiliar = familiars.nombre AND esfamiliars.apellidoFamiliar = familiars.apellido WHERE ninos.codigo='#{codigo}'")
	s.each do |row|
			filas << row		
		end
		filas
	end
end
