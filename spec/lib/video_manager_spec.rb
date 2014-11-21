require 'rails_helper'
require 'open-uri'

RSpec.describe VideoManager do
  it "is get correct title and duration from YouTube link" do
    VCR.use_cassette('youtube_video') do
      video      = attributes_for(:video)
      video_info = VideoManager.get_info(video[:url])
      expect(video_info[:title]).to eq "SATYRICON - Phoenix (OFFICIAL MUSIC VIDEO) feat. Sivert Høyem"
      expect(video_info[:duration]).to eq 355
    end
  end

  it "is get correct title and duration from Vimeo link" do
    VCR.use_cassette('vimeo_video') do
      video      = attributes_for(:video_vimeo)
      video_info = VideoManager.get_info(video[:url])
      expect(video_info[:title]).to eq "Celluloid"
      expect(video_info[:duration]).to eq 152
    end
  end
end