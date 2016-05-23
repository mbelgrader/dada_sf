class PartiesController < ApplicationController
  before_action :logged_in_user, only: [:index, :destroy, :update, :edit]

  def index
    @parties = Party.order(date: :desc).paginate(page: params[:page])
  end

  def show
    @party = Party.find(params[:id])
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)
    if @party.save
      UserMailer.info(@party).deliver_now
    end
    respond_to do |format|
      if @party.save
        format.html { render action: "new" }
        format.json { render json: @party, status: :created, location: @party }
        # format.js   { render js: "window.location.href='"+parties_path+"'"}
      else
        format.html { render action: "new" }
        format.json { render json: @party.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def edit
    @party = Party.find(params[:id])
  end

  def update
    @party = Party.find(params[:id])
    if @party.update_attributes(party_params)
      flash[:success] = "Updated"
      redirect_to index_url
    else
      render 'edit'
    end
  end

  def destroy
    @party = Party.find(params[:id])
    Party.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to index_url }
      format.js
    end
  end

  private

    def party_params
      params.require(:party).permit(:name, :email, :phone, :guests, :date, :time, :size, :info, :confirmed)
    end

    # Before filters
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

  end
