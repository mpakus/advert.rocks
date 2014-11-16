class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string  :url

      t.string  :title
      t.text    :description
      t.integer :duration
      t.date    :uploaded_on
      t.string  :origin_thumbnail
      t.string  :image
      t.string  :embed_url
      t.string  :embed_code

      t.references :user
      t.timestamps
    end
  end
end
