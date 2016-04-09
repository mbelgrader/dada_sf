class PhotosController < ApplicationController

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
    @photos = Photo.all
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash.now[:success] = "Photo added!"
      redirect_to gallery_path
    else
      redirect_to gallery_path
    end
  end

  private

    def photo_params
      params.require(:photo).permit(:image)
    end

end
