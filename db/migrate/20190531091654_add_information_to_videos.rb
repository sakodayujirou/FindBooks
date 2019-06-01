class AddInformationToVideos < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :information, :text
  end
end
