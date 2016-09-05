class GradYearsController < ApplicationController
  before_action :set_grad_year, only: [:show, :edit, :update, :destroy]

  # GET /grad_years
  # GET /grad_years.json
  def index
    @grad_years = GradYear.all
  end

  # GET /grad_years/1
  # GET /grad_years/1.json
  def show
  end

  # GET /grad_years/new
  def new
    @grad_year = GradYear.new
  end

  # GET /grad_years/1/edit
  def edit
  end

  # POST /grad_years
  # POST /grad_years.json
  def create
    @grad_year = GradYear.new(grad_year_params)

    respond_to do |format|
      if @grad_year.save
        format.html { redirect_to @grad_year, notice: 'Grad year was successfully created.' }
        format.json { render :show, status: :created, location: @grad_year }
      else
        format.html { render :new }
        format.json { render json: @grad_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grad_years/1
  # PATCH/PUT /grad_years/1.json
  def update
    respond_to do |format|
      if @grad_year.update(grad_year_params)
        format.html { redirect_to @grad_year, notice: 'Grad year was successfully updated.' }
        format.json { render :show, status: :ok, location: @grad_year }
      else
        format.html { render :edit }
        format.json { render json: @grad_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grad_years/1
  # DELETE /grad_years/1.json
  def destroy
    @grad_year.destroy
    respond_to do |format|
      format.html { redirect_to grad_years_url, notice: 'Grad year was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grad_year
      @grad_year = GradYear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grad_year_params
      params.require(:grad_year).permit(:year)
    end
end
