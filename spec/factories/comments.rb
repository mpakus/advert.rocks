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

FactoryGirl.define do
  factory :comment do
    message "MyText"
user nil
video nil
name "MyString"
email "MyString"
  end

end
