ActiveAdmin.register Worker do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  index do
    selectable_column
    id_column
    column 'RUT', :rut
    column 'SEXO', :gender
    column 'CARGO', :position
    column 'LOCAL', :local
    column 'POLAR', :polar
    column 'P_VESTIR', :dress_trouser
    column 'CAMISA', :man_shirt
    column 'COTONA', :man_apron
    column 'BLUSA', :woman_shirt
    column 'DELANTAL', :woman_apron
    column 'POLERA', :t_shirt
    column 'P_CARGO', :cargo_trouser
    column 'RESPONDIDO', :answered
    column 'COMENTARIO', :observation
    column 'ACTUALIZACION', :updated_at
    actions
  end


  csv do
    column("RUT", humanize_name: false){ |order| order.rut }
    column("SEXO", humanize_name: false){ |order| order.gender }
    column("CARGO", humanize_name: false){ |order| order.position }
    column("LOCAL", humanize_name: false){ |order| order.local }
    column("POLAR", humanize_name: false){ |order| order.polar }
    column("P_VESTIR", humanize_name: false){ |order| order.dress_trouser }
    column("CAMISA", humanize_name: false){ |order| order.man_shirt }
    column("COTONA", humanize_name: false){ |order| order.man_apron }
    column("BLUSA", humanize_name: false){ |order| order.woman_shirt }
    column("DELANTAL", humanize_name: false){ |order| order.woman_apron }
    column("POLERA", humanize_name: false){ |order| order.t_shirt }
    column("P_CARGO", humanize_name: false){ |order| order.cargo_trouser }
    column("RESPONDIDO", humanize_name: false){ |order| order.answered }
    column("COMENTARIO", humanize_name: false){ |order| order.observation }
    column("ACTUALIZACION", humanize_name: false){ |order| order.updated_at }
  end

end
