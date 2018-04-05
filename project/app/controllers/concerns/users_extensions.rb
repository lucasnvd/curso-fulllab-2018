module UsersExtensions
  extend ActiveSupport::Concern

  included do
    has_scope :by_state
    has_scope :by_email
    has_scope :by_name

    before_action :load_users, only: :index
    before_action :load_user, only: [:destroy, :update, :edit, :show]

    def load_users
      @users = apply_scopes(User).page(params.fetch(:page, 1))
                                 .per(params.fetch(:per_page, 20))
    end

    def load_user
      @user = User.find_by(id: params[:id])
    end
  end
end
