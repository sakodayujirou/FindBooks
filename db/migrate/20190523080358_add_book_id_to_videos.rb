class AddBookIdToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :book_id, :integer
  end
end
