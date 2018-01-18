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

end
