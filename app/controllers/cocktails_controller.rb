class CocktailsController < ApplicationController
  def index
    if params.has_key?(:search)
      @cocktails = Cocktail.where("name LIKE ?", "%#{params[:search][:query]}%")
    else
    @cocktails = Cocktail.order(updated_at: :desc)
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @ingredient = Ingredient.new
  end

  def new
    @cocktail = Cocktail.new
    @dose = Dose.new
    @ingredient = Ingredient.new
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)
    if @cocktail.save
      redirect_to @cocktail, notice: 'Cocktail has been created.'
    else
      render :new
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktails_params)
    redirect_to cocktails_path, notice: 'Cocktail has been updated.'
  end

  private

  def cocktails_params
    params.require(:cocktail).permit(:name)
  end
end
