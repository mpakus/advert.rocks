class CreateVideoRatings < ActiveRecord::Migration
  def change
    create_table :video_ratings do |t|
      t.references :video, index: true
      t.references :user, index: true
      t.integer :amount

      t.timestamps
    end
  end
end
