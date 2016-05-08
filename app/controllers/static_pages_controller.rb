class StaticPagesController < ApplicationController
  def home
    @events = Event.order(date: :desc).paginate(page: params[:page])
  end

  def about
  end

  def gallery
  end

  def reservations
  end

  def location
  end
end
