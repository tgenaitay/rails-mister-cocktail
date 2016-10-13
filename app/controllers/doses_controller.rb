class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :edit, :update, :destroy]
  before_action :set_cocktail, only: [:new, :create, :destroy]

  def index
    @doses = Dose.all
  end

  def show
  end

  def new
    @dose = Dose.new
  end

  def edit
  end

  def create
    @dose = @cocktail.doses.build(dose_params)

    respond_to do |format|
      if @dose.save
        format.html { redirect_to @cocktail, notice: 'Dose was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @dose.update(dose_params)
        format.html { redirect_to @cocktail, notice: 'Dose was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to @cocktail, notice: 'Dose was successfully destroyed.' }
    end
  end

  private
    def set_dose
      @dose = Dose.find(params[:id])
    end

    def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end

    def dose_params
      params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
    end
end
