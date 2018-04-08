class CreateWorkers < ActiveRecord::Migration[5.1]
  def change
    create_table :workers do |t|
      t.string :rut
      t.string :name
      t.string :gender
      t.integer :local
      t.string :position
      t.string :w_qf_apron
      t.string :m_qf_apron
      t.string :w_vmf_apron
      t.string :m_vmf_apron
      t.string :w_shirt
      t.string :m_shirt
      t.string :m_blue_trouser
      t.string :w_blue_trouser
      t.string :m_black_trouser
      t.string :w_black_trouser
      t.string :nativa_trouser
      t.string :beauty_trouser
      t.string :m_blue_polar
      t.string :w_blue_polar
      t.string :nativa_polar
      t.string :m_black_polar
      t.string :w_black_polar
      t.string :m_red_t_shirt
      t.string :w_red_t_shirt
      t.string :beauty_jacket
      t.string :beauty_polar
      t.string :yellow_t_shirt
      t.string :blue_tie
      t.string :red_tie
      t.string :m_cargo_trouser
      t.string :m_gray_t_shirt
      t.string :w_cargo_trouser
      t.string :w_gray_t_shirt
      t.string :m_black_t_shirt
      t.string :w_black_t_shirt
      t.boolean :answered, default: false
      t.text :observation

      t.timestamps
    end


    create_table :roles do |t|
      t.string :name
      t.string :nickname
      t.string :title
      t.string :gender

    end
    create_table :pieces do |t|
      t.string :name
      t.string :nickname
      t.string :gender

    end
    create_table :sizes do |t|
      t.string :name
      t.integer :position
      t.string :detail

    end
    create_table :codes do |t|
      t.string :code, :unique
      t.text :description
    end

    add_reference :codes, :role
    add_reference :codes, :piece
    add_reference :codes, :size
  end
end
