require 'rails_helper'

RSpec.describe VideoRating, :type => :model do
  before(:each) do
    @video = create :video
    @user  = create :user
  end

  it "is user blank" do
    video = build(:video_rating, video: @video, user: nil)
    video.valid?
    expect(video.errors[:user]).to include("can't be blank")
  end

  it "is video blank" do
    video = build(:video_rating, video: nil, user: @user)
    video.valid?
    expect(video.errors[:video]).to include("can't be blank")
  end
end
