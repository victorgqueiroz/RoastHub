class CreateMarkets < ActiveRecord::Migration[7.0]
  def change
    create_table :markets do |t|

      t.timestamps
    end
  end
end
