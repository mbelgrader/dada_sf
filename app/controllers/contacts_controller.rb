class ContactsController < ApplicationController
  before_action :logged_in_user, only: [:index, :destroy]

  def index
    @contacts = Contact.order(date: :desc).paginate(page: params[:page])
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash.now[:success] = "Thank you! We will be in touch."
      render 'new'
    else
      render 'new'
    end
  end

  def destroy
    Contact.find(params[:id]).destroy
    flash[:success] = "Reservation deleted"
    redirect_to index_url
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :guests,
                                      :date, :time, :size, :info)
    end

    # Before filters
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

end
