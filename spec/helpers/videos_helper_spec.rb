require 'rails_helper'

RSpec.describe VideosHelper, :type => :helper do
  context "gravatar_url" do
    it "return correct image url" do
      VCR.use_cassette('info_aomega_gravatar') do
        expect(helper.gravatar_url('info@aomega.co')).to eq "http://www.gravatar.com/avatar/16f6bba9185ed4c27742821e2dba689a"
      end
    end
  end

  context "emojify" do
    it "transform text with :heart: to image" do
      expect(helper.emojify("Made with :heart:")).to eq "Made with <img alt=\":heart:\" class=\"emoji\" height=\"32\" src=\"http://localhost:3000/assets/emoji/heart.png\" title=\"heart\" width=\"32\" />"
    end
  end

  context "favorite video widget" do
    it "return star-on status" do
      vasya = create(:user)
      video = create(:video)
      vasya.favorite_video(video)
      url   = favorite_video_path(video, format: :json)
      expect(helper.favorite_video(video, vasya)).to eq %Q{<span class="video-favorite glyphicon glyphicon-star" data-url="#{url}"></span>}
    end

    it "and star-empty status" do
      vasya = create(:user)
      video = create(:video)
      url   = favorite_video_path(video, format: :json)
      expect(helper.favorite_video(video, vasya)).to eq %Q{<span class="video-favorite glyphicon glyphicon-star-empty" data-url="#{url}"></span>}
    end

  end
end
