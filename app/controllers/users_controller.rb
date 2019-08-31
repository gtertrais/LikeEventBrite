class UsersController < ApplicationController
  before_action :set_user
  before_action :is_admin?, only: [:edit, :update, :destroy]

  # GET /users
  # GET /users.json
  # GET /users/1
  # GET /users/1.json
  def show
    @user = current_user
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      redirect_to root_path unless current_user 
    end

    def is_admin?
      @user = User.find(params[:id])
      redirect_to root_path unless current_user == @user
  end


  end

  
  

  
