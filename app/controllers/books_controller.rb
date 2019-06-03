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
    
    

  
  
    

  def pay
    book=Book.find(params[:id])
    profit=book.price * book.profit
    video=Video.find(params[:keyword])
    user_id=video.user_id
    History.create(book_id:book.id,user_id:current_user.id,price:book.price)
    Profit.create(book_id:book.id,user_id:user_id,price:profit)
    Payjp.api_key = 'sk_test_35a231252b9fff212e0a38c2'
    charge = Payjp::Charge.create(
    :amount => book.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
    )
    
  end
end
