class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @videos = Video.all
    respond_with(@videos)
  end

  def show
    respond_with(@video)
  end

  def new
    @video = Video.new
    respond_with(@video)
  end

  def edit
  end

  def create
    @video = Video.new(video_params)
    @video.save
    respond_with(@video)
  end

  def update
    @video.update(video_params)
    respond_with(@video)
  end

  def destroy
    @video.destroy
    respond_with(@video)
  end

  private
    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:url)
    end
end
