class BeersController < ApplicationController
  has_scope :by_alcohol, using: [:from, :to], type: :hash
  has_scope :by_price,   using: [:from, :to], type: :hash
  has_scope :by_style
  has_scope :by_name

  before_action :load_beer, except: %i[index new create]

  # GET: /beers (returns a filtered and paginated collection)
  def index
    @beers = apply_scopes(Beer).page(params.fetch(:page, 1))
                               .per(params.fetch(:per_page, 20))
  end

  # GET: /beers/:id (returns a single record)
  def show
  end

  # GET: /beers/new
  def new
    @beer = Beer.new
  end

  # GET: /beers/:id/edit
  def edit
  end

  # POST: /beers
  def create
    @beer = Beer.create(permitted_params)

    if @beer.persisted?
      redirect_to(beer_path(@beer))
    else
      render(action: :new)
    end
  end

  # PUT: /beers/:id
  # PATCH: /beers/:id
  def update
    if @beer.update_attributes(permitted_params)
      redirect_to(beer_path(@beer))
    else
      render(action: :edit)
    end
  end

  # DELETE: /beers/:id
  def destroy
    @beer.destroy
    redirect_to(beers_path)
  end

  private

  def permitted_params
    params.require(:beer)
          .permit(:alcohol, :style, :price, :name)
  end

  def load_beer
    @beer = Beer.find(params[:id])
  end
end
