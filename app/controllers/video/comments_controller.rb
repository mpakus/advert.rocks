class Video::CommentsController < ApplicationController
  def create
    @video = Video.find(params[:video_id])
    comment = {
        message: params[:message],
        name:    params[:name],
        email:   params[:email]
    }
    comment[:user_id] = current_user.id if user_signed_in?
    comment = @video.comments.create(comment)
    redirect_to video_path(@video) + "#com#{comment.id}", notice: t('comments.added')
  end
end