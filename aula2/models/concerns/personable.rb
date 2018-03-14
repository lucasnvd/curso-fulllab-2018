require 'faker'

module Personable
  attr_accessor :name, :email, :age

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def create_fake_user
      new.tap do |user|
        user.name  = Faker::Name.name
        user.email = Faker::Internet.email(user.name)
        user.age   = Faker::Number.between(18, 65)
      end
    end

    def create_many_fake_users(seed = 100)
      1.upto(seed).map { create_fake_user }
    end
  end
end