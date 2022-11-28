class UsersController < ApplicationController
  wrap_parameters :user, include: [:password, :password_confirmation, :first_name, :last_name, :email, :admin, :points, :progress => []]
  before_action :authorize_request, except: :create
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    user_email = params[:email]
    if user_email
      @users = User.find_by_email(user_email)
    else
      @users = User.all
    end
    render json: @users, include: [:groups]
  end

  # GET /users/1
  def show
    render json: @user, include: [:groups]
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      # params.fetch(:user, {})
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :admin, :points,:progress => [])
    end
end
