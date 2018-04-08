class Worker < ApplicationRecord

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      worker = find_by(rut: row["RUT"]) || new

      n = row["NOMBRE"].nil? ? "":row["NOMBRE"]
      p = row["APATERNO"].nil? ? "":row["APATERNO"]
      m = row["AMATERNO"].nil?  ? "":row["AMATERNO"]

      nombre = n+" "+p+" "+m
      sexo = row["SEXO"]=="F" ? "Mujer" : "Hombre"
      worker.attributes = {rut: row["RUT"], name: nombre, gender: sexo, local: row["LOCAL"], position: row["CARGO"] }
      worker.save!
    end
  end

  def self.validate(rut)
    RUT.get_rut_and_dv(rut)
  end

  def get_rut
    rut+'-'+RUT.get_dv(rut).to_s
  end

  def self.to_csv(options = {})

      desired_columns = ["rut", "name", "gender", "position","local","w_qf_apron","m_qf_apron","w_vmf_apron","m_vmf_apron","w_shirt","m_shirt","m_blue_trouser","w_blue_trouser","m_black_trouser","w_black_trouser","nativa_trouser","beauty_trouser","m_blue_polar","w_blue_polar","nativa_polar","m_black_polar","w_black_polar","m_red_t_shirt","w_red_t_shirt","beauty_jacket","beauty_polar","yellow_t_shirt","blue_tie","red_tie","m_cargo_trouser","m_gray_t_shirt","w_cargo_trouser","w_gray_t_shirt","m_black_t_shirt","w_black_t_shirt", "answered", "observation", "updated_at"]
      CSV.generate(options) do |csv|
        csv << ["RUT","NOMBRE","SEXO","CARGO","LOCAL","DELANTAL QF FASA","COTONA QF FASA","DELANTAL VMF FASA","COTONA VMF FASA","BLUSA BLANCA FASA","CAMISA BLANCA FASA","PANTALON VESTIR AZUL VARON","PANTALON VESTIR AZUL DAMA","PANTALON GNC VARON","PANTALON GNC DAMA","PANTALON NATIVA","PANTALON BELLEZA BLANCO","POLAR AZUL FASA VARON","POLAR AZUL FASA DAMA","POLAR NATIVA","POLAR NEGRO GNC VARON","POLAR NEGRO GNC DAMA","POLERA ROJA VARON GNC","POLERA ROJA DAMA GNC","CHAQUETA BELLEZA BLANCO","POLAR NEGRO MANGA LARGA DER Y BELLEZA","POLERA AMARILLA NATIVA","CORBATA AZUL FASA","CORBATA ROJA FASA","PANTALON CARGO SAL VARON","POLERA GRIS SAL VARON","PANTALON CARGO SAL DAMA","POLERA GRIS SAL DAMA","POLERA NEGRA VARON GNC","POLERA NEGRA DAMA GNC","RESPONDIDO", "COMENTARIO","ACTUALIZACION"]
        all.each do |product|
          csv << product.attributes.values_at(*desired_columns)
        end
      end
  end

  def get_role
    Role.find_by(title: position, gender: gender)
  end


  def is_woman?
    gender.eql?"Mujer"
  end

  def positions_old
    if is_woman?
      [[0,"Químico Farmacéutico"],
       [1,"Vendedor Multifunción"],
       [2,"Servicio de Apoyo Logístico"],
       [3,"Guardia de Seguridad"],
       [4,"Consultora de Belleza"],
       [5,"Consultora Dermo"],
       [6,"GNC"],
       [7,"Nativa"]]
    else
    [[0,"Químico Farmacéutico"],
     [1,"Vendedor Multifunción"],
     [2,"Servicio de Apoyo Logístico"],
     [3,"Guardia de Seguridad"],
     [6,"GNC"]
    ]
    end
  end


  def positions
    if is_woman?
      [[0,"Químico Farmacéutico"],
       [1,"Vendedor Multifunción"],
       [2,"Servicio de Apoyo Logístico"],
       [3,"Guardia de Seguridad"],
       [4,"Consultora de Belleza"],
       [5,"Consultora Dermo"],
       [6,"GNC"],
       [7,"Nativa"]]
      Role.where(gender: ["Mujer","Ambos"])
    else
      [[0,"Químico Farmacéutico"],
       [1,"Vendedor Multifunción"],
       [2,"Servicio de Apoyo Logístico"],
       [3,"Guardia de Seguridad"],
       [6,"GNC"]
      ]
      Role.where(gender:["Hombre","Ambos"])
    end
  end

  def self.key_positions
    [[0,"Químico Farmacéutico"],
     [1,"Vendedor Multifunción"],
     [2,"Servicio de Apoyo Logístico"],
     [3,"Guardia de Seguridad"],
     [4,"Consultora de Belleza"],
     [5,"Consultora Dermo"],
     [6,"GNC"],
     [7,"Nativa"]]
  end

end
