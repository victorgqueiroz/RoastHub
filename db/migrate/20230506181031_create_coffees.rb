class CreateCoffees < ActiveRecord::Migration[7.0]
  def change
    create_table :coffees do |t|
      t.string :region
      t.string :bean
      t.string :roast
      t.string :sensory_note
      t.integer :classification
      t.string :grinding
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
