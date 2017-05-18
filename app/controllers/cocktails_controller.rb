class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktails_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end

    def destroy
      @cocktail = Cocktail.find(params[:cocktail_id])
      Dose.find(params[:id]).destroy
      redirect_to cocktail_path(@cocktail)
    end
  end

  private

  def cocktails_params
    params.require(:cocktail).permit(:name)

  end

end
