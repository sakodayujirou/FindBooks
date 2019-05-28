class AddPriciesToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :price, :integer
  end
end
