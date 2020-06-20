class PetsController < ApplicationController
  def index
    @pets = Pet.all.sort_by(&:name)
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = current_user.pets.new(pet_params)

    if @pet.save
      redirect_to :action => "show", :id => "#{@pet.id}"
    else
      redirect_to :back
    end
  end

  def show
    @post = Post.new
    @posts = Post.all.reverse
    @pet = Pet.find(params[:id])
    @followed = 0
  end

  def destroy
    @pet = Pet.find(params[:id])
    @posts = Post.where(pet_id: "#{@pet.id}")

    if @posts.delete_all && @pet.destroy
      redirect_to root_path
    end
  end

  private
    def pet_params
      params.require(:pet).permit(:name, :breed, :animal, :upload)
    end
end
