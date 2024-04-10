class AddIsActiveToModelo < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :is_active, :boolean
  end
end
