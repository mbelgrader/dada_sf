class EventsController < ApplicationController
  before_action :logged_in_user, only: [:destroy]

  def index
    @events = Event.order(date: :desc).paginate(page: params[:page])
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash.now[:success] = "Event added"
      render 'new'
    else
      render 'new'
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Reservation deleted"
    redirect_to events_url
  end

  private

    def contact_params
      params.require(:event).permit(:name, :date, :time, :info)
    end

    # Before filters
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

end
