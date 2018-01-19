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

  def self.positions
   [[0,"Químico Farmacéutico"],
                [1,"Vendedor Multifunción"],
                [2,"Servicio de Apoyo Logístico"],
                [3,"Guardia de Seguridad"],
                [4,"Consultora de Belleza"],
                [5,"Consultora Dermo"],
                [6,"GNC"],
                [7,"Nativa"]]
  end

  def self.to_csv(options = {})

      desired_columns = ["rut", "name", "gender", "position","local","woman_apron","man_apron","woman_shirt", "dress_trouser", "polar", "cargo_trouser",  "t_shirt", "man_shirt", "answered", "observation", "updated_at"]
      CSV.generate(options) do |csv|
        csv << ["RUT","NOMBRE","SEXO","CARGO","LOCAL","DELANTAL","COTONA,BLUSA","P_VESTIR","POLAR","P_CARGO","POLERA","CAMISA","RESPONDIDO", "COMENTARIO","ACTUALIZACION"]
        all.each do |product|
          csv << product.attributes.values_at(*desired_columns)
        end
      end
  end

end
