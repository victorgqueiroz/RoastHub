class AddRoastToCoffees < ActiveRecord::Migration[7.0]
  def change
    add_column :coffees, :roast, :string
  end
end
