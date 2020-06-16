class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = current_user.pets.new(pet_params)

    if @pet.save
      redirect_to :pets
    else
      redirect_to :back
    end
  end

  def show
    @post = Post.new
    @posts = Post.all
    @pet = Pet.find(params[:id])
    @followed = 0
  end

  private
    def pet_params
      params.require(:pet).permit(:name, :breed, :animal)
    end
end
