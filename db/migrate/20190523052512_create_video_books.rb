class CreateVideoBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :video_books do |t|
      t.references :video, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
