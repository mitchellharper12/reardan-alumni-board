class GraduatesController < ApplicationController
  before_action :set_graduate, only: [:show, :edit, :update, :destroy]

  # GET /graduates
  # GET /graduates.json
  def index
    if params[:grad_year_id]
      @graduates = Graduate.where(grad_year_id: params[:grad_year_id])
    else
      @graduates = Graduate.all
    end
  end

  # GET /graduates/1
  # GET /graduates/1.json
  def show
  end

  # GET /graduates/new
  def new
    @graduate = Graduate.new
  end

  # GET /graduates/1/edit
  def edit
  end

  # POST /graduates
  # POST /graduates.json
  def create
    @graduate = Graduate.new(graduate_params)

    respond_to do |format|
      if @graduate.save
	if request.xhr?
	  return render :show, formats: :json
	end
        format.html { redirect_to @graduate, notice: 'Graduate was successfully created.' }
        format.json { render :show, status: :created, location: @graduate }
      else
        format.html { render :new }
        format.json { render json: @graduate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /graduates/1
  # PATCH/PUT /graduates/1.json
  def update
    respond_to do |format|
      if @graduate.update(graduate_params)
        format.html { redirect_to @graduate, notice: 'Graduate was successfully updated.' }
        format.json { render :show, status: :ok, location: @graduate }
      else
        format.html { render :edit }
        format.json { render json: @graduate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graduates/1
  # DELETE /graduates/1.json
  def destroy
    @graduate.destroy
    respond_to do |format|
      format.html { if request.xhr?
		      head :no_content
		    else 
		      redirect_to graduates_url, notice: 'Graduate was successfully destroyed.' 
		    end
      }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_graduate
      @graduate = Graduate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def graduate_params
      params.require(:graduate).permit(:firstname, :middlename, :lastname, :grad_year_id, :x, :x2, :y, :y2)

    end
end
