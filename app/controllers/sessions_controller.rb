 class SessionsController < ApplicationController

  def new

  end

  def create
    if user = User.authenticate_by(email: params[:email], password: params[:password])
      login user
      redirect_to root_path, notice: "You have logged in successfully"

    else
      flash[:alert] = "Invalid Password or Email"
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
    logout current_user
    redirect_to root_path, notice: "You have been logged out"
  end
 end
