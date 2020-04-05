class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @ingredient = Ingredient.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)
    if @cocktail.save
      redirect_to cocktails_path, notice: 'Cocktail has been created.'
    else
      render :new
    end
  end

  private
  def cocktails_params
    params.require(:cocktail).permit(:name)
  end
end
