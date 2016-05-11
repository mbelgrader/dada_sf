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

  def parties
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      UserMailer.info(@contact).deliver_now
    end
    respond_to do |format|
      if @contact.save
        format.html { render action: "new" }
        format.json { render json: @contact, status: :created, location: @contact }
        format.js   { render js: "window.location.href='"+reservations_path+"'"}
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    Contact.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to index_url }
      format.js
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :guests, :date, :time, :size, :info)
    end

    # Before filters
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

end
