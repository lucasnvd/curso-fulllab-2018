class BeersController < ApplicationController
  include BeersExtensions

  # GET: /beers (returns a filtered and paginated collection)
  def index
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
end
