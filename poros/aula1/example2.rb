# Exemplo 2: Criando atributos de leitura com os setters privados
class Car
  # attr_reader ele vai gerar somente o getter de um atributo
  attr_reader :name, :color, :model

  def initialize(name, color, model)
    @name  = name
    @color = color
    @model = model
  end
end

car1 = Car.new('Corolla', 'Azul', 'Sedan')

puts "nome do carro: #{car1.name}"
puts "cor do carro: #{car1.color}"
puts "modelo do carro: #{car1.model}"

# Tentando alterar a propriedade nome do carro
# e esperado um erro, pois nao foi declarado um setter publico
# somente o getter, ele nao vai achar o metodo name=
car1.name = 'Civic'