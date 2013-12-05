class AnimalsController < ApplicationController
def index
  @animals = Animal.all
end

def show
    @animal = Animal.find(params[:id])
  end

  def edit
    @animal = Animal.find(params[:id])
      end

  def update
    @animal = Animal.find(params[:id])
     if @animal.update(params[:animal])
      redirect_to action: :index, id: @animal.id
    else
  Rails.logger.info(@animal.errors.messages.inspect)
    render action: :edit
   
  end
  end
def feed
  @animal = Animal.find(params[:id])
  if @animal.food < 1
     redirect_to animals_url, notice: 'Buy more food'
  else
  @animal.food = @animal.food - 1
  @animal.save!
  redirect_to animals_url, notice: 'Animal was fed'
end
end
def more
  @animal = Animal.find(params[:id])
  @animal.food = @animal.food + 1
  @animal.save!
  redirect_to animals_url, notice: 'Bought more food'
end

  
  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(params[:animal].permit(:breed, :owner, :name))
    if @animal.save
      flash[:notice] = "you have a new animal"
      redirect_to action: :index, id: @animal.id
    else
      render :new
    end
  end
def destroy
   @animal = Animal.find(params[:id])
   @animal.destroy
   redirect_to animals_url
end

 
end

