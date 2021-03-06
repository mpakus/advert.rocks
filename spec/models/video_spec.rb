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

require 'rails_helper'

RSpec.describe Video, :type => :model do
  it "is video url empty" do
    video = build(:video, url: nil)
    video.valid?
    expect(video.errors[:url]).to include("can't be blank")
  end

  it "is user blank or email & name" do
    video = build(:video, user: nil)
    video.valid?
    expect(video.errors[:user]).to include("can't be blank")
  end

  it "is should change video's rating on :like" do
    video = create(:video)
    user  = create(:user)
    video.like!(user)
    expect(video.rating).to eq 1
  end

  it "is should change video's rating on :dislike" do
    video = create(:video)
    user  = create(:user)
    video.dislike!(user)
    expect(video.rating).to eq -1
  end

  it "is get only censored videos" do
    create(:video, rating: 1)
    create(:video, rating: 5)
    create(:video, rating: -5)
    create(:video, rating: -15)
    expect(Video.censored.count).to eq 3
  end

end