class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to :action => "show", :id => "#{@post.id}"
    else
      redirect_to :pets
    end
  end

  def show
    @post = Post.find(params[:id])
    @pet = Pet.find(@post.pet_id)
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      redirect_to root_path
    end
  end

  def like
    @user = current_user
    @post = Post.find(params[:post_id])
    @post.increment! :like
    @user.likes << params[:post_id]
    if @user.save
      redirect_back(fallback_location: root_path)
    end
  end

  def unlike
    @user = current_user
    @post = Post.find(params[:post_id])
    @post.decrement! :like
    @user.likes.delete(params[:post_id])
    if @user.save
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def post_params
      params.require(:post).permit(:caption, :pet_id, :upload)
    end
end
