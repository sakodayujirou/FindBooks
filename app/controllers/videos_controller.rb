class VideosController < ApplicationController
   before_action :video_params,only: [:create]
  def index
    @videos=Video.all
  end
  def new
    @video=Video.new
  end
  def create
    Video.create(title:video_params[:title],image:video_params[:image],video:video_params[:video],user_id:current_user.id)
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
    @video=Video.find(params[:id])
  end

  private

   def video_params
     params.require(:video).permit(:title,:image,:video)
   end

end
