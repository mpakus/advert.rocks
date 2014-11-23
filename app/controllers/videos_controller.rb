class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_video, only: [:show]

  respond_to :html

  def index
    @videos = Video.ordered.page(params[:page]).per(32)
    respond_with(@videos)
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

#=============>>> @todo

  # def edit
  # end

  # def update
  #   @video.update(video_params)
  #   respond_with(@video)
  # end
  #
  # def destroy
  #   @video.destroy
  #   respond_with(@video)
  # end

  private
    def set_video
      @video = Video.find(params[:id])
    end

    # def video_params
    #   params.require(:video).permit(:url)
    # end
end
