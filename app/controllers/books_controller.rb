class BooksController < ApplicationController
  def index
    @books = Book.where( "title LIKE ? ","%#{params[:keyword]}%").limit(4)
    respond_to do |format|
      format.html
      format.json 
    end
  end
end
