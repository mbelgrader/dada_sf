class PhotosController < ApplicationController
  before_action :logged_in_user, only: [:destroy]

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
    @photos = Photo.all.order(id: :desc)
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

  def destroy
    @photo = Photo.find(params[:id])
    Photo.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to gallery_url }
      format.js
    end
  end

  private

    def photo_params
      params.require(:photo).permit(:image)
    end

    # Before filters
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

end
