# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  message    :text
#  user_id    :integer
#  video_id   :integer
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  include Sortable

  belongs_to :user
  belongs_to :video, touch: true

  validates_presence_of :message

  def user_email
    self.user.nil? ? self.email : self.user.email
  end

  def human_name
    self.user.nil? ? self.name : self.user.human_name
  end

  def human_created_at
    created_at.strftime('%H:%M %v') if created_at
  end
end
