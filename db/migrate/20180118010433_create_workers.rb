class CreateWorkers < ActiveRecord::Migration[5.1]
  def change
    create_table :workers do |t|
      t.string :rut
      t.string :name
      t.string :gender
      t.integer :local
      t.string :position
      t.string :woman_apron
      t.string :man_apron
      t.string :woman_shirt
      t.string :man_shirt
      t.string :polar
      t.string :dress_trouser
      t.string :cargo_trouser
      t.string :t_shirt
      t.boolean :answered, default: false
      t.text :observation

      t.timestamps
    end
  end
end
