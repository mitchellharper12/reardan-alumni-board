class PhotosController < ApplicationController
  def index
    @photos = Photo.joins(:grad_year).order("grad_years.year")
  end

  def new
    @photo = Photo.new
  end

  def create
    @grad_year = GradYear.find_or_create_by(year: params[:photo][:grad_year])
    @photo = Photo.new(image: params[:photo][:image], grad_year: @grad_year)

    respond_to do |format|
      format.html {
	if @photo.save
          redirect_to photos_path
	else
	  render :new
	end
      }
    end
  end

  def edit
    @photo = Photo.find(params[:id])
    @new_grad = Graduate.new
    @grad_year_id = @photo.grad_year_id
    @graduates = Graduate.where(grad_year_id: @grad_year_id)
  end

  private
    def photo_params
      params.require(:grad_year, :image)
    end

end
