require 'faker'
# Operadores

my_var = Faker::Number.between(1, 20)


# IF
if my_var == 1
  puts 'valor 1'
elsif my_var > 5 && my_var < 10
  puts "valor entre 6 e 9: #{my_var}"
elsif my_var >= 11 && my_var <= 16
  puts "valor entre 11 e 16: #{my_var}"
else
  puts "ops... outro valor nao esperado: #{my_var}"
end

# CASE and WHEN

# verificando se um item esta dentro de um range
if (1..5).member?(my_var)
  puts "opa: #{my_var}"
end

case my_var
when 1,2,3,4,5
puts "opa: #{my_var}"
else
puts 'outro valor'
end

x = false

if !x
  puts 'false'
end

unless x
  puts 'false'
end

class User
  attr_accessor :age

  def initialize(age)
    self.age = age
  end

  # 1: usando o guard statement
  def drink
    show_user_age
    return not_allowed if age < 18
    okay_drink
  end

  # 1: usando if statement
  def drink2
    show_user_age
    if age >= 18
      okay_drink
    else
      not_allowed
    end

    # inline... tudo em uma linha
    if age >= 18 then okay_drink else not_allowed end
  end

  private

  def show_user_age
    puts "Age: #{age}"
  end

  def not_allowed
    puts 'you are not allowed to drink!'
  end

  def okay_drink
    puts 'all right, drink!!!'
  end
end

u = User.new(Faker::Number.between(15, 18))
u.drink