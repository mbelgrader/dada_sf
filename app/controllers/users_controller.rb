class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    # replace with AJAX
    # flash[:success] = "Account updated"
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

end
