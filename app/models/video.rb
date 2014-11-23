# == Schema Information
#
# Table name: videos
#
#  id               :integer          not null, primary key
#  url              :string(255)
#  title            :string(255)
#  description      :text
#  duration         :integer
#  uploaded_on      :date
#  origin_thumbnail :string(255)
#  image            :string(255)
#  embed_url        :string(255)
#  embed_code       :string(255)
#  user_id          :integer
#  created_at       :datetime
#  updated_at       :datetime
#
class Video < ActiveRecord::Base
  include Sortable
  mount_uploader :image, VideoUploader

  belongs_to :user
  has_many   :comments
  has_many   :favorites
  has_many   :favorite_users, through: :favorites, source: :user

  validates_presence_of :user, :url

  after_save :add_to_favorite_user

  private

  def add_to_favorite_user
    favorite_users << self.user
  end

end
