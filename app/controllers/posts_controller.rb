class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to :action => "show", :id => "#{@post.pet_id}"
    else
      redirect_to :pets
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:caption, :pet_id, uploads: [])
    end
end
