class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all.reverse
  end

  def follow
    @user = current_user
    @user.follows << params[:user_id]

    if @user.save
      redirect_to :pets
    else
      redirect_to :new_pet
    end
  end

  def unfollow
    @user = current_user
    @user.follows.delete(params[:user_id])

    if @user.save
      redirect_to :pets
    else
      redirect_to :new_pet
    end
  end

  def show
    @user = User.find(params[:id])
    @pets = Pet.all
  end
end
