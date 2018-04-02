ActiveAdmin.register Worker,as: "Trabajadores" do
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
    column 'DELANTAL QF FASA', :w_qf_apron
    column 'COTONA QF FASA', :m_qf_apron
    column 'DELANTAL VMF FASA', :w_vmf_apron
    column 'COTONA VMF FASA', :m_vmf_apron
    column 'BLUSA BLANCA FASA', :w_shirt
    column 'CAMISA BLANCA FASA', :m_shirt
    column 'PANTALON VESTIR AZUL VARON', :m_blue_trouser
    column 'PANTALON VESTIR AZUL DAMA', :w_blue_trouser
    column 'PANTALON GNC VARON', :m_black_trouser
    column 'PANTALON GNC DAMA', :w_black_trouser
    column 'PANTALON NATIVA', :nativa_trouser
    column 'PANTALON BELLEZA BLANCO', :beauty_trouser
    column 'POLAR AZUL FASA VARON', :m_blue_polar
    column 'POLAR AZUL FASA DAMA', :w_blue_polar
    column 'POLAR NATIVA', :nativa_polar
    column 'POLAR NEGRO GNC VARON', :m_black_polar
    column 'POLAR NEGRO GNC DAMA', :w_black_polar
    column 'POLERA ROJA VARON GNC', :m_red_t_shirt
    column 'POLERA ROJA DAMA GNC', :w_red_t_shirt
    column 'CHAQUETA BELLEZA BLANCO', :beauty_jacket
    column 'POLAR NEGRO MANGA LARGA DER Y BELLEZA', :beauty_polar
    column 'POLERA AMARILLA NATIVA', :yellow_t_shirt
    column 'CORBATA AZUL FASA', :blue_tie
    column 'CORBATA ROJA FASA', :red_tie
    column 'PANTALON CARGO SAL VARON', :m_cargo_trouser
    column 'POLERA GRIS SAL VARON', :m_gray_t_shirt
    column 'PANTALON CARGO SAL DAMA', :w_cargo_trouser
    column 'POLERA GRIS SAL DAMA', :w_gray_t_shirt
    column 'POLERA NEGRA VARON GNC', :m_black_t_shirt
    column 'POLERA NEGRA DAMA GNC ', :w_black_t_shirt
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
    column("DELANTAL QF FASA", humanize_name: false){ |order| order.w_qf_apron }
    column("COTONA QF FASA", humanize_name: false){ |order| order.m_qf_apron }
    column("DELANTAL VMF FASA", humanize_name: false){ |order| order.w_vmf_apron }
    column("COTONA VMF FASA", humanize_name: false){ |order| order.m_vmf_apron }
    column("BLUSA BLANCA FASA", humanize_name: false){ |order| order.w_shirt }
    column("CAMISA BLANCA FASA", humanize_name: false){ |order| order.m_shirt }
    column("PANTALON VESTIR AZUL VARON", humanize_name: false){ |order| order.m_blue_trouser }
    column("PANTALON VESTIR AZUL DAMA", humanize_name: false){ |order| order.w_blue_trouser }
    column("PANTALON GNC VARON", humanize_name: false){ |order| order.m_black_trouser }
    column("PANTALON GNC DAMA", humanize_name: false){ |order| order.w_black_trouser }
    column("PANTALON NATIVA", humanize_name: false){ |order| order.nativa_trouser }
    column("PANTALON BELLEZA BLANCO", humanize_name: false){ |order| order.beauty_trouser }
    column("POLAR AZUL FASA VARON", humanize_name: false){ |order| order.m_blue_polar }
    column("POLAR AZUL FASA DAMA", humanize_name: false){ |order| order.w_blue_polar }
    column("POLAR NATIVA", humanize_name: false){ |order| order.nativa_polar }
    column("POLAR NEGRO GNC VARON", humanize_name: false){ |order| order.m_black_polar }
    column("POLAR NEGRO GNC DAMA", humanize_name: false){ |order| order.w_black_polar }
    column("POLERA ROJA VARON GNC", humanize_name: false){ |order| order.m_red_t_shirt }
    column("POLERA ROJA DAMA GNC", humanize_name: false){ |order| order.w_red_t_shirt }
    column("CHAQUETA BELLEZA BLANCO", humanize_name: false){ |order| order.beauty_jacket }
    column("POLAR NEGRO MANGA LARGA DER Y BELLEZA", humanize_name: false){ |order| order.beauty_polar }
    column("POLERA AMARILLA NATIVA", humanize_name: false){ |order| order.yellow_t_shirt }
    column("CORBATA AZUL FASA", humanize_name: false){ |order| order.blue_tie }
    column("CORBATA ROJA FASA", humanize_name: false){ |order| order.red_tie }
    column("PANTALON CARGO SAL VARON", humanize_name: false){ |order| order.m_cargo_trouser }
    column("POLERA GRIS SAL VARON", humanize_name: false){ |order| order.m_gray_t_shirt }
    column("PANTALON CARGO SAL DAMA", humanize_name: false){ |order| order.w_cargo_trouser }
    column("POLERA GRIS SAL DAMA", humanize_name: false){ |order| order.w_gray_t_shirt }
    column("POLERA NEGRA VARON GNC", humanize_name: false){ |order| order.m_black_t_shirt }
    column("POLERA NEGRA DAMA GNC ", humanize_name: false){ |order| order.w_black_t_shirt }
    column("RESPONDIDO", humanize_name: false){ |order| order.answered }
    column("COMENTARIO", humanize_name: false){ |order| order.observation }
    column("ACTUALIZACION", humanize_name: false){ |order| order.updated_at }
  end



end
