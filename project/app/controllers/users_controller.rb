class UsersController < ApplicationController
  include UsersExtensions

  # GET: /users
  def index
  end

  # GET: /users/:id
  def show
  end

  # GET: /users/new
  def new
    @user = User.new
  end

  # GET: /users/:id/edit
  def edit
  end

  # POST: /users
  def create
    @user = User.create(permitted_params)

    if @user.persisted?
      redirect_to(user_path(@user))
    else
      render(action: :new)
    end
  end

  # PUT: /users/:id
  def update
    if @user.update_attributes(permitted_params)
      redirect_to(user_path(@user))
    else
      render(action: :edit)
    end
  end

  # GET: /users/my_action/:email
  def my_action
    # params[:email]
  end

  # DELETE: /users/:id
  def destroy
    @user.destroy
    redirect_to(users_path)
  end

  private

  def permitted_params
    params.require(:user)
          .permit(:address, :number, :state, :city, :email, :name)
  end
end
