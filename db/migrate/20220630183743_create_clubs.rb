class CreateClubs < ActiveRecord::Migration[7.0]
  def change
    create_table :clubs do |t|
      t.text :name
      t.date :foundation_date
      t.references :federation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
