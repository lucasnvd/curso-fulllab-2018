require 'faker'

# --------------------------------------------------------------------------- #
# Utilizando módulos.
# --------------------------------------------------------------------------- #
# Módulos são componentes no Ruby utilizados para agrupar métodos, atributos,
# classes e outros módulos. Sua utilização torna o código mais legível,
# distruibído e organizado.
#
# Para criar um módulo, basta usar a sintaxe:
#
# module $ModuleName.
#  # code goes here...
# end
#
# Repare que o nome do módulo segue o mesmo padrão da nomeação de uma classe,
# utiliza-se todas as iniciais com a letra maíscula, ex.: UserFactory
# Não é possível criar uma instância de um módulo, ou seja, se tentar utilizar MyModule.new,
# vai lançar o erro que o método 'new' não existe.
module MyModule

end

# --------------------------------------------------------------------------- #
# Incluindo módulos em uma classe
# --------------------------------------------------------------------------- #
#
# Como dito anteriormente, com os módulos, conseguimos agrupar métodos, atributos, etc,
# em um mesmo código. Graças a este recurso, conseguimos compartilhar um módulo com
# diversas classes. Como mostra o exemplo abaixo:
module Personable
  attr_accessor :name, :email
end

# O módulo inclui dois atributos, name e email. Agora vamos incluir esses dois atributos
# em outras classes
class SwordMaster
  include Personable

end

# Pronto, utilizando o include, injetamos um módulo dentro de uma classe. Agora conseguimos
# utilizar ambos atributos na classe User.
sm = SwordMaster.new
sm.name  = 'Bill'
sm.email = 'bill@gmail.com'

puts "User's name: #{sm.name}"
puts "User's email: #{sm.email}"

# Podemos incluir em outra classe também
class SwordSmith
  include Personable

end

ss = SwordSmith.new
ss.name  = 'Hanzo Hattori'
ss.email = 'hanzo.hattori@gmail.com'

puts "User 2 name: #{ss.name}"
puts "User 2 email: #{ss.email}"







module Personable
  attr_accessor :name, :email, :age

  def self.included(base)
    base.extend(ClassMethods)
  end

  def my_instance_method
    # ...
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

module MyAnotherClassMethodsModule
  def hi_people
    puts 'hi people'
  end
end

class Person
  include Personable
  extend MyAnotherClassMethodsModule
end

class Person
  def self.another_class_method
    puts 'another class method'
  end
end

def Person.hello_world
  puts 'hello world'
end

class Person
  class << self
    def hi
      puts 'hi'
    end
  end
end

class Admin < Person ; end

class Employer < Person ; end

class Admin
  include Personable
  attr_accessor :role
end

class Employer
  include Personable
  attr_accessor :address, :salary
end

persons = Admin.create_many_fake_users(1_000)
persons.select { |user| user.age >= 40 && user.age <= 45 }
       .each do |user|
         puts "Name: #{user.name} | Age: #{user.age}"
       end
