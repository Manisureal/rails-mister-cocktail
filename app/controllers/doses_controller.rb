class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    # Find an existing cocktail by its id('cocktail_id') from the params
    @cocktail = Cocktail.find(params[:cocktail_id])

    # Create a new dose with inputs taken from user(description, ingredient)
    @dose = Dose.new(dose_params)
    # @dose #=> #<Dose id: nil description: "1ml", ingredient_id: 2, cocktail_id: nil>

    # Assign the empty cocktail_id with the id of the found cocktail
    @dose.cocktail = @cocktail

    if @dose.save
    # raise
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
