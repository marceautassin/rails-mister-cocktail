class DosesController < ApplicationController
  before_action :set_dose, only: %i[new create]

  def new
    @dose = @cocktail.doses.new
  end

  def create
    @dose = @cocktail.doses.new(dose_params)

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def set_dose
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
