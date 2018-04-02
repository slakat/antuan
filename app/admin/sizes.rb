ActiveAdmin.register Size,as: "Tallas" do
  permit_params :name, :position, :detail

  index do
    selectable_column
    id_column
    column :name
    column :position
    column :detail
    actions
  end

  filter :name
  filter :position
  filter :detail

  form do |f|
    f.inputs do
      f.input :name, as: "Categoría"
      f.input :nickname, as: "Posición"
      f.input :gender, as: "Talla"
    end
    f.actions
  end

end
