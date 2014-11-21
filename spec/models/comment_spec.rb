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

require 'rails_helper'

RSpec.describe Comment, :type => :model do
  it "is comment message empty" do
    comment = build(:comment, message: nil)
    comment.valid?
    expect(comment.errors[:message]).to include("can't be blank")
  end

  it "is user blank or email & name" do
    comment = build(:comment, user: nil, email: nil, name: nil)
    comment.valid?
    expect(comment.errors[:email]).to include("can't be blank")
    expect(comment.errors[:name]).to  include("can't be blank")
  end

  it "is video empty" do
    comment = build(:comment, video: nil)
    comment.valid?
    expect(comment.errors[:video]).to include("can't be blank")
  end
end
