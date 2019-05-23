class VideosController < ApplicationController
   before_action :video_params,only: [:create]
  def index
    @videos=Video.order(created_at: :DESC).limit(24)
  end
  def new
    @video=Video.new
  end
  def create
   @video=Video.new(title:video_params[:title],image:video_params[:image],video:video_params[:video],user_id:current_user.id)
  @video.save
    redirect_to root_path
  end

  def destroy
    Video.delete(params[:id])
    redirect_to root_path
  end

  def edit
    @video=Video.find(params[:id])
  end

  def show
    @videos=Video.order(created_at: :DESC).limit(3)
    @video=Video.find(params[:id])
  end

  private

   def video_params
     params.require(:video).permit(:title,:image,:video)
   end

end
