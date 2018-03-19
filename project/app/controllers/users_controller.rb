class UsersController < ApplicationController

  # CRUD
  # Create
  # Read
  # Update
  # Destroy

  # GET: /users
  def index
    @users = User.limit(50)
  end

  # GET: /users/:id
  def show
    @user = User.select(:name, :email).find_by(id: params[:id])
  end

  # GET: /users/new
  def new
  end

  # GET: /users/:id/edit
  def edit
  end

  # POST: /users
  def create
  end

  # PUT: /users/:id
  def update
  end

  # GET: /users/my_action/:email
  def my_action
    # params[:email]
  end

  # DELETE: /users/:id
  def destroy
  end
end
