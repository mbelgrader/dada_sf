class EventsController < ApplicationController
  before_action :logged_in_user, only: [:destroy, :update, :edit]

  def index
    @events = Event.order(date: :desc).paginate(page: params[:page])
    @photos = Photo.all
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
      redirect_to events_url
    else
      redirect_to events_url
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Updated"
      redirect_to events_url
    else
      render 'edit'
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to events_url
  end

  private

    def event_params
      params.require(:event).permit(:name, :date, :time, :info, :flyer)
    end

    # Before filters
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

end
