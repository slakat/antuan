class Worker < ApplicationRecord

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      worker = find_by(rut: row["RUT"]) || new
      worker.attributes = {rut: row["RUT"], name: row["NOMBRE"], gender: row["SEXO"] }
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

      desired_columns = ["rut", "name", "gender", "position","local","m_qf_apron","w_qf_apron","m_vmf_apron","w_vmf_apron","w_dermo_apron","m_shirt","w_shirt","m_blue_trouser","w_blue_trouser","m_black_trouser","w_black_trouser","w_purple_trouser","w_white_trouser","m_blue_polar","w_blue_polar","w_purple_polar","m_black_polar","w_black_polar","cargo_trouser","red_t_shirt","black_t_shirt","yellow_t_shirt","gray_t_shirt","blue_tie","red_tie", "answered", "observation", "updated_at"]
      CSV.generate(options) do |csv|
        csv << ["RUT","NOMBRE","SEXO","CARGO","LOCAL","COTONA QF","DELANTAL QF","COTONA VENDEDOR","DELANTAL VENDEDOR","DELANTAL DERMO","CAMISA","BLUSA","P_VESTIR HOMBRE AZUL","P_VESTIR DAMA AZUL","P_VESTIR HOMBRE NEGRO","P_VESTIR DAMA NEGRO","P_VESTIR DAMA MORADO","P_VESTIR DAMA BLCO","POLAR HOMBRE AZUL","POLAR DAMA AZUL","POLAR DAMA MORADO","POLAR HOMBRE NEGRO","POLAR DAMA NEGRO","P_CARGOAZUL","POLERA ROJA O NEGRA","POLERA ROJA O NEGRA","POLERA AMARILLA","POLERA GRIS","CORBATA AZUL","CORBATA ROJA","RESPONDIDO", "COMENTARIO","ACTUALIZACION"]
        all.each do |product|
          csv << product.attributes.values_at(*desired_columns)
        end
      end
  end

  def is_woman?
    gender.eql?"Mujer"
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
    else
    [[0,"Químico Farmacéutico"],
     [1,"Vendedor Multifunción"],
     [2,"Servicio de Apoyo Logístico"],
     [3,"Guardia de Seguridad"],
     [6,"GNC"]
    ]
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
