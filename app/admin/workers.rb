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
    column 'NOMBRE', :name
    column 'SEXO', :gender
    column 'CARGO', :position
    column 'LOCAL', :local
    column 'COTONA_QF', :m_qf_apron
    column 'DELANTAL_QF', :w_qf_apron
    column 'COTONA_VENDEDOR', :m_vmf_apron
    column 'DELANTAL_VENDEDOR', :w_vmf_apron
    column 'DELANTAL_DERMO', :w_dermo_apron
    column 'CAMISA', :m_shirt
    column 'BLUSA', :w_shirt
    column 'P_VESTIR_HOMBRE_AZUL', :m_blue_trouser
    column 'P_VESTIR_DAMA_AZUL', :w_blue_trouser
    column 'P_VESTIR_HOMBRE_NEGRO', :m_black_trouser
    column 'P_VESTIR_DAMA_NEGRO', :w_black_trouser
    column 'P_VESTIR_DAMA_MORADO', :w_purple_trouser
    column 'P_VESTIR_DAMA_BLCO', :w_white_trouser
    column 'POLAR_HOMBRE_AZUL', :m_blue_polar
    column 'POLAR_DAMA_AZUL', :w_blue_polar
    column 'POLAR_DAMA_MORADO', :w_purple_polar
    column 'POLAR_HOMBRE_NEGRO', :m_black_polar
    column 'POLAR_DAMA_NEGRO', :w_black_polar
    column 'P_CARGOAZUL', :cargo_trouser
    column 'POLERA_ROJA_O_NEGRA', :red_t_shirt
    column 'POLERA_ROJA_O_NEGRA', :black_t_shirt
    column 'POLERA_AMARILLA', :yellow_t_shirt
    column 'POLERA_GRIS', :gray_t_shirt
    column 'CORBATA_AZUL', :blue_tie
    column 'CORBATA_ROJA', :red_tie
    column 'RESPONDIDO', :answered
    column 'COMENTARIO', :observation
    column 'ACTUALIZACION', :updated_at
    actions
  end


  csv do
    column("RUT", humanize_name: false){ |order| order.rut }
    column("NOMBRE", humanize_name: false){|order| order.name}
    column("SEXO", humanize_name: false){ |order| order.gender }
    column("CARGO", humanize_name: false){ |order| order.position }
    column("LOCAL", humanize_name: false){ |order| order.local }
    column("COTONA_QF", humanize_name: false){ |order| order.m_qf_apron }
    column("DELANTAL_QF", humanize_name: false){ |order| order.w_qf_apron }
    column("COTONA_VENDEDOR", humanize_name: false){ |order| order.m_vmf_apron }
    column("DELANTAL_VENDEDOR", humanize_name: false){ |order| order.w_vmf_apron }
    column("DELANTAL_DERMO", humanize_name: false){ |order| order.w_dermo_apron }
    column("CAMISA", humanize_name: false){ |order| order.m_shirt }
    column("BLUSA", humanize_name: false){ |order| order.w_shirt }
    column("P_VESTIR_HOMBRE_AZUL", humanize_name: false){ |order| order.m_blue_trouser }
    column("P_VESTIR_DAMA_AZUL", humanize_name: false){ |order| order.w_blue_trouser }
    column("P_VESTIR_HOMBRE_NEGRO", humanize_name: false){ |order| order.m_black_trouser }
    column("P_VESTIR_DAMA_NEGRO", humanize_name: false){ |order| order.w_black_trouser }
    column("P_VESTIR_DAMA_MORADO", humanize_name: false){ |order| order.w_purple_trouser }
    column("P_VESTIR_DAMA_BLCO", humanize_name: false){ |order| order.w_white_trouser }
    column("POLAR_HOMBRE_AZUL", humanize_name: false){ |order| order.m_blue_polar }
    column("POLAR_DAMA_AZUL", humanize_name: false){ |order| order.w_blue_polar }
    column("POLAR_DAMA_MORADO", humanize_name: false){ |order| order.w_purple_polar }
    column("POLAR_HOMBRE_NEGRO", humanize_name: false){ |order| order.m_black_polar }
    column("POLAR_DAMA_NEGRO", humanize_name: false){ |order| order.w_black_polar }
    column("P_CARGOAZUL", humanize_name: false){ |order| order.cargo_trouser }
    column("POLERA_ROJA_O_NEGRA", humanize_name: false){ |order| order.red_t_shirt }
    column("POLERA_ROJA_O_NEGRA", humanize_name: false){ |order| order.black_t_shirt }
    column("POLERA_AMARILLA", humanize_name: false){ |order| order.yellow_t_shirt }
    column("POLERA_GRIS", humanize_name: false){ |order| order.gray_t_shirt }
    column("CORBATA_AZUL", humanize_name: false){ |order| order.blue_tie }
    column("CORBATA_ROJA", humanize_name: false){ |order| order.red_tie }
    column("RESPONDIDO", humanize_name: false){ |order| order.answered }
    column("COMENTARIO", humanize_name: false){ |order| order.observation }
    column("ACTUALIZACION", humanize_name: false){ |order| order.updated_at }
  end



end
