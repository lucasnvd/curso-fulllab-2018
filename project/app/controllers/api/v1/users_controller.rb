
module Api
  module V1
    class UsersController < ApiControllerBase
      include UsersExtensions

      def index
        represented = UserRepresenter.for_collection.new(@users).to_hash
        render(json: represented)
      end
    end
  end
end

