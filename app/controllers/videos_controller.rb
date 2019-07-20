class VideosController < ApplicationController
   before_action :video_params,only: [:create]
  def index
    @videos=Video.order(created_at: :DESC).limit(24)
  end
  def new
    @book=Book.new
    @video=Video.new
    @books=Book.limit(4)
  end
  def create
    @video=Video.new(title:video_params[:title],image:video_params[:image],video:video_params[:video],book_id:video_params[:book_id],information:video_params[:information],user_id:current_user.id)
    @book=Book.new
    @book.save
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
    @videos=Video.order(created_at: :DESC).limit(4)
    @video=Video.find(params[:id])
  end

  def search
    @videos = Video.where( "title LIKE ? ","%#{params[:keyword]}%")
  end

  def genre
    # @test=params.require(:genre)[:keywords]
    @tests=params.require(:genre)[:keywords]
    @books2= []
    @tests.each do |test|
      @books=Book.where("genre = ?",test)
      @books2 << @books
    end
  end

  def test
    render :layout => 'test'
  end

  
  private

   def video_params
     params.require(:video).permit(:title,:image,:video,:information,:book_id)
   end


end
