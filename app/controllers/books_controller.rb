class BooksController < ApplicationController
  def index
    @books = Book.where( "title LIKE ? ","%#{params[:keyword]}%").limit(4)
    respond_to do |format|
      format.html
      format.json
    end
  end
 
  def show
    @video_id=params[:video_id]
    @book=Book.find(params[:id])
  end
  def list
  end
  def test
  end
    
  
  
    

  def pay
    book=Book.find(params[:id])
    profit=book.price * book.profit
    video=Video.find(params[:keyword])
    user_id=video.user_id
    Profit.create(book_id:book.id,user_id:user_id,price:profit)
    Payjp.api_key = ENV["SECRET_TEST_KEY"]
    charge = Payjp::Charge.create(
    :amount => book.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
    if user_signed_in?
      History.create(book_id:book.id,user_id:current_user.id,price:book.price)
    end
    
  end
end
