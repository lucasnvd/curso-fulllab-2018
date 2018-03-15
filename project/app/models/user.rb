class User < ApplicationRecord

  scope :through_state, ->(state) {
    where(state: state)
  }

end