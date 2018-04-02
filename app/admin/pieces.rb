ActiveAdmin.register Piece,as: "Prendas" do
  permit_params :name, :nickname, :gender

  index do
    selectable_column
    id_column
    column :name
    column :nickname
    column :gender
    actions
  end

  filter :name
  filter :nickname
  filter :gender

  form do |f|
    f.inputs do
      f.input :name, as: "Nombre"
      f.input :nickname, as: "Apodo DB"
      f.input :gender, as: "Sexo"
    end
    f.actions
  end

end
