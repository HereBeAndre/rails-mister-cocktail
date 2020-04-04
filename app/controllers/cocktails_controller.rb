class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    # @ingredient = Ingredient.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)
    if @cocktail.save
      redirect_to @cocktail, notice: 'Cocktail has been created.'
    else
      render :new
    end
  end

  private
  def cocktails_params
    params.require(:cocktail).permit(:name)
  end
end
