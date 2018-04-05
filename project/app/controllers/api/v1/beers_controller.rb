
module Api
  module V1
    class BeersController < ApiControllerBase
      include BeersExtensions

      def index
        represented = BeerRepresenter.for_collection.new(@beers).to_hash
        render(json: represented)
      end
    end
  end
end

