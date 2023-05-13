class AddDescriptionToCoffees < ActiveRecord::Migration[7.0]
  def change
    add_column :coffees, :description, :string
  end
end
