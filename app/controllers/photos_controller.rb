class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @grad_years = params[:photo][:grad_year].split(/,\s*/).
	    map{|year| GradYear.find_or_create_by(year: (year.length == 2 ? ('19' + year) : year) ) }
    @photo = Photo.new(image: params[:photo][:image], grad_years: @grad_years)

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
    @grad_year_id = @photo.grad_years.first.try(&:id)
    @graduates = Graduate.where(grad_year_id: @grad_year_id)
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.delete
    redirect_to :root
  end

  private
    def photo_params
      params.require(:grad_year, :image)
    end

end
