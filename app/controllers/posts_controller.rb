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
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      redirect_to root_path
    end
  end

  private
    def post_params
      params.require(:post).permit(:caption, :pet_id, :upload)
    end
end
