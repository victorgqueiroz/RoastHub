class CreateCoffees < ActiveRecord::Migration[7.0]
  def change
    create_table :coffees do |t|
      t.string :region
      t.string :bean
      t.string :sensory_note
      t.integer :classification
      t.string :grinding
      t.string :brand
      t.bigint :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
