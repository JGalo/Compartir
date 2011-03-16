class Nino < ActiveRecord::Base
	validates_uniqueness_of :codigo
	validates_presence_of :codigo

	def self.buscar_por_parametros(params)
			consulta = "SELECT ninos.codigo, ninos.nombre, ninos.apellido,ninos.estadoPadrinazgo,(YEAR(CURDATE())-YEAR(ninos.fechaNac))-(RIGHT(CURDATE(),5)<RIGHT(ninos.fechaNac,5)) AS edad,ninos.sexo,ninos.habitaCon,ninos.nombreCentro,ninos.nombreSector,ninos.codigoEducador, MAX(situacion_academicas.grado) FROM (ninos INNER JOIN educadors ON ninos.codigoEducador = educadors.codigo) left outer join situacion_academicas on ninos.codigo = situacion_academicas.codigoNino "
			edad = " (YEAR(CURDATE())-YEAR(ninos.fechaNac))-(RIGHT(CURDATE(),5)<RIGHT(ninos.fechaNac,5)) "
			condiciones = "WHERE "
			
			tiposPadrinazgo = {"ingresar"=>"Por ingresar","compartir"=>"Padrinazgo Compartir","partage"=>"Padrinazgo Partage","otros"=>"Otro Padrinazgo","interrupcion"=>"En interrupción","propuestos"=>"Propuesto para Egreso","egresados"=> "Egresado"}


												

			if not params[:desdeEdad].blank? and not params[:hastaEdad].blank? then
					condiciones += "(#{edad} >= #{params[:desdeEdad].to_i} AND #{edad} <= #{params[:hastaEdad].to_i}) "
			elsif params[:desdeEdad].blank? and not params[:hastaEdad].blank? then
				  condiciones += "(#{edad} <= #{params[:hastaEdad].to_i}) "
			elsif not params[:desdeEdad].blank? and params[:hastaEdad].blank? then
					condiciones += "(#{edad} >= #{params[:desdeEdad].to_i}) "
			end

			 
  		unless params[:sexo].blank?
						unless condiciones.eql? "WHERE "
							condiciones += " AND (ninos.sexo = '#{params[:sexo]}' ) "
						else
							condiciones += " (ninos.sexo = '#{params[:sexo]}') "
						end
			end

			unless params[:centro].blank?
						unless condiciones.eql? "WHERE "
						   condiciones += "AND ( "
						else
							 condiciones += "( "
					  end
							 (params[:centro].length - 1).times do |j|
								 cys = params[:centro][j].split("_")
								 hasta = cys.length - 2
								 centro = ""
								 hasta.times do |i|
										centro += cys[i] + " "
								 	end
								 
								 sector = cys[-2] + " " + cys[-1]
								 condiciones += " (ninos.nombreCentro = '#{centro}' AND ninos.nombreSector = '#{sector}') OR "
								 
							end

							cys = params[:centro][-1].split("_") 
							hasta = cys.length -  2
							centro = ""
							hasta.times do |i|
								centro += cys[i] + " "
							end

							sector = cys[-2] + " " + cys[-1]
							condiciones += ("ninos.nombreCentro = '#{centro}' AND ninos.nombreSector = '#{sector}'")
							condiciones += ") "
						
			end

			unless params[:padrinazgo].blank?
					unless condiciones.eql? "WHERE "
							condiciones += " AND (ninos.estadoPadrinazgo = '#{tiposPadrinazgo[params[:padrinazgo]]}' ) "
						else
							condiciones += " (ninos.estadoPadrinazgo = '#{tiposPadrinazgo[params[:padrinazgo]]}') "
						end
 					tiposPadrinazgo[params[:padrinazgo]]
			end

			unless params[:educ].blank?
						unless params[:educ][0] == "todo" then
							
						
						unless condiciones.eql? "WHERE "
						   condiciones += "AND ( "
						else
							 condiciones += "( "
					  end
							 (params[:educ].length - 1).times do |j|
								 educador = params[:educ][j]
								 condiciones += " (ninos.codigoEducador = '#{educador}') OR "
								 
							end

							educador = params[:educ][-1] 
							condiciones += ("ninos.codigoEducador = '#{educador}'")
							condiciones += ") "
						end
			end

			unless params[:programa].blank?
					unless condiciones.eql? "WHERE "
						condiciones += "AND ("
					else
						condiciones += "( "
					end
						consulta_interna = " ninos.codigo IN ( SELECT ninos.codigo FROM (ninos INNER JOIN participas ON ninos.codigo = participas.codigoNino) INNER JOIN programas on programas.componente = participas.componentePrograma "
						
						consulta_interna += " WHERE ( "
						s =  params[:programa].length
						s -= 1
						s.times do |j|
								componente = params[:programa][j]
								consulta_interna += " (programas.componente = '#{componente}') OR "
						end
						componente = params[:programa][-1]
						consulta_interna += " (programas.componente = '#{componente}' ) "

						consulta_interna += ") ) "
						condiciones += consulta_interna
						condiciones += " ) "
			end
				
			if condiciones.eql? "WHERE "
					condiciones = ""
			end
			consulta += condiciones
			consulta += " GROUP BY ninos.codigo"
	
		 s = ActiveRecord::Base.connection.execute(consulta)
		 filas = []
		 s.each do |row|
			 filas << row
		 filas
		end
	end

	def self.direccion(codigo)
	filas = []
	s = ActiveRecord::Base.connection.execute( "SELECT expediente_viviendas.direccion FROM (ninos INNER JOIN expedientes ON ninos.codigo = expedientes.codigoNino) INNER JOIN expediente_viviendas ON expedientes.codigo = expediente_viviendas.codigoExpediente WHERE ninos.codigo='#{codigo}'")
	s.each do |row|
		filas << row
	end
	unless filas.blank?
		 	return filas[0][0]
	 end
	 return []
	end

	def self.buscar_familiares(codigo)
	filas = []
	s = ActiveRecord::Base.connection.execute("SELECT familiars.nombre,familiars.apellido FROM (ninos INNER JOIN esfamiliars ON ninos.codigo = esfamiliars.codigoNino) INNER JOIN familiars ON esfamiliars.nombreFamiliar = familiars.nombre AND esfamiliars.apellidoFamiliar = familiars.apellido WHERE ninos.codigo='#{codigo}'")
	s.each do |row|
			filas << row		
		end
		filas
	end

	def self.datos_vivienda(codigo)
	filas = []
	s = ActiveRecord::Base.connection.execute("select componente_viviendas.nombre,componente_viviendas.revision, componente_viviendas.condicion, componente_viviendas.observacion from ((ninos inner join expedientes on ninos.codigo = expedientes.codigoNino) inner join expediente_viviendas on expedientes.codigo = expediente_viviendas.codigoExpediente) inner join componente_viviendas on componente_viviendas.codigoExpediente = expediente_viviendas.codigoExpediente WHERE ninos.codigo ='#{codigo}'")
	s.each do |row|
		filas << row
		end
		filas
	end

	def self.tabSeparated(arreglo)
		cadena = " "
		arreglo.each do |linea|
			linea.each do |celda|
				cadena += "#{celda}\t"
			end
			cadena += "\n"
		end
	cadena
	end


	 def self.encontrarCodigoPorExpediente(codExpediente)
	 filas = []
	 s = ActiveRecord::Base.connection.execute("SELECT ninos.codigo FROM ninos INNER JOIN expedientes ON ninos.codigo = expedientes.codigoNino WHERE expedientes.codigo = '#{codExpediente}'")
	 s.each do |row|
			filas << row
	 end
	 unless filas.blank?
		 	return filas[0][0]
	 end
	 return []
	 end

	def self.encontrarEdad(codigo )
 	filas = []
	s = ActiveRecord::Base.connection.execute("SELECT (YEAR(CURDATE())-YEAR(ninos.fechaNac))-(RIGHT(CURDATE(),5)<RIGHT(ninos.fechaNac,5)) FROM ninos WHERE ninos.codigo = '#{codigo}'")
	s.each do |row|
	 filas << row
	end
	filas
	end


	def self.descripcion(codigo)
	filas = []
	s = ActiveRecord::Base.connection.execute("SELECT historials.descripcion FROM historials INNER JOIN ninos ON historials.codigoNino = ninos.codigo WHERE ninos.codigo = '#{codigo}'")
	s.each do |row|
		filas << row
	end
	unless filas.blank?
		return filas[0][0]
	end
	return []
	end

	def self.situacion_academica(codigo)
	filas = []
	s = ActiveRecord::Base.connection.execute("SELECT situacion_academicas.anio,situacion_academicas.grado, situacion_academicas.indice,situacion_academicas.observacion,situacion_academicas.centro FROM ninos INNER JOIN situacion_academicas ON ninos.codigo = situacion_academicas.codigoNino WHERE ninos.codigo = '#{codigo}'")
	s.each do |row|
		filas << row
	end
	filas
	end

	def self.beneficios(codigo)
	filas = []
	s = ActiveRecord::Base.connection.execute("SELECT beneficios.tipoBeneficio, beneficios.fecha, beneficios.detalle, beneficios.importe, beneficios.observacion FROM ninos INNER JOIN beneficios ON ninos.codigo = beneficios.codigoNino WHERE ninos.codigo = '#{codigo}'")
	s.each do |row|
		filas << row
	end
	filas
	end

	def self.programas(codigo)
	filas = []
	s = ActiveRecord::Base.connection.execute("SELECT participas.tipoPrograma,participas.componentePrograma, participas.fechaInic, participas.fechaFinal, participas.resultado FROM ninos INNER JOIN participas ON ninos.codigo = participas.codigoNino WHERE ninos.codigo = '#{codigo}'")
	s.each do |row|
		filas << row
	end
	filas
	end

	def self.numeroExpediente(codigo)
	filas = []
	s = ActiveRecord::Base.connection.execute("SELECT expedientes.codigo FROM ninos INNER JOIN expedientes ON ninos.codigo = expedientes.codigoNino WHERE ninos.codigo = '#{codigo}'")
	s.each do |row|
		filas << row
	end
	unless filas.blank?
		return filas[0][0]
	end
	return []

	end

	def self.salvar(params)
		
	  cys = params[:centro].split("_") 
		hasta = cys.length -  2
		centro = ""
	  hasta.times do |i|
		     centro += cys[i] + " "
		end
		sector = cys[-2] + " " + cys[-1]
		p params	

		ActiveRecord::Base.connection.execute("INSERT INTO ninos VALUES ('#{params[:code]}','#{params[:nombre]}','#{params[:apellido]}','Por ingresar','#{params[:fechaNac]}','#{params[:sexo]}','NULL','#{centro}','#{sector}','#{params[:educ]}' );")
		ActiveRecord::Base.connection.execute("INSERT INTO expedientes VALUES ('#{params[:expediente]}','#{params[:fecha]}','#{params[:educ]}','#{params[:code]}' );")
	end
end

