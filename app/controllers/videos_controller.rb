class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_video,          only:   [:show, :favorite, :rate]

  respond_to :html
  respond_to :json, only: [:favorite, :rate]

  def index
    @videos = Video.includes(:user).ordered.censored.page(params[:page]).per(6)
    render partial: 'videos', locals: {videos: @videos} if params[:iscroll].present?
  end

  def show
    respond_with(@video)
  end

  def new
    @video = Video.new
    respond_with(@video)
  end

  def create
    if @video = current_user.videos.create!(VideoManager.get_info(params[:video][:url]))
      redirect_to video_path(@video), notice: t('videos.created')
    end
  rescue => e
    @video = Video.new
    @video.errors.add(:url, e.message)
    render :new
  end

  def favorite
    @favorite = current_user.favorite_video(@video)
    respond_with(@favorite)
  end

  def rate
    if params[:act] == 'like'
      @video.like!(current_user)
    else
      @video.dislike!(current_user)
    end
  end

  private
    def set_video
      @video = Video.find(params[:id])
    end
end
