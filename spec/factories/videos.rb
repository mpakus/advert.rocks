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

FactoryGirl.define do
  factory :video do
    url 'http://www.youtube.com/watch?v=i5GhFL0OWq8'
    user
    likes 0
    dislikes 0
    rating 0
  end

  factory :video_vimeo, parent: :video do
    url 'http://vimeo.com/112314245'
    user
    likes 0
    dislikes 0
    rating 0
  end
end
