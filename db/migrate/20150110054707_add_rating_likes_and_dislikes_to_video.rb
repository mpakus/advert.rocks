class AddRatingLikesAndDislikesToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :likes,    :integer, default: 0
    add_column :videos, :dislikes, :integer, default: 0
    add_column :videos, :rating,   :integer, default: 0, index: true
  end
end
