class UsersController < ApplicationController
  def index
    @user=User.find(current_user.id)
    @videos=@user.videos
  end
  def show
  end
  def history
    @user=User.find(current_user.id)
    @videos=@user.videos
    @histories=@user.histories
  end
  def profit
    @user=User.find(current_user.id)
    @profits=@user.profits
    @total__price=0
    @profits.each do |profit|
      @total__price = @total__price + profit.price 
    end
  end
  def test
  end
end
