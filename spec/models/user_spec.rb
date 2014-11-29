# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(128)
#

require 'rails_helper'


RSpec.describe User, :type => :model do
  it "is user email empty" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is user password empty" do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "is email uniq for user" do
    attrs = attributes_for(:user)
    User.create(attrs)
    user  = User.new(attrs)
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "is password length too short" do
    user = build(:user, password: '12')
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 4 characters)")
  end

  it "own his video" do
    user = create(:user)
    video1 = create(:video, user: user)
    expect(user.own(video1)).to be_truthy
  end

  it "doesn't own another user's video" do
    vasya = create(:user, name: 'Vasya')
    petya = create(:user, name: 'Petya')
    video2 = create(:video, user: petya)
    expect(vasya.own(video2)).to be_falsey
  end

  it "can favorite video of the another user" do
    vasya = create(:user, name: 'Vasya')
    petya = create(:user, name: 'Petya')
    video2 = create(:video, user: petya)
    expect(vasya.favorite_video(video2)).to be_truthy
  end

  it "unfavorite same video if user do it twice" do
    vasya = create(:user, name: 'Vasya')
    petya = create(:user, name: 'Petya')
    video = create(:video, user: petya)
    vasya.favorite_video(video)
    expect(vasya.own(video)).to be_truthy

    expect(vasya.favorite_video(video)).to be_falsey
  end

end