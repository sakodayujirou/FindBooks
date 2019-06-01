class AddColumBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :initial, :string
    add_column :books, :second_initial, :string
  end
end
