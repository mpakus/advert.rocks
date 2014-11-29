require 'rails_helper'

RSpec.describe VideosController, :type => :controller do

  describe "GET #index" do
    context "usual visitor" do
      before(:each) do
        create_list(:video, 10)
      end

      it "can watch :index page" do
        get :index
        expect(response).to have_http_status 200
        expect(response).to render_template :index
      end

      it "shows 32 videos per page" do
        get :index
        expect(assigns(:videos).count).to eq 6
      end

      it "shows 24 videos on 2nd page" do
        get :index, page: 2
        expect(assigns(:videos).count).to eq 4
      end

    end

    context "loggined user" do
      # nothing yet, same
    end
  end

  describe "GET #show" do
    context "usual visitor" do
      let(:video){ create(:video) }

      it "assigns video to @video" do
        get :show, id: video
        expect(assigns(:video)).to eq video
      end

      it "see requested video page" do
        get :show, id: video
        expect(response).to have_http_status 200
        expect(response).to render_template :show
      end

      it "shows 404 when video is wrong" do
        get :show, id: 'wrong_id'
        expect(response).to have_http_status 404
      end
    end
  end

  describe "GET #new" do
    context "usual visitor" do
      it "requires login" do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "loggined user" do
      it "shows form" do
        sign_in create(:user)
        get :new
        expect(response).to have_http_status 200
        expect(response).to render_template :new
      end
    end
  end

  describe "POST #create" do
    context "usual visitor" do
      it "requires login" do
        post :create, video: attributes_for(:video)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "loggined user" do
      before(:each) do
        sign_in create(:user)
      end

      it "is create a new video" do
        VCR.use_cassette('youtube_video_with_image') do
          expect{post :create, video: attributes_for(:video)}.to change(Video, :count).by(1)
        end
      end

      it "redirects to #show page after creating a new video" do
        VCR.use_cassette('youtube_video_with_image') do
          post :create, video: attributes_for(:video)
        end
        expect(response).to redirect_to video_path(assigns[:video])
      end

      it "fail with validation error when url is empty" do
        VCR.use_cassette('youtube_video_with_image') do
          post :create, video: {url: ''}
        end
        expect(response).to render_template :new
      end
    end
  end

end
