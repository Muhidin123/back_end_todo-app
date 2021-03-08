class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      token = issue_token(@user)
      notes = Note.where(user_id: @user.id)
      if notes.length != 0
        render json: { user: {id: @user.id, username: @user.username, token: token}, notes: notes}
      else
        render json: { user: {id: @user.id, username: @user.username, token: token}, notes: []}
      end
    else
      render json: { error: 'Invalid username/password.' }, status: 401
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

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :username, :id, :email, :password, :last_name, :bio)
    end
end
