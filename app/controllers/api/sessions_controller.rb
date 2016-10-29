class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      session_params[:username],
      session_params[:password]
    )

    if @user
      login(@user)
    else
      render json: ['Incorrect username or password'], status: 422
    end
  end

  def destroy
    if current_user
      logout(current_user)
      render json: {}
    else
      render json: ["No user to sign out"], status: 404
    end
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
