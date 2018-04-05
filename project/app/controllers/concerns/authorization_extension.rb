module AuthorizationExtension
  extend ActiveSupport::Concern

  included do
    ALLOWED_TOKEN = '12345'

    before_action :validate_access_token!

    private

    def validate_access_token!
      header = request.headers['HTTP_ACCESS_TOKEN']
      head(:unauthorized) if header.blank? || header != ALLOWED_TOKEN
    end
  end
end
