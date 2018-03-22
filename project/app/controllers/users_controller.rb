class UsersController < ApplicationController

  # ==== Rails Standard CRUD
  # Create
  # Read
  # Update
  # Destroy

  has_scope :by_state
  has_scope :by_email
  has_scope :by_name

  before_action :load_user, only: [:destroy, :update, :edit, :show]

  # GET: /users
  def index
    @users = apply_scopes(User).page(params.fetch(:page, 1))
                               .per(params.fetch(:per_page, 20))
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

  def load_user
    @user = User.find_by(id: params[:id])
  end

  def permitted_params
    params.require(:user)
          .permit(:address, :number, :state, :city, :email, :name)
  end
end
