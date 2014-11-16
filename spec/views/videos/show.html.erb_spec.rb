require 'rails_helper'

RSpec.describe "videos/show", :type => :view do
  before(:each) do
    @video = assign(:video, Video.create!(
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Url/)
  end
end
