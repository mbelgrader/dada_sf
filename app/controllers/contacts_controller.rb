class ContactsController < ApplicationController


  def index
    @contacts = Contact.paginate(page: params[:page])
    @willis = Contact.last
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
      redirect_to root_path
    else
      render 'reservations'
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :guests, :date, :time)
    end

end
