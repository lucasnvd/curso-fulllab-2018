
module Api
  class ApiControllerBase < ActionController::Base
    include AuthorizationExtension

  end
end
