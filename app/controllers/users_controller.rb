class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    # replace with AJAX
      flash[:success] = "Account updated"
      redirect_to index_url
    else
      render 'edit'
    end
  end

    private

      def user_params
        params.require(:user).permit(:name, :email, :password,
                                        :password_confirmation)
      end

      # Before filters
      def logged_in_user
        unless logged_in?
          flash[:danger] = "Please log in."
          redirect_to login_url
        end
      end
end
