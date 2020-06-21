class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.sort_by(&:id).reverse
    @if = 0
  end

  def follow
    @user = current_user
    @user.follows << params[:user_id]

    if @user.save
      redirect_to request.referrer
    else
      redirect_to :new_pet
    end
  end

  def unfollow
    @user = current_user
    @user.follows.delete(params[:user_id])

    if @user.save
      redirect_to request.referrer
    else
      redirect_to :new_pet
    end
  end

  def show
    @user = User.find(params[:id])
    @pets = Pet.all
  end
end
