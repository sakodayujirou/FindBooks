class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string    :title
      t.string    :video
      t.string    :image
      t.integer   :user_id

      t.timestamps  null: true
    end
  end
end
