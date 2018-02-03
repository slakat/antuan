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
      t.string :w_dermo_apron
      t.string :w_shirt
      t.string :m_shirt
      t.string :m_blue_trouser
      t.string :w_blue_trouser
      t.string :m_black_trouser
      t.string :w_black_trouser
      t.string :w_purple_trouser
      t.string :w_white_trouser
      t.string :m_blue_polar
      t.string :w_blue_polar
      t.string :w_purple_polar
      t.string :m_black_polar
      t.string :w_black_polar
      t.string :cargo_trouser
      t.string :red_t_shirt
      t.string :black_t_shirt
      t.string :yellow_t_shirt
      t.string :gray_t_shirt
      t.string :blue_tie
      t.string :red_tie
      t.boolean :answered, default: false
      t.text :observation

      t.timestamps
    end
  end
end
