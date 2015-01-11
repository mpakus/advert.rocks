# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  video_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'rails_helper'

RSpec.describe Favorite, :type => :model do
  it "is user empty" do
    favorite = build(:favorite, user: nil)
    favorite.valid?
    expect(favorite.errors[:user]).to include("can't be blank")
  end

  it "is video empty" do
    favorite = build(:favorite, video: nil)
    favorite.valid?
    expect(favorite.errors[:video]).to include("can't be blank")
  end

  it "is video should to have user in users after create" do
    user  = create(:user)
    video = create(:video, user: user)
    expect(video.favorite_users).to include(user)
  end

  it "is user should to have video on favorite_videos  after create" do
    user  = create(:user)
    video = create(:video, user: user)
    expect(user.favorite_videos).to include(video)
  end
end
