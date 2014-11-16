require 'rails_helper'

RSpec.describe "videos/index", :type => :view do
  before(:each) do
    assign(:videos, [
      Video.create!(
        :url => "Url"
      ),
      Video.create!(
        :url => "Url"
      )
    ])
  end

  it "renders a list of videos" do
    render
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
