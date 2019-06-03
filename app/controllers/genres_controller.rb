class GenresController < ApplicationController
  def index
    @genres=Genre.all
  end
  def show
    @genre=Genre.find(params[:id])
    books=Book.where("genre = ?","#{@genre.name}")
    @books=[]
    @initials = ["あ","い","う","え","お","か","が","き","ぎ","く","ぐ","け","げ","こ","ご","さ","ざ","し","じ","す","ず","せ","ぜ","そ","ぞ","た","だ","ち","ぢ","つ","づ","て","で","と","ど","な","に","ぬ","ね","の","は","ば","ぱ","ひ","び","ぴ","ふ","ぶ","ぷ","へ","べ","ぺ","ほ","ぼ","ぽ","ま","み","む","め","も","や","ゆ","よ","ら","り","る","れ","ろ","わ","を","ん"]
    @initials.each_with_index do |initial|
      book=books.where("initial = ?","#{initial}")
      if book.present?
        @books << book
      end
    end

end
end
