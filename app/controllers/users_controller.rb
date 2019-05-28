class UsersController < ApplicationController
  def index
    @user=User.find(current_user.id)
    @videos=@user.videos
    @histories=@user.histories
  end
  def show
  end
end
