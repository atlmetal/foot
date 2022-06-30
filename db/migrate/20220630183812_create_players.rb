class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.text :name
      t.date :birth_date
      t.integer :value
      t.references :club, null: false, foreign_key: true

      t.timestamps
    end
  end
end
