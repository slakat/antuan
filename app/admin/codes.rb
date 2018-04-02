ActiveAdmin.register Code,as: "Codificados" do
  permit_params :code, :description, :role, :piece, :size

  index do
    selectable_column
    id_column
    column ("Código"){ |order| order.code }
    column :description
    column ("Cargo"){ |order| order.role.name }
    column ("Prenda"){ |order| order.piece.name }
    column ("Talla"){ |order| order.size ? order.size.detail : '' }
    actions
  end

  filter :role
  filter :piece
  filter :size

  form do |f|
    f.inputs do
      f.input :code, as: "Código"
      f.input :description, as: "Descripción"
      f.input :role, as: "Cargo"
      f.input :piece, as: "Prenda"
      f.input :size, as: "Talla"
    end
    f.actions
  end

end
