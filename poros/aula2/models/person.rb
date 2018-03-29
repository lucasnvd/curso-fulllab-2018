require './concerns/personable'
require_relative 'concerns/my_another_class_methods_module'

class Person
  include Personable
  extend MyAnotherClassMethodsModule
end