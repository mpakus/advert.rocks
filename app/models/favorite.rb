# == Schema Information
#
# Table name: favorite_relationships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  video_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :video
  validates_presence_of :user, :video
end