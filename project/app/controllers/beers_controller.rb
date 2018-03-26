class BeersController < ApplicationController

  # Rails standard CRUD

  has_scope :by_alcohol, using: [:from, :to], type: :hash
  has_scope :by_price,   using: [:from, :to], type: :hash
  has_scope :by_style
  has_scope :by_name

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

  end

  # GET: /beers/:id/edit
  def edit

  end

  # POST: /beers
  def create

  end

  # PUT: /beers/:id
  # PATCH: /beers/:id
  def update

  end

  # DELETE: /beers/:id
  def destroy

  end

end
