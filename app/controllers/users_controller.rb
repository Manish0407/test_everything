class UsersController < ApplicationController
	before_action :authorize_request, except: :create

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/{username}
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # PUT /users/{username}
  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  # DELETE /users/{username}
  def destroy
    @user.destroy
  end

  private

  def user_params
    params.permit(
      :full_name, :email, :password, :password_confirmation
    ).tap do |a|
    	if params[:number_of_kids].present?
    		a[:number_of_kids] = params[:number_of_kids].permit!
    	end
    end
  end
end
