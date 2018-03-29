class ProvidersController < ApplicationController
  has_scope :by_email
  has_scope :by_name

  before_action :load_provider, except: %i[index new create]

  # GET: /providers (returns a filtered and paginated collection)
  def index
    @providers = apply_scopes(Provider).page(params.fetch(:page, 1))
                                       .per(params.fetch(:per_page, 20))
  end

  # GET: /providers/:id (returns a single record)
  def show
  end

  # GET: /providers/new
  def new
    @provider = Provider.new
  end

  # GET: /providers/:id/edit
  def edit
  end

  # POST: /providers
  def create
    @provider = Provider.create(permitted_params)

    if @provider.persisted?
      redirect_to(provider_path(@provider))
    else
      render(action: :new)
    end
  end

  # PUT: /providers/:id
  # PATCH: /providers/:id
  def update
    if @provider.update_attributes(permitted_params)
      redirect_to(provider_path(@provider))
    else
      render(action: :edit)
    end
  end

  # DELETE: /providers/:id
  def destroy
    @provider.destroy
    redirect_to(providers_path)
  end

  private

  def permitted_params
    params.require(:provider)
          .permit(:contact_email, :contact_phone, :name)
  end

  def load_provider
    @provider = Provider.find(params[:id])
  end
end
