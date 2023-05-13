class ChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :coffees, :price, :decimal
  end
end
