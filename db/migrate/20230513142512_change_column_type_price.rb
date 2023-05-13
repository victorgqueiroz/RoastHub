class ChangeColumnTypePrice < ActiveRecord::Migration[7.0]
  def up
    change_table :coffees do |t|
      t.change :price, :float
    end
  end

  def down
    change_table :coffees do |t|
      t.change :price, :decimal
    end
  end
end
