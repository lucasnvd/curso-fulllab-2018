module BeersExtensions
  extend ActiveSupport::Concern

  included do
    has_scope :by_alcohol, using: [:from, :to], type: :hash
    has_scope :by_price,   using: [:from, :to], type: :hash
    has_scope :by_style
    has_scope :by_name

    before_action :load_beers, only: :index
    before_action :load_beer,  only: [:destroy, :update, :edit, :show]

    def load_beers
      @beers = apply_scopes(Beer).page(params.fetch(:page, 1))
                                 .per(params.fetch(:per_page, 20))
    end

    def load_beer
      @beer = Beer.find(params[:id])
    end
  end
end
