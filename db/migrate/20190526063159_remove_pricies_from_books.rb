class RemovePriciesFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :price, :integer
  end
end
