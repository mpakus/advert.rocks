FactoryGirl.define do
  factory :video_rating do
    video
    user
    amount 1
  end
end
