class PartiesController < ApplicationController
    before_action :logged_in_user, only: [:index, :destroy]

    def index
      @parties = Party.order(date: :desc).paginate(page: params[:page])
    end

    def show
      @party = Party.find(params[:id])
    end

    def new
      @party = Party.new
    end

    def parties
      @party = Party.new
    end

    def create
      @party = Party.new(contact_params)
      if @party.save
        UserMailer.info(@party).deliver_now
      end
      respond_to do |format|
        if @party.save
          format.html { render action: "new" }
          format.json { render json: @party, status: :created, location: @party }
          format.js   { render js: "window.location.href='"+parties_path+"'"}
        else
          format.html { render action: "new" }
          format.json { render json: @party.errors, status: :unprocessable_entity }
          format.js
        end
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

      def contact_params
        params.require(:party).permit(:name, :email, :phone, :guests, :date, :time, :size, :info)
      end

      # Before filters
      def logged_in_user
        unless logged_in?
          flash[:danger] = "Please log in."
          redirect_to login_url
        end
      end

  end
