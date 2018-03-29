# Exemplo 1 - Declarando uma classe e seus atributos com attr_accessor
class User
  # O attr_accessor cria o getter e o setter de um atributo
  attr_accessor :name, :age

  # setter manual
  def email=(value)
    @email = value
  end

  # getter manual
  def email
    @email
  end

  # Construtor da classe
  def initialize(name, age = nil)
    self.name = name
    self.age  = age
  end
end

# criando uma instancia da classe user passando o nome
# e idade
u = User.new('lucas')

u.email = 'lucas@fulllab.com.br'
u.age   = 67

puts "nome do usuario: #{u.name}"
puts "idade do usuario: #{u.age}"
puts "email do usuario: #{u.email}"